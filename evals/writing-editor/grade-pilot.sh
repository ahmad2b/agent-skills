#!/usr/bin/env bash
set -euo pipefail

RUN_ROOT="${1:?run directory required}"
MODE="${2:?mode required}"
CHECKS="$RUN_ROOT/checks.md"
OUTPUT="$RUN_ROOT/output"

pass=0
fail=0

record() {
  local status="$1"
  local message="$2"
  if [[ "$status" == "PASS" ]]; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
  fi
  printf -- '- %s: %s\n' "$status" "$message" >> "$CHECKS"
}

printf '# Deterministic Pilot Checks\n\n' > "$CHECKS"

if [[ "$(cat "$RUN_ROOT/exit-status.txt")" == "0" ]]; then
  record PASS "Codex run exited successfully."
else
  record FAIL "Codex run returned a non-zero exit status."
fi

for file in brief.md research.md article.md; do
  if [[ -s "$OUTPUT/$file" ]]; then
    record PASS "$file exists and is non-empty."
  else
    record FAIL "$file is missing or empty."
  fi
done

if [[ "$MODE" == "autonomous" ]]; then
  if [[ -s "$OUTPUT/fragments.md" ]]; then
    record PASS "fragments.md exists and is non-empty."
  else
    record FAIL "fragments.md is missing or empty."
  fi
fi

if [[ -s "$OUTPUT/article.md" ]]; then
  words="$(wc -w < "$OUTPUT/article.md")"
  if (( words >= 800 )); then
    record PASS "article.md contains $words words."
  else
    record FAIL "article.md contains only $words words."
  fi

  if rg -qi '\b(TODO|TBD|placeholder)\b' "$OUTPUT/article.md"; then
    record FAIL "article.md contains unresolved placeholder markers."
  else
    record PASS "article.md contains no common placeholder markers."
  fi

  if rg -qi 'publication state:\s*(approved|published)|\bthe user approved\b' "$OUTPUT/article.md" "$OUTPUT/brief.md"; then
    record FAIL "The workspace appears to claim approval or publication."
  else
    record PASS "The workspace does not claim user approval or publication."
  fi
fi

if [[ "$MODE" == "replay" ]]; then
  if rg -qi 'many trees|single tree|one tree|organizing (trunk|frame)|structural' "$OUTPUT/brief.md"; then
    record PASS "brief.md records the structural feedback or its diagnosis."
  else
    record FAIL "brief.md does not visibly record the structural feedback diagnosis."
  fi
fi

printf '\nPass: %d  \nFail: %d\n' "$pass" "$fail" >> "$CHECKS"

if (( fail > 0 )); then
  exit 1
fi
