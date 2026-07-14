# Writing Editor Evaluation Brief

Status: evidence capture and evaluator design. No skill version has been accepted or rejected by this workspace.

## Objective

Compare the baseline and revised `writing-editor` skills using curated, reproducible evidence rather than ad hoc prompts or exact-output matching.

- Baseline commit: `3497731a7433341d0dbd6d0b612cd531eb5b3199`
- Revised commit: `b7649dd6e6ebf3baf2620982826afdac8dc3cf52`
- Primary calibration case: `001-trustworthy-agents`

## Capability Under Evaluation

The central capability is outcome-led synthesis and editorial convergence:

1. Extract a source model without merely summarizing its structure.
2. Explore materially different angles and translate technical mechanisms into reader value.
3. Identify weak, narrow, generic, dense, or promotional directions.
4. Reject or revise those directions before finalization.
5. Establish one organizing thesis or trunk.
6. Produce a coherent article, distribution copy, and a semantically aligned visual.
7. Preserve decisions, rejections, evidence boundaries, approvals, and unresolved state.

## Evaluation Layers

1. **Outcome quality:** source alignment, reader value, thesis strength, article quality, distribution quality, and visual fit.
2. **Observable trajectory quality:** questions, options, critiques, rejections, revisions, evidence use, and state transitions recorded in the transcript and workspace.
3. **Artifact integrity:** approved copy is preserved, required deliverables exist, provenance is recorded, and final state is unambiguous.
4. **Efficiency:** the agent reaches a strong result without unnecessary churn. Reproducing six manual iterations is not a goal if the agent can anticipate and reject weak directions earlier.

## Non-Goals

- Do not score hidden chain-of-thought.
- Do not require exact reproduction of the published article.
- Do not reward iteration count by itself.
- Do not treat the reference thesis or image as a pixel- or text-match target.
- Do not allow an automated judge to redefine user taste without calibration against explicit user decisions.

## Dataset Role

Case 001 is a **development and grader-calibration case**, not a sealed held-out test. Its source, outcome, and decision history have already influenced skill design. Separate held-out cases will be required before claiming general improvement.

## Current Gate

Freeze the evidence and evaluation criteria before running either skill version. Do not modify the skills based on candidate outputs from the sealed comparison.
