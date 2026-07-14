# Article

## Trunk

This piece helps teams with a promising agent move from demo confidence to operational trust by showing that reliability comes from an enforceable system around the agent: defined outcomes, behavioral visibility, bounded authority, safe recovery, controlled economics, and a closed improvement loop.

## Draft v1

# A Demo Is Not a Trust Boundary

A demo proves that an AI agent can succeed. It does not prove that you will know when it fails.

That distinction becomes expensive as soon as the agent touches customers, private data, or operational systems. A normal request can complete without an exception and still produce the wrong outcome. A support agent may cite the wrong policy with complete confidence. A workflow agent may call the correct tool with the wrong customer ID. A research agent may enter a loop, accumulating cost while its status remains “running.” The service is up. The API returns success. The failure is in the behavior.

Better prompts will not solve this category of problem on their own. Neither will a security review, a dashboard, or a large prelaunch test set in isolation. An agent becomes trustworthy when the system around it can define acceptable outcomes, expose what actually happened, limit the agent's authority, recover from interruption, control resource use, and learn from production failures.

Before increasing usage or permissions, audit that surrounding system. Six questions reveal most of what is missing.

## First, define the trust envelope

An agent should not receive a single, vague status called “production-ready.” It should have a **trust envelope**: an explicit boundary around the data it may see, the actions it may take, the resources it may consume, and the uncertainty it may carry without human review.

The envelope should expand with evidence. A drafting assistant that reads approved documents and produces text for review has a small blast radius. An agent that sends customer messages, changes account records, or runs code has a larger one. A long-running agent operating in a regulated or financial workflow needs tighter controls still. The same underlying model may be involved in all three cases; the required operating system is not the same.

Start by inventorying permissions, not components. For each tool, data source, and model call, ask what could happen if the agent chooses badly, repeats the action, receives a malicious instruction, or runs much longer than expected. Then make the control proportional to that consequence. Read-only access may need filtering and audit logs. A consequential write may also need a scoped credential, a policy check, an approval boundary, and an idempotency key. Code execution may require an isolated environment with strict time, network, and filesystem limits.

This is the first shift from demo thinking to production thinking: trust the agent only inside the boundary you can enforce.

## 1. Can you define a good outcome?

Teams often begin testing an agent by collecting examples that “look right.” That is useful exploration, but it is not yet an operating definition of quality.

A production evaluation suite needs to represent several kinds of truth:

- **Known-good cases** capture the normal work and the domain's accepted answers.
- **Edge cases** cover unusual inputs, ambiguous requests, and boundary conditions.
- **Trajectory cases** check not just the final answer but the expected sequence of tool calls, handoffs, and approvals.
- **Adversarial cases** probe prompt injection, data leakage, policy evasion, and unsafe tool use.
- **Regression cases** preserve failures already found in testing or production.

The scoring method should fit the property being tested. Use deterministic checks for properties that are actually deterministic: schema validity, required fields, exact identifiers, tool arguments, policy flags, or whether an approval occurred. Use a semantic evaluator when the property is genuinely interpretive, such as groundedness, helpfulness, or tone. Model-based graders are measurements, not oracles; calibrate them against human-labeled examples and continue sampling their decisions for drift.

Most importantly, involve the people who know what a costly mistake looks like. An engineer can build the harness, but a support lead knows when an technically correct reply will trigger an escalation. An operations specialist knows which exception makes the standard workflow dangerous. Domain experts turn “seems good” into criteria, cases, and acceptable tradeoffs.

The output of this work is not one universal quality score. It is a release contract: the thresholds that must hold for this agent, in this trust envelope, before a change receives more traffic or authority.

## 2. Can you reconstruct what happened?

Ordinary application telemetry remains necessary. You still need uptime, latency, exceptions, saturation, and dependency health. But those signals cannot tell you whether a healthy process made an unhealthy decision.

For each run, capture an execution trace that connects the user input to the final outcome. Depending on the workflow, that includes the prompt and model version, retrieved context, tool selection and arguments, state transitions, policy decisions, approval events, output, latency, token use, and cost. Attach explicit feedback such as corrections and ratings, plus implicit signals such as abandonment, escalation, repeated attempts, or a downstream reversal.

The goal is not indiscriminate logging. Sensitive inputs and outputs need retention rules, access control, and redaction. The goal is enough structured evidence to answer four questions after an incident:

1. What did the agent receive and produce?
2. Which path, tools, and data led to the outcome?
3. Which exact versions and policies were active?
4. Was this an isolated case or part of a pattern?

Traces alone do not answer the fourth question. At production volume, they become a searchable haystack. Apply quality signals to a sample or to high-risk runs, aggregate them by version and failure type, and route ambiguous cases to human review. Observability becomes useful only when it can turn a customer complaint into a reproducible case—or surface the pattern before the complaint arrives.

## 3. Can you limit what the agent may do?

An agent's authority should be narrower than the credentials of the application running it.

Give each tool the smallest scope the workflow requires. Separate read permissions from write permissions. Restrict records, tenants, operations, rate, and duration where possible. Validate tool arguments outside the model. Enforce policy at the boundary where the call occurs, not as prose buried in a system prompt. Record both allowed and denied attempts.

Human approval belongs at the **commitment boundary**: the point where a reversible recommendation becomes a consequential action. For a customer-service workflow, the agent may gather context and draft a resolution autonomously but pause before issuing a refund above a threshold. For an internal operations agent, it may propose a database change but require approval before execution. Placing approval around every model call destroys the value of automation; placing it after the action merely documents the damage.

Also assume that instructions can conflict. A retrieved document, tool response, or user message may attempt to override policy. Input and output filtering can reduce obvious attacks, but the harder protection is architectural: untrusted content should never be able to grant itself more authority. The model may propose an action; a separate enforcement layer decides whether that action is permitted.

## 4. Can the workflow fail and recover safely?

Agents are often stateful and multi-step. They wait for people, call unreliable dependencies, retry work, and may run longer than the process that started them. Recovery therefore needs more than restarting a container.

Persist enough state to resume from a known checkpoint. Make consequential operations idempotent so a retry cannot send the same payment, message, or update twice. Define timeouts and retry limits by step rather than allowing a general loop to continue indefinitely. Route uncertain or exhausted runs to a safe terminal state: pause for review, return a bounded failure, or hand the case to a human with its context intact.

Release behavior gradually. Send a small portion of eligible work to a new prompt, model, tool definition, retrieval configuration, or policy; compare its quality, latency, and cost with the current version; then expand or roll back. This requires versioning the whole behavioral surface, not only code. Prompts, model identifiers, tool schemas, retrieval sources, evaluator definitions, and policies all affect what the agent does. If those versions are absent from the trace, a rollback may restore the application while leaving the behavior unexplained.

Isolation completes the recovery story for risky work. If an agent runs code, handles files, or invokes untrusted tools, place that work in a sandbox with explicit resource and network limits. Recovery is credible only when a failed step cannot escape its intended boundary.

## 5. Can you control cost per successful outcome?

Cost is not a finance concern bolted onto reliability. It is one of the conditions a reliable agent must satisfy.

A workflow can return an acceptable answer and still be operationally broken if it calls a premium model at every step, repeats retrieval unnecessarily, fans out without limits, or spends more than the task is worth. Track spend at the level where someone can act on it: per agent, tenant, feature, workflow step, and interaction. Then connect it to the quality signal.

“Cost per call” can reward a cheap system that fails repeatedly. “Accuracy” can reward an expensive system with no viable unit economics. The useful measure is **cost per successful outcome**, supported by latency and failure-rate constraints. It lets a team reserve more capable models for the steps that need them, use cheaper models or deterministic code elsewhere, cache repeated work, and set budgets without optimizing quality away.

Enforce hard limits as well as alerts. An alert after an autonomous loop has consumed its budget is an incident report. Token, tool-call, concurrency, and wall-clock limits turn resource expectations into a real boundary.

## 6. Does every failure improve the next release?

Testing before launch and monitoring after launch are often treated as separate activities. For agents, they must form one control loop.

When a failure appears, preserve the trace and classify the cause before changing the prompt. Was the instruction unclear? Did retrieval supply the wrong source? Did the router select the wrong tool? Was a tool schema too permissive? Did the model lack the capability for one step? Did the policy allow too much? Different causes require different fixes.

Then turn the failure into durable evidence:

1. Add the case—or a safely redacted equivalent—to the regression set.
2. Add or repair an evaluator that detects the unacceptable property.
3. Make the narrowest plausible change to prompt, model, retrieval, tool, policy, or code.
4. Run the changed system against the full relevant suite, not only the failing case.
5. Release gradually and watch for both the intended improvement and displaced failures.

This loop prevents two common traps. The first is prompt whack-a-mole: fixing the latest complaint while quietly breaking earlier behavior. The second is dashboard theater: collecting detailed traces without a routine that turns them into product changes.

As volume grows, automate the mechanical parts—sampling, clustering similar failures, suggesting labels, running regression suites—but retain human ownership of acceptance criteria and high-consequence decisions. The aim is not an agent that grades itself into passing. It is a shorter, auditable path from production evidence to a verified improvement.

## The minimum production loop

You do not need a large platform team to begin. You do need an unbroken loop. For one agent, establish it in this order:

1. **Classify the authority.** List the data, tools, actions, and resource limits inside the first trust envelope. Name an operational owner and a domain owner.
2. **Define the release contract.** Build a small but representative evaluation set with deterministic checks, human judgment where necessary, and explicit thresholds.
3. **Instrument the outcome.** Capture versions, execution paths, tool calls, policy decisions, user feedback, latency, and cost with appropriate privacy controls.
4. **Enforce the boundaries.** Apply least privilege, argument validation, approval at commitment points, budgets, timeouts, and isolation proportional to blast radius.
5. **Practice failure.** Test interruption, dependency failure, duplicate delivery, denial of permission, rollback, and escalation before customers do it for you.
6. **Close the loop.** Review production signals on a fixed cadence, convert failure patterns into regression cases, and require re-evaluation before promotion.

The artifacts can be modest at first. A curated dataset, a trace store, a scoped tool credential, a review queue, and a release checklist may be enough for a bounded internal agent. What matters is that no question depends on memory, heroics, or a policy document that the running system cannot enforce.

The goal is not to prove that an agent will never fail. No serious production system earns trust that way. The goal is to make failure bounded, visible, recoverable, and useful—to know what happened, contain the consequence, and make the same class of failure less likely in the next release.

Once that system exists, greater autonomy stops being a leap of faith. It becomes an evidence-based expansion of the trust envelope.

## Editor Review v1

**Verdict:** The draft has a clear trunk, useful technical depth, and strong source translation. It is structurally sound but needs revision before it is the best ready-for-review version.

**Objections and residual risks:**

1. **The positive after-state arrives late.** The opening is weighted toward avoidable downside. Add an early sentence showing what the surrounding system enables: safely widening authority as evidence accumulates.
2. **The six-question diagnostic and “minimum production loop” partially repeat each other.** Keep the diagnostic as the conceptual core, but compress the final sequence into an ordered starting plan that adds ownership and sequencing rather than restating every section.
3. **“Release contract” sounds more certain than agent evaluation supports.** Thresholds are necessary, but sampled and semantic measurements remain uncertain. Clarify that the contract is a promotion decision with confidence and risk, not proof of correctness.
4. **Some security phrasing is categorical.** “Untrusted content should never be able to grant itself more authority” is directionally correct but should distinguish the design invariant from the reality that implementation defects still occur. Phrase it as an enforceable architecture rule.
5. **The article introduces a useful leading term but does not fully operationalize changes to it.** State explicitly that adding a tool, data source, write permission, autonomy duration, or higher budget changes the trust envelope and requires renewed evaluation.
6. **The trace section could imply universal capture of raw prompts and context.** Strengthen the privacy qualification: store references, hashes, or redacted representations when raw content cannot be retained, while preserving version and causal reconstruction.
7. **The cost section needs a warning about outcome definitions.** Cost per successful outcome is only useful if “success” is tied to a credible quality measure; otherwise teams can optimize the denominator.
8. **Sentence-level issue:** Fix “an technically correct reply.” Also trim a few paired formulations so the piece does not feel like an overproduced checklist.

**Source and fact check:** No branded products, vendor benchmarks, legal assurances, or claims of first-hand experience appear. The draft accurately applies the source's core mechanisms without reproducing its outline. Ordinary software controls are preserved instead of dismissed. No live-current claims require external verification under the frozen-packet assignment.

## Revision Brief

Preserve the trust-envelope diagnostic and six questions. Revise for three outcomes: (1) show the credible positive future state in the opening; (2) make envelope expansion and re-evaluation explicit; (3) qualify evaluation, trace retention, architectural isolation, and cost metrics without diluting the recommendations. Compress the final startup plan so it functions as a sequence, not a summary.

## Revision Instructions

- Add an early after-state: reliability infrastructure allows deliberate expansion of useful autonomy.
- Define which changes reopen the trust decision.
- Reframe the release contract as a risk-based promotion rule, not proof.
- Allow redacted or referential trace data while retaining reconstructability.
- Phrase authority separation as a design rule enforced outside the model.
- Tie cost per successful outcome to a credible success definition.
- Reduce the final loop from six restated items to four staged moves.
- Correct the grammatical error and simplify where possible.

## Draft v2

# A Demo Is Not a Trust Boundary

A demo proves that an AI agent can succeed. It does not prove that you will know when it fails.

That distinction becomes expensive as soon as the agent touches customers, private data, or operational systems. A normal request can complete without an exception and still produce the wrong outcome. A support agent may cite the wrong policy with complete confidence. A workflow agent may call the correct tool with the wrong customer ID. A research agent may enter a loop, accumulating cost while its status remains “running.” The service is up. The API returns success. The failure is in the behavior.

Better prompts will not solve this category of problem on their own. Neither will a security review, a dashboard, or a large prelaunch test set in isolation. An agent becomes trustworthy when the system around it can define acceptable outcomes, expose what actually happened, limit the agent's authority, recover from interruption, control resource use, and learn from production failures.

That surrounding system does more than prevent damage. It gives a team an evidence-based way to expand what the agent can do. Before increasing usage or permissions, audit it through six questions.

## First, define the trust envelope

An agent should not receive a single, vague status called “production-ready.” It should have a **trust envelope**: an explicit boundary around the data it may see, the actions it may take, the resources it may consume, and the uncertainty it may carry without human review.

The envelope should expand with evidence. A drafting assistant that reads approved documents and produces text for review has a small blast radius. An agent that sends customer messages, changes account records, or runs code has a larger one. A long-running agent operating in a regulated or financial workflow needs tighter controls still. The same underlying model may be involved in all three cases; the required operating system is not the same.

Start by inventorying permissions, not components. For each tool, data source, and model call, ask what could happen if the agent chooses badly, repeats the action, receives a malicious instruction, or runs much longer than expected. Then make the control proportional to that consequence. Read-only access may need filtering and audit logs. A consequential write may also need a scoped credential, a policy check, an approval boundary, and an idempotency key. Code execution may require an isolated environment with strict time, network, and filesystem limits.

Treat the envelope as a versioned operating decision. Adding a tool, data source, write permission, longer autonomy window, or higher budget changes it. So does a material model or policy change. Each should trigger renewed evaluation of the affected risks rather than inherit trust from the earlier system.

This is the first shift from demo thinking to production thinking: trust the agent only inside the boundary you can enforce.

## 1. Can you define a good outcome?

Teams often begin testing an agent by collecting examples that “look right.” That is useful exploration, but it is not yet an operating definition of quality.

A production evaluation suite needs to represent several kinds of truth:

- **Known-good cases** capture normal work and the domain's accepted answers.
- **Edge cases** cover unusual inputs, ambiguous requests, and boundary conditions.
- **Trajectory cases** check the expected sequence of tool calls, handoffs, and approvals—not just the final answer.
- **Adversarial cases** probe prompt injection, data leakage, policy evasion, and unsafe tool use.
- **Regression cases** preserve failures already found in testing or production.

The scoring method should fit the property. Use deterministic checks for schema validity, required fields, exact identifiers, tool arguments, policy flags, and approval events. Use semantic evaluators for genuinely interpretive properties such as groundedness, helpfulness, or tone. Model-based graders are measurements, not oracles; calibrate them against human-labeled examples and continue sampling their decisions for drift.

Most importantly, involve the people who know what a costly mistake looks like. An engineer can build the harness, but a support lead knows when a technically correct reply will trigger an escalation. An operations specialist knows which exception makes the standard workflow dangerous. Domain experts turn “seems good” into criteria, cases, and acceptable tradeoffs.

The result is not one universal quality score or proof that the agent is correct. It is a risk-based promotion rule: the evidence and thresholds that must hold, with known uncertainty, before this version receives more traffic or authority inside its trust envelope.

## 2. Can you reconstruct what happened?

Ordinary application telemetry remains necessary. You still need uptime, latency, exceptions, saturation, and dependency health. But those signals cannot tell you whether a healthy process made an unhealthy decision.

For each run, capture an execution trace that connects the input to the outcome. Depending on the workflow, that includes prompt and model versions, retrieved context, tool selection and arguments, state transitions, policy decisions, approval events, output, latency, token use, and cost. Attach explicit feedback such as corrections and ratings, plus implicit signals such as abandonment, escalation, repeated attempts, or a downstream reversal.

The goal is not indiscriminate logging. Sensitive content needs retention rules, access control, and redaction. Where raw prompts, documents, or outputs cannot be stored, retain safe references, hashes, versions, structured events, or redacted representations sufficient to investigate the run without rebuilding a shadow copy of the sensitive data.

After an incident, the evidence should answer four questions:

1. What did the agent receive and produce?
2. Which path, tools, and data led to the outcome?
3. Which versions and policies were active?
4. Was this isolated or part of a pattern?

Traces alone do not answer the fourth question. At production volume, they become a searchable haystack. Apply quality signals to a representative sample and to high-risk runs, aggregate them by version and failure type, and route ambiguous cases to human review. Observability becomes useful only when it can turn a customer complaint into a reproducible case—or surface the pattern before the complaint arrives.

## 3. Can you limit what the agent may do?

An agent's authority should be narrower than the credentials of the application running it.

Give each tool the smallest scope the workflow requires. Separate read permissions from write permissions. Restrict records, tenants, operations, rate, and duration where possible. Validate tool arguments outside the model. Enforce policy at the boundary where the call occurs, not as prose buried in a system prompt. Record both allowed and denied attempts.

Human approval belongs at the **commitment boundary**: the point where a reversible recommendation becomes a consequential action. A customer-service agent may gather context and draft a resolution autonomously but pause before issuing a large refund. An operations agent may propose a database change but require approval before execution. Approval around every model call destroys the value of automation; approval after the action merely documents the damage.

Also assume that instructions can conflict. A retrieved document, tool response, or user message may attempt to override policy. Filtering can reduce obvious attacks, but the stronger design rule is architectural: content handled by the model cannot grant the model new authority. The model may propose an action; a separately implemented enforcement layer decides whether the action is permitted. That separation is testable, reviewable, and less dependent on the model interpreting instructions correctly.

## 4. Can the workflow fail and recover safely?

Agents are often stateful and multi-step. They wait for people, call unreliable dependencies, retry work, and may run longer than the process that started them. Recovery therefore needs more than restarting a container.

Persist enough state to resume from a known checkpoint. Make consequential operations idempotent so a retry cannot send the same payment, message, or update twice. Define timeouts and retry limits by step rather than allowing a general loop to continue indefinitely. Route uncertain or exhausted runs to a safe terminal state: pause for review, return a bounded failure, or hand the case to a human with its context intact.

Release behavior gradually. Send a limited portion of eligible work to a new prompt, model, tool definition, retrieval configuration, or policy; compare its quality, latency, and cost with the current version; then expand or roll back. This requires versioning the whole behavioral surface, not only code. Prompts, model identifiers, tool schemas, retrieval sources, evaluator definitions, and policies all affect what the agent does. If those versions are absent from the trace, a rollback may restore the application while leaving the behavior unexplained.

Isolation completes the recovery story for risky work. If an agent runs code, handles files, or invokes untrusted tools, place that work in a sandbox with explicit resource and network limits. Recovery is credible only when a failed step remains inside its intended boundary.

## 5. Can you control cost per successful outcome?

Cost is not a finance concern bolted onto reliability. It is one of the conditions a reliable agent must satisfy.

A workflow can return an acceptable answer and still be operationally broken if it calls a premium model at every step, repeats retrieval unnecessarily, fans out without limits, or spends more than the task is worth. Track spend at the level where someone can act on it: per agent, tenant, feature, workflow step, and interaction. Then connect it to the quality signal.

“Cost per call” can reward a cheap system that fails repeatedly. “Accuracy” can reward an expensive system with no viable unit economics. The useful measure is **cost per successful outcome**, supported by latency and failure-rate constraints. Its denominator must use the same credible success definition established in the evaluation suite; otherwise a team can make efficiency look better simply by lowering the bar.

This view lets a team reserve more capable models for the steps that need them, use cheaper models or deterministic code elsewhere, cache repeated work, and set budgets without optimizing quality away.

Enforce hard limits as well as alerts. An alert after an autonomous loop has consumed its budget is an incident report. Token, tool-call, concurrency, and wall-clock limits turn resource expectations into a real boundary.

## 6. Does every failure improve the next release?

Testing before launch and monitoring after launch are often treated as separate activities. For agents, they must form one control loop.

When a failure appears, preserve the trace and classify the cause before changing the prompt. Was the instruction unclear? Did retrieval supply the wrong source? Did the router select the wrong tool? Was a tool schema too permissive? Did the model lack the capability for one step? Did the policy allow too much? Different causes require different fixes.

Then turn the failure into durable evidence:

1. Add the case—or a safely redacted equivalent—to the regression set.
2. Add or repair an evaluator that detects the unacceptable property.
3. Make the narrowest plausible change to prompt, model, retrieval, tool, policy, or code.
4. Run the changed system against the full relevant suite, not only the failing case.
5. Release gradually and watch for the intended improvement and displaced failures.

This loop prevents prompt whack-a-mole: fixing the latest complaint while quietly breaking earlier behavior. It also prevents dashboard theater, in which detailed traces accumulate without a routine that turns them into product changes.

As volume grows, automate the mechanical parts—sampling, clustering similar failures, suggesting labels, and running regression suites—but retain human ownership of acceptance criteria and high-consequence decisions. The aim is not an agent that grades itself into passing. It is a shorter, auditable path from production evidence to a verified improvement.

## Start with one complete loop

You do not need a large platform team to begin. You need an unbroken path from definition to evidence to correction.

First, classify one agent's authority and name both an operational owner and a domain owner. Next, define a modest release contract and instrument the runs needed to evaluate it. Then enforce the trust envelope and rehearse interruption, denial, duplicate delivery, escalation, and rollback. Finally, review production signals on a fixed cadence and require failures to become regression cases before the next promotion.

The artifacts can be modest: a curated dataset, structured traces, a scoped tool credential, a review queue, and a release record may be enough for a bounded internal agent. What matters is that no critical question depends on memory, heroics, or a policy document the running system cannot enforce.

The goal is not to prove that an agent will never fail. No serious production system earns trust that way. The goal is to make failure bounded, visible, recoverable, and useful—to know what happened, contain the consequence, and make the same class of failure less likely in the next release.

Once that system exists, greater autonomy stops being a leap of faith. It becomes an evidence-based expansion of the trust envelope.

## Reviewer Notes

**Review mode:** Local independent-style pass. Both attempted reviewer delegations failed because the delegation service could not create a thread; the editor therefore applied the reviewer brief directly and retained explicit residual risks.

**Readiness verdict:** Draft v2 is ready for author review. The promise, structure, technical substance, source alignment, and tone have no major known objections.

**Residual risks for author judgment:**

1. **House vocabulary:** “Trust envelope” is useful and applied consistently, but the author may prefer the plainer “operating boundary.” This is a taste decision, not a structural defect.
2. **Source visibility:** The article is a vendor-neutral synthesis and does not name the supplied vendor paper. Publication norms may require a source note or further-reading link even though the body does not rely on its promotional claims.
3. **Technical depth boundary:** Concepts such as idempotency, semantic evaluation, scoped credentials, and checkpointing are explained through purpose rather than implementation. That matches the problem-locked brief but will not satisfy a reader seeking code or a reference architecture.
4. **Policy specificity:** Retention, approval, and isolation requirements vary by data class and industry. The article correctly frames mechanisms rather than claiming compliance, but a regulated publication would need a separately verified policy layer.
5. **Evaluator uncertainty:** The text qualifies model-based graders and promotion thresholds. It cannot quantify calibration quality without a concrete workload, which is an inherent limitation rather than a missing generic prescription.

No further changes are required before author review. Title, attribution, and publication-specific terminology remain deliberately provisional.

## Feedback Decisions

**Accepted from Editor Review v1:**

- Moved the credible positive future state into the opening.
- Made trust-envelope changes and re-evaluation triggers explicit.
- Reframed the release contract as a risk-based promotion rule with uncertainty.
- Added privacy-preserving trace options rather than assuming raw-content retention.
- Recast authority separation as an external, testable architecture rule.
- Tied cost per successful outcome to the evaluation definition of success.
- Compressed the closing sequence from six repeated checklist items into four ordered moves.
- Corrected the grammatical error and simplified repeated formulations in Draft v2.

**Rejected or deferred:**

- Did not add the source company's products, benchmarks, customer stories, or organizational framework; they would weaken vendor neutrality and the diagnostic trunk.
- Did not add standards or legal mappings because the assignment freezes research and the article should not imply compliance.
- Did not add code, a reference architecture, or a full security taxonomy; each would widen the piece beyond the reader promise.
- Deferred source attribution format and final title choice to author review because publication context is not supplied.

## Ready-for-Review Copy

**Canonical copy:** `Draft v2` above is the complete ready-for-review article. It is not duplicated here, preventing two nominally canonical copies from diverging during author edits.

## Final Readiness

- **Status:** Ready for author review; not author-approved, published, or final.
- **Reader value:** Provides an applicable six-question diagnostic and a sequenced starting plan.
- **Trunk:** Clear and consistent: production trust comes from an enforceable system around the agent.
- **Source use:** Mechanisms are applied and translated; the source is not summarized or marketed.
- **Current accuracy:** No live-current, legal, market-prevalence, or vendor-performance claims are included.
- **Tone:** Direct, calm, technical after a simple opening, and vendor-neutral.
- **Review:** One recorded editor review and one recorded local reviewer-style readiness pass completed. Material revision decisions are preserved above.
