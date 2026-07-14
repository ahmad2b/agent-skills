# Editorial Brief

## Process Log

- **2026-07-14 — Workspace gate:** Confirmed `/workspace/output` from the explicit assignment. Created `brief.md`, `research.md`, `fragments.md`, `article.md`, and `assets/` (assets intentionally remains unused because the scope is article-only).
- **2026-07-14 — Current-signal gate:** Skipped by assignment. The comparison uses a frozen source packet and forbids the need for live research. This is a deliberate full-quality constraint for the assignment, not a silent downgrade.
- **2026-07-14 — Source-first gate:** Read the deterministic extraction of `input/source.pdf`. Recorded the source model, applicable mechanisms, promotional limitations, and exclusions in `research.md`.
- **2026-07-14 — Fragments gate:** Used `$writing-fragments` as a separate exploration phase. Wrote heterogeneous fragments with one H1 and horizontal-rule separators to `fragments.md`, then distilled them in `research.md`.
- **2026-07-14 — Clarification gate:** The author is unavailable and explicitly authorized reversible assumptions. Mirrored `$grill-me` behavior with pointed editorial questions and recommended answers below; selected the recommendations provisionally.
- **2026-07-14 — Editorial-brief gate:** Completed the assignment memo below before drafting.
- **2026-07-14 — Pre-draft gate:** Direction is assumption-based for this pilot only. Companion-skill status is recorded below.
- **2026-07-14 — Draft and review:** Completed Draft v1, recorded eight concrete editor objections, revised the brief's application through a revision memo, and produced Draft v2. Writer and reviewer delegation were each attempted, but the service could not create a thread, so both passes were completed directly and the limitation was recorded.
- **2026-07-14 — Readiness:** Draft v2 passed the local source, structure, value, tone, and claim review. It is designated ready for author review, not approved or final.

## Clarification Q&A

1. **Should this be an architecture tour or a readiness decision aid?** Recommended and selected: readiness decision aid. The reader already has an agent and needs to know what is missing around it.
2. **Should reliability mean answer quality only, or safe and economical outcomes?** Recommended and selected: outcomes. Quality, authority, recoverability, cost, and learning all affect whether the agent can be trusted.
3. **How broad should organizational design become?** Recommended and selected: name ownership and domain-expert participation, but do not reproduce a full organization model.
4. **Should the article prescribe a universal stack?** Recommended and selected: no. State the capabilities and enforcement points a stack must provide; remain vendor-neutral.
5. **What should carry the piece?** Recommended and selected: the “trust envelope” plus six readiness questions, followed by a practical minimum-production-loop sequence.
6. **How should the piece balance fear and opportunity?** Recommended and selected: name avoidable downside concretely, then show that bounded, observable failure enables teams to grant agents more useful authority with confidence.

## Reader And Situation

The reader has an agent demo, pilot, or early production workflow that sometimes works well. Usage, customer exposure, data access, or operational authority is about to increase. The reader understands the agent itself but may still treat reliability as better prompting, a prelaunch test pass, or generic application monitoring. They need a concrete standard for what must surround the agent before expanding trust.

## Reader Promise

By the end, the reader can audit an agent against six operational questions, identify the missing control loop, and sequence the next reliability work without buying into a particular vendor stack.

## Central Claim

You should not expand an agent's authority merely because its demonstrations are impressive. Trust becomes rational only when the surrounding system defines acceptable outcomes, exposes real behavior, constrains authority and resources, recovers safely, and converts production failures into verified improvements.

## Piece Shape

A technical diagnostic and field guide. It begins with a simple distinction between capability and trust, introduces the trust envelope, then walks through six readiness questions in dependency order. It ends with a minimal operating loop and a standard for granting more authority.

## Structural Backbone

1. **Capability is not trust:** demos reveal successes; production exposes plausible, silent failures.
2. **Define the trust envelope:** data, actions, resources, uncertainty, and human boundaries; controls scale with blast radius.
3. **Six readiness questions:**
   - Can you define a good outcome?
   - Can you reconstruct what happened?
   - Can you limit what the agent may do?
   - Can the workflow fail and recover safely?
   - Can you control cost per successful outcome?
   - Does every failure improve the next release?
4. **Minimum production loop:** classify, instrument, baseline, constrain, release gradually, learn.
5. **Ending:** The goal is not zero failure; it is bounded, visible, diagnosable failure and an evidence-based path to wider authority.

## Opening Job

In the first four paragraphs, validate the reader's progress, puncture the idea that a successful demo establishes production readiness, show a plausible silent failure, and promise a concrete audit. Introduce “trust envelope” only after the tension is clear.

Hook options considered:

- **Selected — Demo versus production evidence:** “A demo proves the agent can succeed. It does not prove you will know when it fails.” Best match for the reader's current state and the article's diagnostic shape.
- **Alternative — The 200 OK failure:** Open with a technically healthy request that produces a harmful outcome. Concrete, but risks front-loading technical detail.
- **Alternative — Permission as the maturity measure:** Open by asking what authority the team would grant today. Useful but less immediate for read-only agents.

## Evidence Standard

Use mechanisms supported by the supplied operating-model source, translated into vendor-neutral practice. Make concrete operational arguments through examples and conditional reasoning. Avoid source-company performance claims, universal numeric thresholds, legal assurances, and claims of industry prevalence. Clearly qualify evaluator limitations and distinguish ordinary system health from behavioral quality.

## Source Role

The source is the technical foundation and coverage check. It supplies the reliability mechanisms and the relationship among evaluation, observability, runtime controls, governance, cost, people, and iteration. It must not dictate the outline, become the subject of a summary, or pull branded products and promotional claims into the article.

## Cut Line

- Full enterprise team topology, hiring plan, training program, and maturity model.
- No-code builder strategy and organization-wide AI fluency.
- Named vendor products, customer case studies, benchmarks, and database internals.
- Standards/regulatory mapping; the frozen packet cannot support current legal guidance.
- Protocol and vendor-portability survey, except a brief admonition to version/export behavioral artifacts if it directly serves recoverability.
- A comprehensive security taxonomy; include only controls necessary to explain authority and blast radius.

## Taste Boundary

Must sound like an experienced, vendor-neutral engineering editor: direct, calm, concrete, and useful. Begin in plain language and earn technical depth. Avoid breathless AI transformation language, “enterprise” filler, fearmongering, fake first-hand war stories, rigid maturity theater, branded architecture diagrams, and listicle cadence. Do not imply agents are mystical or that established software reliability practices are obsolete.

## Decisions

- Organize around a trust-envelope diagnostic, not People/Process/Technology.
- Keep the article problem-locked; do not assign it to a job title.
- Make evaluation plus production feedback the throughline.
- Treat cost as reliability and tool authority as an explicit capability boundary.
- Preserve established software practices—access control, staged release, idempotency, rollback, audit logs—while showing what agent behavior adds.
- Include domain experts as the people who define acceptable behavior, but keep organization design out of scope.

## Rejected Directions

- **“Why agents need a new SDLC”:** too generic and source-shaped; invites inflated contrast with traditional software.
- **“The complete production agent stack”:** turns reader outcomes into a component inventory and risks vendor-shaped marketing.
- **“People, process, and technology for agent scale”:** broad organizational explainer that buries the reader's immediate readiness decision.
- **Risk taxonomy article:** useful but too narrow; authority is one part of the broader trust system.
- **Seven/ten-item checklist:** easy to scan but likely to fragment the argument into disconnected controls.

## Recommended Direction

Write a 1,800–2,400 word diagnostic titled provisionally **“A Demo Is Not a Trust Boundary”**. Its one trunk is that production trust is earned by the system around the agent. The trust envelope names the core concept; the six questions let readers apply it; the minimum loop gives them a starting sequence.

## Confirmation Questions

Because the author is unavailable, these remain review questions rather than blockers:

- Is “trust envelope” useful house vocabulary, or should the final title and body use plainer “operating boundary” language?
- Should the eventual publication identify or link the supplied source as further reading, or remain an unattributed synthesis?
- Is the desired reader comfortable with terms such as idempotency and semantic evaluator if each is explained in context?

## User Confirmation / Assumptions

The assignment authorizes reasonable, reversible assumptions and asks the pilot to proceed non-interactively. Assumed for this draft only:

- The publication can carry a technically substantive, approximately 2,000-word article.
- The source is internal foundation rather than a source that must be named in the body.
- The reader can follow common software delivery concepts but does not specialize in ML evaluation.
- “Customers, data, and operations” implies both read-only and action-taking agents; examples should cover both without centering a regulated industry.
- The article should deliver a practical mental model and readiness audit, not implementation code or a procurement rubric.

## Pre-Draft Gate

- **Direction status:** Assumption-based for this autonomous pilot, explicitly reversible and ready for author review.
- **`$writing-editor`:** Used for classification, workspace, gates, brief, source use, review, and readiness control.
- **`$writing`:** Used for reader promise, trunk, shape, source translation, drafting, and revision standards.
- **`$writing-fragments`:** Used as a separate artifact before shaping.
- **`$grill-me`:** Not invoked interactively because the author is unavailable; its pointed-question behavior was mirrored in `Clarification Q&A` with recommended answers.
- **`$last30days`:** Skipped because the assignment explicitly freezes the source packet and says no live research is needed.
- **Subagents:** An independent writer pass was attempted because the article is substantial and the skill recommends it, but the delegation service did not create a thread. Draft v1 therefore used direct editorial drafting, which was the only available path. An independent reviewer will be retried after Draft v1; editorial decisions remain with the primary editor.
- **Draft authorization:** Complete for Draft v1 under the assumptions above.
