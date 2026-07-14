# Evaluation Methodology

Status: proposed methodology pending independent audit and user approval.

## Core Principle

Evaluate whether the skill creates the conditions for strong editorial judgment. Do not require it to imitate the historical conversation or reproduce the exact article.

The evaluation surface is observable behavior:

- source use;
- questions and explicit assumptions;
- angle exploration;
- decision records;
- critique and revision artifacts;
- accepted and rejected directions;
- workspace changes;
- final article, distribution copy, and visual;
- number of turns, retries, and user corrections required.

Private or encrypted reasoning is outside the evaluation surface.

## Two Trial Modes

### 1. Autonomous Discovery Trial

Give the candidate the original source and initial task-local direction, but none of the later user corrections, accepted thesis, final article, final image, or rejection labels.

Measure whether it independently:

- extracts the source model;
- explores multiple material angles;
- translates mechanisms into reader outcomes;
- rejects generic or narrow directions;
- establishes one coherent thesis;
- performs a substantive self-review;
- revises rather than merely declaring readiness;
- produces a complete publishing package;
- leaves a clear evidence and decision trail.

This is the primary capability trial.

### 2. Historical Replay Trial

Replay selected historical user corrections at controlled checkpoints without revealing the final answer. Measure whether the candidate:

- understands the objection;
- changes only the affected direction or artifact;
- preserves already accepted decisions;
- records the acceptance or rejection and its reason;
- avoids repeating the same failure later;
- converges without reopening settled work.

This is a regression and feedback-handling trial. It must not be confused with autonomous discovery.

## Functional Equivalence, Not Procedural Imitation

Historical manual work should be converted into capabilities and failure detectors. A candidate should not be required to produce six weak drafts merely because the reference process did.

Examples:

- Historical behavior: the user rejected multiple competing mental models.
  - Functional assertion: the final article has one dominant thesis and the candidate's review identifies and resolves competing frames.
- Historical behavior: the user rejected `control system` as too narrow.
  - Functional assertion: the candidate checks whether its organizing frame covers the source's material people, process, technology, governance, FinOps, and improvement dimensions.
- Historical behavior: the user repeatedly translated technical concepts into end-user value.
  - Functional assertion: the candidate explicitly maps mechanisms to what readers can understand, decide, avoid, trust, inspect, or improve.

## Grading Surfaces

### Hard Gates

- Uses the supplied source and does not invent first-hand experience.
- Does not leak the reference output or later labels into the candidate prompt.
- Honors explicit scope, length, and artifact constraints.
- Does not overwrite approved copy or unrelated files.
- Produces required deliverables or accurately reports unresolved blockers.
- Keeps claims traceable to source evidence.
- Leaves the workspace in a coherent, inspectable state.

### Comparative Quality

- Strength and usefulness of the thesis.
- Source synthesis rather than source summary.
- Reader value and practical application.
- Simplicity, directness, and structural coherence.
- Editorial distinctiveness without manufactured controversy.
- Quality of critique and revision decisions.
- Natural voice and distribution adaptation.
- Article-to-image semantic fit and one-second readability.

### Efficiency

- User corrections required before publishable quality.
- Repeated failures after a correction.
- Unnecessary research, drafts, artifacts, or scope expansion.
- Time, turns, tokens, and tool failures.
- Whether the candidate externalizes enough reasoning for audit without producing process clutter.

## Subjective Judgment

Use blind, randomized pairwise comparisons for subjective quality. Compare:

- baseline versus revised candidate;
- candidate versus accepted reference;
- candidate versus known rejected variants where useful.

The accepted reference is an anchor, not a ceiling. A candidate may win with a different thesis if human-calibrated evaluation finds it more source-grounded, useful, coherent, and publishable.

Automated judges must be calibrated against explicit user labels from the historical sessions. Disagreement cases remain for human review rather than being silently resolved by the judge.

## Repetition And Splits

- Run multiple trials per case because agent outputs vary.
- Keep model, tools, permissions, source packet, and resource limits identical across versions.
- Randomize A/B order for every pairwise judgment.
- Keep Case 001 in the development/calibration split.
- Create separate held-out cases that were not used to design either skill version.
- Maintain a regression split containing known failures and a capability split containing new, difficult tasks.

## Visual Evaluation

Generate actual images. Concept descriptions alone are insufficient.

Score:

- connection to the chosen thesis;
- featured-image suitability at thumbnail size;
- one-second visual comprehension;
- composition and hierarchy;
- title-text accuracy when text is used;
- editorial distinctiveness;
- consistency with the article's tone;
- avoidance of rejected literal, dashboard, notebook, or generic robot/cloud treatments unless a new treatment clearly outperforms them.

Do not use pixel similarity to the reference image.

## Required Run Artifacts

Every trial should preserve:

- exact task prompt and source manifest;
- skill commit and dependency versions;
- model, tool, permission, and resource configuration;
- complete observable transcript and tool trace, retained as a run artifact rather than committed by default;
- generated and modified files;
- deterministic assertion results;
- per-grader outputs and evidence;
- randomized pairwise labels and preferences;
- timing, token, and failure metadata;
- final summary including unresolved state.
