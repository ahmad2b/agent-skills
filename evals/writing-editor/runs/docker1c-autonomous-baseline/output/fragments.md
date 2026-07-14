# What an AI Agent Needs Before You Can Trust It

The demo proves that the agent can succeed. Production reliability is the discipline of finding out when it did not—and limiting what can happen next.

---

An agent does not become production-ready when its answer quality looks impressive. It becomes production-ready when the surrounding system can observe its behavior, constrain its authority, measure its quality, survive interruptions, and learn from failure.

---

The useful unit is not the model response. It is the controlled outcome: the answer or action, the evidence that it was acceptable, the cost of producing it, and the path available when it was not.

---

Reliability is a control loop, not a launch gate. Define acceptable behavior. Test representative and hostile cases. Observe real runs. Turn failures into regression cases. Change one component. Re-evaluate before promoting it.

---

The trust envelope: the combination of actions an agent may take, data it may see, money and time it may spend, and uncertainty it may carry without human review. Production work is the work of making that envelope explicit and enforceable.

---

Most agent failures do not look like software failures. The process stays up. The API returns 200. The prose sounds plausible. Yet the agent used stale context, selected the wrong tool, skipped an approval, exposed data, or spent more than the outcome was worth.

---

Observability without evaluation creates a searchable haystack. Evaluation without production traces creates a laboratory that misses how customers actually behave. The two must feed each other.

---

Start with blast radius, not architecture. A read-only assistant that drafts for review needs a different control set from an agent that emails customers or writes to a system of record. Every added permission should trigger a new reliability decision.

---

Human approval is not a universal safety blanket. It belongs at the boundary where an uncertain recommendation becomes a consequential action. Too early and it destroys the value of automation; too late and it merely documents the damage.

---

The first evaluation set should encode what the business means by "good," not what is easiest to score. Domain experts supply hard cases, acceptable tradeoffs, and corrections; engineers turn them into repeatable checks.

---

Every production failure should leave the system harder to fool in the same way twice. Capture the trace, classify the cause, add or improve an evaluator, place the case in a regression set, fix the narrow cause, and verify the fix against the wider suite.

---

Version the behavioral system: prompts, models, tools, retrieval data, policies, evaluator definitions, and code. A code commit alone cannot explain why agent behavior changed.

---

Cost is a reliability property. An agent that is accurate but can loop indefinitely, call an expensive model unnecessarily, or consume more than the task is worth is not production-safe.

---

The positive future state is not an agent that never fails. It is an operation in which failures are bounded, visible, diagnosable, and converted into measurable improvements faster than usage introduces new surprises.

---

A practical readiness review asks six questions: Can we define good? Can we see what happened? Can we limit what it may do? Can it recover safely? Can we control unit economics? Can every failure improve the next release?

