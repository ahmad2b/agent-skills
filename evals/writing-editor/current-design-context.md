# Current Evaluation Design Context

This note preserves the decisions made during the evaluation-design conversation so another agent does not need the live chat to understand the work.

## Why The Prior Evaluation Was Rejected

- The update changed `writing-editor`, `writing`, and `visual-creator` when the requested scope was `writing-editor`.
- Structural validation was incorrectly treated as stronger evidence than it provides.
- The forward-test prompts leaked intended fixes.
- The revised editor run did not complete file edits.
- Writing and visual tests used compressed synthetic summaries rather than the complete source and trajectory.
- No actual image was generated during the visual comparison.
- Assertions were authored by the same agent that designed the changes and were not calibrated against user preference.

## Current Direction

Build a curated golden dataset first, then compare the baseline and revised skills under identical, isolated conditions.

The user does not want a system that merely reproduces an accepted article. The intended skill should recreate the conditions that made a strong outcome possible:

- synthesize rather than summarize;
- search for reader-facing value;
- explore and challenge angles;
- identify and reject directions resembling previously rejected drafts;
- find one coherent organizing thesis;
- critique and iterate until the work is publishable;
- generate and select a fitting visual;
- create useful distribution artifacts;
- preserve decisions and evidence.

The accepted article remains a strong reference. Rediscovering its thesis is desirable evidence of editorial judgment, but exact reproduction is not the goal. A materially better thesis or execution may outperform it if the observable process and blind comparison support that conclusion.

## Important Measurement Decision

Evaluate the observable trajectory, not private reasoning. Useful evidence includes:

- questions asked;
- source-model extraction;
- angle options;
- written critiques;
- accepted and rejected directions;
- revision briefs;
- file changes;
- source citations;
- workspace state;
- final artifacts;
- time, turns, and unnecessary churn.

An agent should not be penalized for avoiding a weak draft before showing it. It should be penalized if the same weakness survives its own review and reaches the final artifact.

## Industry-Grounded Design Principles Already Identified

- Use curated real cases, regressions, trajectories, adversarial cases, deterministic assertions, human review, pairwise comparison, and human-calibrated judges.
- Treat each run as a trial and preserve its complete observable transcript in local, CI, or artifact storage rather than Git by default.
- Run multiple trials because outputs vary.
- Randomize candidate order in pairwise evaluation.
- Separate development/calibration cases from held-out cases.
- Use the final outcome and the path taken to reach it as separate grading surfaces.

## Work Still Required

1. Independently audit both source sessions and produce a bounded evidence record.
2. Convert preferences and rejections into measurable trajectory and outcome criteria.
3. Define which criteria are hard gates and which are comparative judgments.
4. Define actual image-generation evaluation rather than concept-only evaluation.
5. Create held-out cases from other sources and writing tasks.
6. Choose or implement a runner only after the case schema is stable.
