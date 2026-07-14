# Research

## Route And Coverage

The revision used only `input/source.txt` and `input/draft-3.md`. The PDF was represented by the supplied deterministic extraction. No external search or later historical drafts were accessed.

The evidence route was source interpretation rather than current factual verification. The revised article avoids vendor-specific status claims, quantitative claims, legal conclusions, and claims that would require live validation.

## Source Model

The source's core frame is an operating model that aligns people, process, and technology around a continuous agent lifecycle. Its strongest vendor-neutral mechanisms are:

- Agent behavior is probabilistic and can fail while appearing fluent, so conventional output and application monitoring are insufficient.
- Production reliability depends on a continuous build, test, deploy, monitor, iterate, and govern discipline.
- Domain experts supply ground truth and quality criteria; agent teams own behavior; platform teams supply reusable controls.
- Risk classification should change permissions, approval requirements, rollout controls, monitoring, and accountability.
- Traces, evals, feedback, and versioned behavior artifacts make failures diagnosable and improvements testable.
- Production failures should become root-cause analysis, targeted changes, and regression coverage.
- Cost is a quality and reliability dimension when it can be attributed to useful outcomes.
- Compliance evidence overlaps with operational evidence: versions, traces, policy events, approvals, access records, and evaluation history.
- Portable prompts, tool contracts, datasets, policies, trace formats, and quality rubrics reduce dependence on a single implementation stack.
- Maturity grows through coordinated changes to people, process, and technology, not tooling alone.

## Draft Diagnosis

The prior draft had strong content and a clear general position, but its hierarchy weakened after the lede. It introduced a prerequisite list before giving the reader a mental model, then organized the same material several times through different lenses:

- symptoms and missing capabilities
- three ownership levels
- three risk tiers
- six lifecycle stages
- eight capability categories
- four maturity stages
- six self-assessment dimensions
- five immediate actions

Each framework was defensible. Together they made the article feel additive rather than cumulative. The reader could understand each section but had no stable answer to: "What is the one thing I am building?"

## Trunk Distillation

This piece helps teams with a working agent move from judging isolated outputs to deciding responsibly whether the agent can take on more work by showing how to build and operate a production control loop around its behavior.

The loop has five functions:

1. Define the responsibility envelope.
2. Observe actual behavior.
3. Evaluate behavior against explicit standards.
4. Constrain the consequences of error.
5. Improve from production evidence.

Ownership, risk, lifecycle, platform capability, FinOps, compliance, and portability remain in scope only as supports for those five functions.

## Hook Directions Considered

1. **Responsibility decision — selected.** "The next production question is not whether the agent works, but how much responsibility it can safely carry." This matches the reader's stage and naturally introduces the control loop.
2. **Invisible failure.** Open on the fact that agents can fail while sounding correct. Accurate, but it pulls the piece toward observability and could narrow the trunk.
3. **Checklist critique.** Argue that production readiness cannot be reduced to a checklist. Useful turn, but too meta for the opening and slower to deliver reader value.

## Claims Boundary

- Treat named practices as recommendations, not universal guarantees.
- Do not claim that tracing exposes private hidden model reasoning; describe reconstructable run context and recorded execution events.
- Do not imply that compliance evidence guarantees compliance.
- Do not prescribe identical controls for all agents; scale them to consequence and exposure.
- Do not promise perfect prevention; emphasize containment, detection, reconstruction, and improvement.

## Residual Limits

The article is intentionally vendor-neutral and does not provide implementation code, industry-specific regulatory mappings, or numerical readiness thresholds. Teams in regulated or safety-critical settings will need domain-specific review beyond this field guide.
