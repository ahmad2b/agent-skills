#!/usr/bin/env bash
set -euo pipefail

BASELINE_COMMIT="3497731a7433341d0dbd6d0b612cd531eb5b3199"
REVISED_COMMIT="b7649dd6e6ebf3baf2620982826afdac8dc3cf52"
MODEL="gpt-5.6-sol"
REASONING_EFFORT="medium"

usage() {
  echo "Usage: $0 <autonomous|replay> <baseline|revised> [run-label]" >&2
  exit 2
}

MODE="${1:-}"
VARIANT="${2:-}"
RUN_LABEL="${3:-$(date -u +%Y%m%dT%H%M%SZ)}"

case "$MODE" in
  autonomous|replay) ;;
  *) usage ;;
esac

case "$VARIANT" in
  baseline) EDITOR_COMMIT="$BASELINE_COMMIT" ;;
  revised) EDITOR_COMMIT="$REVISED_COMMIT" ;;
  *) usage ;;
esac

REPO_ROOT="$(git rev-parse --show-toplevel)"
EVAL_ROOT="$REPO_ROOT/evals/writing-editor"
CASE_ROOT="$EVAL_ROOT/cases/001-trustworthy-agents"
RESULT_ROOT="$EVAL_ROOT/runs/${RUN_LABEL}-${MODE}-${VARIANT}"
STAGE_PARENT="$EVAL_ROOT/.staging"
mkdir -p "$STAGE_PARENT"
STAGE_ROOT="$(mktemp -d "$STAGE_PARENT/${MODE}-${VARIANT}-XXXXXX")"
WORKSPACE="$STAGE_ROOT/workspace"
RUN_CODEX_HOME="$STAGE_ROOT/codex-home"
REAL_CODEX_HOME="${CODEX_HOME:-/home/ahmad/.codex}"
CODEX_PACKAGE="/home/ahmad/.nvm/versions/node/v24.15.0/lib/node_modules/@openai/codex"
DOCKER_IMAGE="node:22-slim"

mkdir -p "$RESULT_ROOT" "$WORKSPACE/input" "$WORKSPACE/output" \
  "$WORKSPACE/.agents/skills" "$RUN_CODEX_HOME"

if [[ ! -f "$REAL_CODEX_HOME/auth.json" ]]; then
  echo "Missing Codex authentication at $REAL_CODEX_HOME/auth.json" >&2
  exit 1
fi
cp "$REAL_CODEX_HOME/auth.json" "$RUN_CODEX_HOME/auth.json"
chmod 600 "$RUN_CODEX_HOME/auth.json"

cleanup_auth() {
  unlink "$RUN_CODEX_HOME/auth.json" 2>/dev/null || true
}
trap cleanup_auth EXIT

extract_skill() {
  local commit="$1"
  local skill="$2"
  local extract_root="$STAGE_ROOT/extract-$skill-$commit"
  mkdir -p "$extract_root"
  git archive "$commit" "skills/$skill" | tar -x -C "$extract_root"
  cp -a "$extract_root/skills/$skill" "$WORKSPACE/.agents/skills/$skill"
}

# Only writing-editor differs between the paired arms.
extract_skill "$EDITOR_COMMIT" "writing-editor"
extract_skill "$BASELINE_COMMIT" "writing"

# These companion skills are not versioned in this repository; pin the same
# installed snapshots into both arms and record their hashes.
cp -a /home/ahmad/.agents/skills/writing-fragments "$WORKSPACE/.agents/skills/writing-fragments"
cp -a /home/ahmad/.agents/skills/grill-me "$WORKSPACE/.agents/skills/grill-me"

cp '/home/ahmad/Downloads/The Agentic Operating Model.pdf' "$WORKSPACE/input/source.pdf"
pdftotext "$WORKSPACE/input/source.pdf" "$WORKSPACE/input/source.txt"
cp "$CASE_ROOT/${MODE}-task.md" "$WORKSPACE/input/task.md"

if [[ "$MODE" == "replay" ]]; then
  cp /home/ahmad/agent-reliability-article-draft-3.md "$WORKSPACE/input/draft-3.md"
fi

{
  echo "run_label=$RUN_LABEL"
  echo "mode=$MODE"
  echo "variant=$VARIANT"
  echo "editor_commit=$EDITOR_COMMIT"
  echo "companion_commit=$BASELINE_COMMIT"
  echo "model=$MODEL"
  echo "reasoning_effort=$REASONING_EFFORT"
  echo "docker_image=$DOCKER_IMAGE"
  codex --version
  sha256sum "$WORKSPACE/input/"*
  find "$WORKSPACE/.agents/skills" -name SKILL.md -print0 | sort -z | xargs -0 sha256sum
} > "$RESULT_ROOT/manifest.txt"

set +e
docker run --rm \
  --user "$(id -u):$(id -g)" \
  --workdir /workspace \
  --read-only \
  --cap-drop ALL \
  --security-opt no-new-privileges \
  --pids-limit 256 \
  --memory 4g \
  --cpus 2 \
  --tmpfs /tmp:rw,nosuid,nodev,size=1g \
  --tmpfs /eval-home:rw,nosuid,nodev,size=64m \
  --env HOME=/eval-home \
  --env CODEX_HOME=/codex-home \
  --mount "type=bind,src=$WORKSPACE,dst=/workspace" \
  --mount "type=bind,src=$RUN_CODEX_HOME,dst=/codex-home" \
  --mount "type=bind,src=$CODEX_PACKAGE,dst=/opt/codex,readonly" \
  --mount "type=bind,src=/etc/ssl/certs/ca-certificates.crt,dst=/etc/ssl/certs/ca-certificates.crt,readonly" \
  --entrypoint node \
  "$DOCKER_IMAGE" \
  /opt/codex/bin/codex.js \
  --dangerously-bypass-approvals-and-sandbox \
  --disable apps \
  --disable plugins \
  --disable remote_plugin \
  --disable plugin_sharing \
  --disable in_app_browser \
  exec \
  --ephemeral \
  --json \
  --ignore-user-config \
  --ignore-rules \
  --skip-git-repo-check \
  --model "$MODEL" \
  --config "model_reasoning_effort=\"$REASONING_EFFORT\"" \
  --cd /workspace \
  --output-last-message /workspace/.pilot-last-message.md \
  'Use $writing-editor. Read input/task.md and complete that assignment.' \
  > "$RESULT_ROOT/transcript.jsonl" \
  2> "$RESULT_ROOT/stderr.log"
RUN_STATUS=$?
set -e

echo "$RUN_STATUS" > "$RESULT_ROOT/exit-status.txt"
if [[ -f "$WORKSPACE/.pilot-last-message.md" ]]; then
  cp "$WORKSPACE/.pilot-last-message.md" "$RESULT_ROOT/last-message.md"
fi
cp -a "$WORKSPACE/output" "$RESULT_ROOT/output"

"$EVAL_ROOT/grade-pilot.sh" "$RESULT_ROOT" "$MODE"

echo "$RESULT_ROOT"
exit "$RUN_STATUS"
