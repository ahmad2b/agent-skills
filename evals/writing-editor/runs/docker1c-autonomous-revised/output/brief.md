# Editorial Brief

## Current Editorial State

- Stage: Revision toward best ready-for-review draft.
- Current thesis: An agent becomes trustworthy in production only when it sits inside a reliability envelope that makes behavior measurable, authority bounded, execution recoverable, changes controllable, and improvement owned.
- Reader promise: Readers can inspect an existing agent or pilot for the minimum surrounding capabilities needed before expanding its access, traffic, or operational responsibility.
- Piece shape: Practical argument followed by a failure-oriented readiness review.
- Opening direction: Contrast a successful happy-path demo with a trustworthy service; establish that conventional uptime can coexist with agent-specific failure.
- Active constraints: Article only; vendor-neutral; frozen source packet; no first-hand claims; begin simply and become technically substantive; combine avoidable downside with a credible positive future; do not widen to every source topic.
- Pending decisions: Title remains provisional; author may later choose whether to retain the source note.
- Required deliverables: One article ready for review in `article.md`.
- Publication state: Ready for review, not approved or final.

## Deliverables

| Deliverable | Required | Status | Location |
| --- | --- | --- | --- |
| Article | Yes | Ready for review | `output/article.md` |
| Featured image | No | Not applicable | — |
| Social/distribution copy | No | Not applicable | — |

## Accepted Changes

| Change | Status | Target | Reason |
| --- | --- | --- | --- |
| Narrow broad operating-model source to the reliability envelope around one agent | Verified | Brief and article | Keeps the reader promise specific and avoids source-summary structure |
| Organize the application around plausible failures rather than product categories | Verified | Article | Makes readiness inspectable and actionable |
| Remove named products, quantitative claims, and compliance assurances | Verified | Article | Maintains vendor neutrality and respects the frozen evidence boundary |
| Add explicit recovery semantics and complete behavioral versioning | Verified | Article | Strengthens the operational depth beyond generic observability advice |
| End with an authority-based promotion decision | Verified | Article | Gives the reader a usable release standard rather than a recap |

## Process Log

- Workspace gate — Complete: initialized the required flat workspace at `/workspace/output/`; no distribution or visual files created.
- Research-route gate — Complete: frozen source only; no live research needed or performed. Product and quantitative claims excluded.
- Fragments gate — Complete: separate discovery pass saved in `fragments.md`, then distilled into `research.md` and this brief.
- Clarification gate — Complete by authorized assumptions: reader is problem-locked; article addresses teams with a working agent considering more traffic, data, tools, or customer exposure.
- Editorial-brief gate — Complete: thesis, promise, shape, evidence boundary, cut line, and opening selected.
- Pre-draft gate — Complete on reversible assumptions authorized by the assignment. `writing-fragments` complete; `writing` active for draft and review.
- Draft pass — Complete: built the article around five properties of the reliability envelope and a failure-rehearsal readiness review.
- Prose review — Complete: revised for a single trunk, earlier reader value, tighter source boundary, stronger transitions, operational specificity, and a decision-oriented ending.

## Reader And Situation

The reader already has an agent, demo, pilot, or early production workflow. The happy path works. The next decision is whether to expose it to more customers, sensitive data, consequential tools, sustained volume, or a broader group of maintainers.

The reader likely understands standard application reliability but may still treat the model as a component that can be wrapped in ordinary CI, logs, and uptime monitoring. They need a practical way to see what is missing around the agent.

## Reader Promise

By the end, the reader can evaluate whether the system surrounding an agent is capable of finding behavioral failures, limiting their consequences, recovering execution, controlling changes, and learning from production before greater authority is granted.

## Central Claim

A working agent is not yet a trustworthy service. Trust comes from a reliability envelope around the agent: observable behavior, executable quality standards, bounded authority, recoverable execution, controlled change, and explicit ownership joined in a closed improvement loop.

## Piece Shape

A practical argument that turns into a field review. It first changes the unit of analysis from “the agent” to “the agent plus its reliability envelope,” then explains the envelope’s five properties, then tests the system against concrete failures.

## Structural Backbone

1. A happy path is not a reliability case.
2. Make acceptable behavior executable.
3. Make production behavior reconstructable.
4. Bound authority in proportion to consequence.
5. Design recovery and complete rollback.
6. Give every signal an owner and close the learning loop.
7. Rehearse failure before increasing authority.

## Opening Job

Make the reader recognize a familiar trap: standard health metrics can remain green while an agent produces plausible errors or performs the wrong action. Establish the promise in the opening section.

### Hook directions considered

- Selected: “A working agent is not yet a trustworthy service.” Direct, plain, and aligned with the reader’s maturity transition.
- Rejected: Open on an invented customer incident. It would imply evidence or first-hand experience the assignment does not provide.
- Rejected: Open with the source’s deterministic-versus-probabilistic comparison table. Accurate but likely to become a generic explainer and delay the practical promise.

## Evidence Standard

Mechanisms and distinctions must be supported by the supplied source model or clearly framed as operational synthesis. No external facts, numbers, legal conclusions, product capabilities, or case-study claims.

## Source Role

The supplied paper is the foundation for the mechanisms and operating concerns. The article applies and narrows those ideas into a vendor-neutral readiness standard; it does not follow the paper’s people/process/technology outline or reproduce its product mapping.

## Cut Line

Exclude broad workforce transformation, no-code adoption, hiring plans, platform organization, market maturity stages, standards mapping, vendor independence, named products, and “agents improving agents” automation. Include domain expertise and ownership only where they directly affect reliability.

## Taste Boundary

Serious, calm, direct, and technically useful. No fearmongering, generic transformation language, vendor marketing, inflated claims, faux case studies, or checklist without an argument.

## Decisions

- Use “reliability envelope” as the leading term and throughline.
- Group capabilities by the failure property they provide, not by source chapter or tool category.
- Treat cost as a bounded-resource reliability issue, not a standalone FinOps section.
- Treat human review as one control among several, scaled to consequence rather than prescribed for every step.
- Include a compact source note for transparency while keeping the body independent and vendor-neutral.

## Rejected Directions

- A comprehensive “people, process, technology” explainer: too broad and too close to the source outline.
- A maturity-model article: would rely on arbitrary stages and distract from the immediate promotion decision.
- A list of tools to buy: violates vendor neutrality and confuses capabilities with products.
- “Seven best practices for production agents”: list structure would weaken the causal argument and invite generic coverage.

## User Confirmation / Assumptions

The assignment authorizes reasonable, reversible assumptions. Assumed length is a substantive web article of roughly 1,800–2,500 words. Assumed reader has enough technical context to understand prompts, models, tools, traces, and deployment but does not need implementation code. Title and source-note treatment remain reversible.

## Pre-Draft Gate

- Direction: assumption-based and authorized by the assignment.
- Source extraction: complete.
- Discovery fragments: complete.
- Reader, promise, thesis, shape, opening, evidence boundary, and cut line: resolved.
- Companion-skill status: `writing-fragments` complete; `writing` used for drafting and self-review.
- Cleared to draft: Yes.
