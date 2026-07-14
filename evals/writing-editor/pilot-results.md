# Writing Editor Docker Pilot Results

## Scope

This is a development/calibration result for Case 001, not proof of general improvement. The accepted historical article is a preference anchor, not an expected answer.

Four isolated trials used the same model (`gpt-5.6-sol`), reasoning effort (`medium`), source snapshot, task packet, companion `writing` skill, local companion skills, Docker image, permissions, and Codex CLI. The intended variable was the `writing-editor` version:

- Baseline: `3497731a7433341d0dbd6d0b612cd531eb5b3199`
- Revised: `b7649dd6e6ebf3baf2620982826afdac8dc3cf52`

## Integrity

All four trials passed all eight deterministic checks. Those checks establish execution and artifact integrity only; they do not establish editorial quality.

| Track | Variant | Input tokens | Output tokens | Commands | File changes | Integrity |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| Autonomous | Baseline | 702,600 | 16,176 | 10 | 6 | 8/8 pass |
| Autonomous | Revised | 268,555 | 9,182 | 7 | 2 | 8/8 pass |
| Replay | Baseline | 392,995 | 9,991 | 11 | 3 | 8/8 pass |
| Replay | Revised | 261,862 | 9,712 | 7 | 1 | 8/8 pass |

The revised arm reduced input tokens by about 62% in autonomous mode and 33% in replay mode. Baseline also attempted unavailable subagent delegation twice in autonomous mode and once in replay mode; revised did not.

## Autonomous Result

Both variants independently narrowed the broad source to the known strong reliability theme. Both applied the source rather than summarizing its People/Process/Technology structure.

The revised article is the slight editorial winner. Its sequence is more causal and its failure-rehearsal table turns abstract capabilities into observable readiness evidence. Baseline is also strong, but it uses three overlapping organizing surfaces: trust envelope, six readiness questions, and a minimum production loop.

Baseline provides stronger evidence of real self-revision: it wrote Draft v1, recorded concrete objections, and produced Draft v2. Revised has cleaner canonical state, but most review claims are recorded after a nearly complete draft and are not followed by a visible material rewrite.

Neither output settles title and house terminology strongly enough to eliminate author taste review.

## Replay Result

Both variants correctly accepted the historical structural objection and replaced the flat inventory with a five-part control loop.

Baseline is the stronger final article. It keeps Define, Observe, Evaluate, Bound, and Improve as one governing model and reuses that model in the late diagnostic. Its ending is more concise and converged.

Revised has the stronger canonical state and a sharp opening, but its back half adds owners, a capability matrix, a maturity-by-responsibility progression, and a first-loop checklist. These are related to the trunk, yet they partially recreate the additive framework structure the replay feedback was intended to remove. Its self-review did not catch that regression.

## Provisional Decision

Do not declare the revised skill better, and do not revert it wholesale from this case.

The evidence supports retaining its canonical-state, revision-ledger, deliverable, and efficiency improvements. It does not support treating its editorial convergence or self-review as improved. The next held-out tests should target:

1. a visible critique-and-rewrite cycle rather than post-hoc certification;
2. rejection of secondary frameworks after one governing model is selected;
3. title and opener taste;
4. reduced user rescue before acceptance.

No skill file was changed during this pilot.

## Trial Artifacts

- `runs/docker1c-autonomous-baseline/`
- `runs/docker1c-autonomous-revised/`
- `runs/docker1c-replay-baseline/`
- `runs/docker1c-replay-revised/`

Each folder contains the manifest, raw transcript, stderr, exit status, deterministic checks, final assistant message, and generated workspace artifacts.
