# Research

## Research Route

- Route: frozen supplied source only; no live discourse or factual research.
- Foundation: `input/source.txt`, deterministic extraction of `input/source.pdf`, *The Agentic Operating Model: Aligning People, Process, and Technology for Production AI at Scale*.
- Coverage limit: the source is a vendor-authored operating-model paper. Its general mechanisms are useful; product claims, named-stack mappings, customer claims, maturity thresholds, regulatory mappings, and quantitative assertions are excluded from the article unless independently verifiable. The assignment prohibits live research, so no such claims will be carried forward.
- Companion work: `writing-fragments` used for discovery; `writing` used for the brief, draft, and prose review. No subagent review: delegation was neither requested nor allowed by the active multi-agent policy.

## Source Model

### Core frame

Production reliability for agents is an operating-system problem spanning people, process, and technology. Agent behavior is probabilistic, stateful, and affected by more than application code, so conventional software controls are necessary but insufficient.

### Mechanisms worth carrying forward

- Evaluate behavior with curated, synthetic, trajectory, regression, and adversarial cases.
- Use deterministic checks wherever assertions are mechanically verifiable; reserve model-based and human judgment for semantic quality.
- Capture production trajectories: inputs, model calls, retrieved context, tool calls, state transitions, outputs, feedback, latency, and cost.
- Close the loop from production failure to diagnosis, targeted change, regression coverage, controlled rollout, and continued monitoring.
- Version all behavior-shaping artifacts, not only code.
- Use durable execution and checkpointed state for long-running work.
- Put human approval before consequential operations where appropriate.
- Isolate code execution, filesystem access, and untrusted tools.
- Scale controls with authority and blast radius.
- Enforce scoped tool access, budgets, auditability, and rollback at technical control points.
- Assign a named owner and involve domain experts in defining quality and reviewing ambiguous cases.

### Source roles

- Foundation: the difference between code reliability and behavioral reliability.
- Evidence model: the categories of tests, telemetry, controls, and operating responsibilities.
- Vocabulary to translate: evaluation, trajectory, regression, checkpointing, scoped tool access, online/offline evaluation, failure clusters.
- Material to omit: company products, sales claims, staffing prescriptions, organization-wide AI adoption, vendor-independence argument, fixed maturity thresholds, broad standards claims, and case-study metrics.

## Fragment Distillation

The strongest leading term is **reliability envelope**: the system around an agent that makes its behavior measurable, its authority bounded, its execution recoverable, and its improvement repeatable.

The sharpest contrast is between **a working agent** and **a trustworthy service**. The former can complete a happy path; the latter can be evaluated, observed, contained, recovered, changed, and owned under real usage.

The strongest practical test is a failure-rehearsal review. Rather than asking whether a team has “observability” or “governance,” select plausible failures and ask whether the team can detect, reconstruct, contain, recover, roll back, and prevent recurrence.

## Reader-Value Translation

| Technical mechanism | Reader-facing value |
| --- | --- |
| Evaluation suite | A stated, repeatable definition of acceptable behavior before more users discover edge cases |
| End-to-end trace | A failure that can be reconstructed instead of debated from screenshots |
| Versioned dependencies | The ability to identify what changed and restore the whole prior behavior |
| Scoped permissions and approvals | A mistake whose blast radius is limited |
| Checkpointed runtime and idempotent tools | Work that can recover without duplicating consequential actions |
| Cost and loop limits | Unit economics and capacity protected from runaway behavior |
| Named owner and response path | Signals that lead to decisions and fixes rather than dashboard accumulation |
| Regression capture | Incidents that make future releases safer |

## Claims Boundary

The article can make conceptual and operational recommendations grounded in the supplied source. It will avoid quantified performance claims, regulatory compliance assurances, named vendor comparisons, or claims of first-hand operating experience.

## Claims To Verify Before Publication If Added Later

- Any numeric canary percentages or maturity thresholds.
- Any claim that a specific control satisfies a law, standard, or regulation.
- Any claim about relative costs, staffing savings, market adoption, or trace volume.
- Any current product capability or provider support.
