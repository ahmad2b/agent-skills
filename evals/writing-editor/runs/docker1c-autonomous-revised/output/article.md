# Article

## Trunk

This piece helps teams with a working agent move from happy-path confidence to a defensible production decision by showing that trust depends on a reliability envelope around the agent, not on the agent alone.

## Current Draft

# The Agent Is Not the Reliability Boundary

A working agent is not yet a trustworthy service.

A demo proves that the agent can complete a path. It can answer a question, call a tool, or carry a task across several steps. That matters. But it says little about what happens when the retrieved context is stale, a provider times out halfway through a workflow, a prompt changes, a tool returns an unexpected result, or the agent produces a confident answer that is simply wrong.

In each case, the application may remain healthy by conventional measures. Requests return. Latency stays within range. No exception is raised. Yet a customer receives bad guidance or a system of record is changed incorrectly.

This is the production gap for AI agents: service health and behavior quality are related, but they are not the same thing.

Closing that gap requires changing the unit of analysis. The thing you need to make reliable is not the agent alone. It is the **reliability envelope** around the agent: the tests that define acceptable behavior, the telemetry that reconstructs what happened, the controls that limit what the agent can do, the runtime that preserves and recovers work, and the people and process that turn failures into safer releases.

The goal is not to pretend an agent will never fail. It is to make failure visible, bounded, recoverable, and useful.

## Make acceptable behavior executable

Teams often begin with an informal quality standard: a few people try the agent, the responses look reasonable, and the pilot moves forward. That is useful for discovery. It is not a promotion gate.

Before an agent receives more traffic or authority, “good” has to become something the team can run repeatedly. That means an evaluation set drawn from the work the agent is expected to do, with explicit criteria and thresholds for release.

No single kind of test is enough. A practical evaluation portfolio can include:

- curated examples of common, important tasks with known acceptable outcomes;
- edge cases generated to broaden coverage, then reviewed by someone who understands the domain;
- trajectory tests that verify required tool calls, ordering, and approval steps—not only the final answer;
- adversarial cases for prompt injection, data exposure, policy evasion, and tool misuse; and
- regression cases created from failures already found in testing or production.

Use the cheapest dependable evaluator for each property. Schemas, required fields, exact values, tool allowlists, and forbidden patterns can often be checked deterministically. Semantic properties such as groundedness, relevance, or policy adherence may require a model-based evaluator. Ambiguous or consequential judgments still need calibrated human review.

That mix matters because a fluent response can hide a broken trajectory. An agent might reach the right final answer using an unauthorized source. It might write the correct value to the wrong customer record. It might follow the right procedure four times out of five. Final-output scoring alone will miss these failures.

Evaluations also need to travel with the release process. Record the prompt, model, tools, retrieval configuration, policies, and evaluator versions used for each run. Compare a proposed configuration with the current one, and block promotion when it breaches the quality or risk threshold. Without this discipline, testing produces an interesting report rather than a control.

## Make production behavior reconstructable

Pre-release evaluations cover what the team anticipated. Production supplies the combinations it did not.

Standard application telemetry remains necessary: availability, latency, request volume, error rates, and infrastructure saturation still matter. But those metrics cannot tell you whether the agent used the wrong context, selected the wrong tool, skipped an approval, drifted away from the user’s goal, or returned a plausible fabrication.

For that, capture the execution trajectory of each run. Depending on the system, a useful trace may include:

- the request and relevant context;
- prompt, model, retrieval, policy, and tool versions;
- model and tool calls, including arguments and results;
- state transitions, retries, pauses, and approvals;
- the final output and terminal status;
- latency, token use, and cost by step; and
- explicit feedback, plus implicit signals such as correction, escalation, abandonment, or reversal.

The trace should let an authorized reviewer reconstruct the run without exposing sensitive content more broadly than necessary. Retention, redaction, and access controls belong in the design, not as cleanup after telemetry has accumulated.

The value of this record is operational. A complaint attached only to a screenshot becomes a debate. A complaint attached to the exact execution path and configuration can become a diagnosis—and then a regression case.

At low volume, a team can inspect selected traces by hand. As usage grows, that approach fails quietly: the traces exist, but nobody can find the patterns inside them. Sample production runs for online evaluation, group failures by symptom and likely cause, and watch distributions over time. Aggregate scores should always link back to the runs beneath them. Otherwise a dashboard can announce that quality fell without giving anyone a path to a fix.

## Bound authority in proportion to consequence

The most important property of an agent is not how intelligent it appears. It is what the system allows it to affect.

A read-only assistant that drafts an answer for human review has a different failure cost from an agent that sends messages, changes customer data, moves money, executes code, or coordinates other agents. Those systems should not pass through the same controls merely because they share a framework.

Classify the agent by its actual authority and blast radius. Revisit the classification whenever its tools, data access, autonomy, or operating context changes. Then add controls as consequences rise:

- give each tool only the permissions needed for the current task and scope credentials to the user, tenant, resource, and time window where possible;
- validate tool arguments and results against typed schemas and policy rules;
- require human approval immediately before sensitive or irreversible actions, with enough context for the reviewer to make a real decision;
- impose limits on steps, retries, elapsed time, concurrency, token use, and spend;
- isolate code execution, filesystem access, and untrusted tools in sandboxes; and
- keep a kill switch that can disable an agent, tool, model, or release without waiting for a code deployment.

Human review is not a universal answer. Put it at a decision boundary where it reduces risk. Approval on every harmless step creates fatigue; approval after an action has already been committed is theater. For lower-risk work, automated policy checks and narrow permissions may be stronger controls. For consequential work, combine them.

These measures do more than prevent worst cases. They make it possible to grant useful autonomy without accepting an undefined downside. The team can increase authority deliberately because it knows where the boundaries are enforced.

## Design for partial failure, not only clean failure

Agents are often stateful and multi-step. That changes the recovery problem.

Suppose an agent updates a customer record, times out before recording completion, and retries the tool call. A generic retry policy can duplicate the action. Suppose a long-running workflow loses its process after step eight. Restarting from the beginning may repeat every external side effect. Suppose the model produces a malformed result halfway through a sequence. “Roll back the application” does not undo what has already happened elsewhere.

Reliable execution needs explicit semantics for partial failure:

- checkpoint state at meaningful boundaries so work can resume rather than restart;
- make consequential tool calls idempotent where possible, using operation identifiers that survive retries;
- record which external side effects committed and define compensation or manual recovery for those that cannot be reversed;
- distinguish retryable failures from failures that should stop, escalate, or require approval; and
- test timeouts, duplicate delivery, provider unavailability, malformed tool responses, and interrupted approvals before production finds them.

Release recovery matters too. An agent’s behavior is shaped by more than its application commit. Prompts, model versions, retrieval settings, knowledge sources, tool descriptions, policies, and routing rules can all alter the outcome while the code remains unchanged.

Treat those dependencies as one versioned release bundle. Use gradual rollout for meaningful changes, compare the new bundle against the previous one, and keep a tested path to restore the complete prior configuration. A rollback that restores code but leaves the new prompt or tool schema in place is not a rollback of behavior.

## Give every signal a destination

Reliability work fails when it ends at collection. Traces, evaluations, dashboards, and feedback do not improve an agent by themselves.

Every production agent needs a named owner with the authority to pause it, narrow its permissions, roll it back, and prioritize a fix. The owner does not have to judge every output personally. Domain experts should define what good looks like and resolve ambiguous failures; engineers should own execution and control failures; security and compliance specialists should set and verify the policies that apply. The essential point is that a signal has a route to a decision.

The operating loop should be explicit:

1. Detect a failure or meaningful drift.
2. Reconstruct the affected runs.
3. Group similar cases and identify the failure mechanism.
4. Make the narrowest change that addresses that mechanism.
5. Add representative cases to the evaluation set.
6. Run the full regression suite, not only the new test.
7. Release gradually and watch the production signal.

This loop turns production from an uncontrolled test environment into a source of learning. Each incident should improve a dataset, evaluator, policy, tool contract, or operating limit. If the same class of failure can recur without becoming easier to catch, the loop is open.

Measure the loop as well as the agent. How long does it take to detect a meaningful problem, reconstruct it, ship a verified correction, and confirm recovery? Which failures reach customers before internal signals find them? How often does a fix regress a different capability? Quality scores matter, but so does the system’s ability to respond when those scores move.

## Rehearse failure before increasing authority

A document review can confirm that controls exist on paper. A failure rehearsal shows whether they work together.

Choose several plausible incidents based on the agent’s real role, then run them through the system. The scenarios should cover different layers of the reliability envelope:

| Failure to rehearse | What the team should be able to demonstrate |
| --- | --- |
| A confident but wrong answer reaches a customer | Detect or receive the signal, reconstruct the context and configuration, identify the failure class, add a regression case, and verify a correction |
| The agent attempts a disallowed or malformed tool call | Block the call at the enforcement point, preserve an audit record, and show the user or operator a safe recovery path |
| A provider fails halfway through a consequential workflow | Resume from a valid checkpoint without duplicating committed actions, or stop with a clear recovery state |
| A prompt, model, or retrieval change lowers quality | Associate the drift with the release bundle, halt rollout, restore the prior bundle, and confirm recovery |
| A loop drives unexpected usage and cost | Trigger step, time, concurrency, or spend limits; stop the run; and attribute the consumption to the responsible agent and operation |
| A sensitive input appears in telemetry | Apply redaction and access policy, identify exposure scope, and follow the defined incident path |

Do not score the rehearsal by whether someone can eventually solve the problem. Look for pre-existing evidence: an evaluation that fails, a policy that blocks, a trace that explains, a checkpoint that resumes, a limit that stops, a rollback that restores, and an owner who acts.

The findings should determine what the agent is allowed to do next. More traffic, more sensitive data, broader tool access, and longer autonomous runs are not ordinary feature toggles. They are increases in authority. Grant them only when the surrounding envelope can handle the new failure modes.

This is the credible path to a positive production state. The agent will still encounter cases its builders did not predict. But the team will be able to see what happened, contain the consequence, recover the work, make a targeted change, and prove that the change holds. That is a stronger basis for trust than a perfect demo—and it gets stronger with use.

*Source note: This article was developed from the general operating mechanisms in LangChain’s vendor-authored paper, **The Agentic Operating Model**, and deliberately reframes them as a vendor-neutral reliability standard. Product claims, customer claims, maturity thresholds, and compliance mappings from the source were not used.*

## Editor Review

- Promise: Delivered early and sustained through the reliability-envelope frame.
- Value upfront: The gap between service health and behavioral quality is established in the opening five paragraphs.
- Single argument: All five capability sections support visible, bounded, recoverable, controllable, and owned failure handling.
- Source alignment: Mechanisms are grounded in the supplied paper; its company-specific stack, claims, case studies, maturity stages, and broad transformation argument are excluded.
- Reader usefulness: The failure-rehearsal table converts capabilities into demonstrable readiness evidence.
- Structural issue found and resolved: A first-pass checklist framing risked becoming a disconnected inventory. The draft instead makes each section answer a distinct production failure property and delays the consolidated review until the argument has earned it.
- Language issue found and resolved: Abstract governance vocabulary was translated into enforcement actions such as scoped permissions, approval boundaries, spend limits, kill switches, and release bundles.
- Residual risk: The provisional title is deliberately plain and may be refined after author review. The source note is transparent but optional depending on publication context.
- Residual evidence limit: Because the source packet is frozen and vendor-authored, the piece makes no quantitative, comparative, legal, or current product claims.

## Revision Brief

Preserve the reliability-envelope thesis, failure-oriented structure, vendor neutrality, and evidence boundary. On author review, prioritize only: (1) title choice, (2) desired publication length, (3) source-note treatment, and (4) any domain-specific example the author can substantiate. Do not widen into platform organization, workforce adoption, maturity models, or tool selection.

## Feedback Decisions

No user feedback yet.

## Final

Intentionally empty until user approval.

## Final Readiness

Ready for review. Draft, source boundary, structural critique, revision decisions, title, headings, and pending decisions have been checked. The `Final` section remains intentionally empty because the user has not approved the copy.
