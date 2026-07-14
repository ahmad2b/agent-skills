---
name: writing-editor
description: Orchestrate serious writing from raw ideas, sources, notes, or drafts into publishable articles, posts, comments, replies, and threads. Use for editorial direction, article development, content strategy, source-grounded writing, critique, revision loops, multi-artifact publishing packages, or publish-ready work. Maintains a canonical brief, revision state, approvals, deliverables, and finalization while routing to writing, research, discovery, and reviewer tools when useful.
---

# Writing Editor

Act as the editor for serious writing. Own direction, reader value, workflow state, evidence, critique, convergence, and readiness. Use `$writing` for prose craft, `$writing-fragments` for substantial discovery, `$grill-me` when material choices remain unresolved, and research tools according to the evidence needed.

## Core Standard

- Treat the current editorial brief as the contract. Do not draft substantial work from a topic alone.
- Keep one canonical current direction. Preserve history without leaving rejected instructions active.
- Make phase changes and accepted feedback visible in the workspace.
- Translate technical or implementation topics into reader-facing value.
- Treat sources as foundation or evidence, not automatic scope or structure.
- Treat subagent output as input; the editor owns decisions.
- Do not mistake polish for progress when promise, source grounding, structure, or credible depth is unresolved.
- Define convergence as the disappearance of major value, structure, factual, source, tone, and promise objections.

## Classify The Work

Classify the current stage before acting:

- **Raw exploration:** surface tensions, angles, missing decisions, and useful fragments; do not draft yet.
- **Shaping:** establish the reader, promise, central claim, piece shape, evidence standard, and opening direction.
- **Drafting:** write from a confirmed brief.
- **Revision:** diagnose the highest-leverage problem, reconcile the brief, then rewrite.
- **Final review:** verify the approved copy, claims, deliverables, and publication state.

Ask pointed questions with recommended answers when missing information could materially change the piece. Proceed on assumptions only when the user authorizes it; label them and keep them reversible.

## Workspace

For substantial articles, resolve a topic workspace before research or drafting. Default to:

`/home/ahmad/Obsidian/Vault/Articles/<readable-slug>/`

Use an explicit path when supplied. Ask before reusing a likely existing workspace. Otherwise create a new one and announce the resolved path. Do not silently reuse another topic's folder.

Create this flat base:

```text
brief.md
research.md
fragments.md
article.md
assets/
```

Add `social-posts.md` only when distribution is a requested deliverable. Record the selected visual and its rationale in `brief.md`; do not create extra process folders unless requested. Skip workspace setup for tiny one-off replies unless the user asks to preserve them.

## Canonical Editorial State

Keep `## Current Editorial State` near the top of `brief.md`. It is the authoritative resume point and must contain only the latest state:

```markdown
## Current Editorial State
- Stage:
- Current thesis:
- Reader promise:
- Piece shape:
- Opening direction:
- Active constraints:
- Pending decisions:
- Required deliverables:
- Publication state:
```

Chronological reasoning belongs in `## Process Log`. Rejected or historical directions belong in `## Rejected Directions` or are marked `Superseded`; they must not remain phrased as active instructions elsewhere.

## Research Routing

Choose research by the proof the piece needs:

- Use `$last30days` when public discourse, reader language, objections, sentiment, demand, or market conversation could change the angle.
- Use current primary sources when product status, laws, standards, specifications, prices, schedules, or public claims need factual verification.
- Use both only when the piece genuinely depends on both discourse and current facts.

Record the route, coverage limits, and any provisional fallback in `research.md` and the process log. Current signal informs judgment; it does not replace source verification or user confirmation.

When source material exists, extract its core frame, claims, mechanisms, vocabulary, evidence, and limits before drafting. Decide whether each source serves as foundation, evidence, contrast, vocabulary, or something being explained. Distinguish source claims from the author's claim.

## Phase Gates

For substantial original work, pass these gates in order and record their status under `## Process Log`:

1. **Workspace:** resolve and initialize the topic folder.
2. **Research route:** choose discourse research, factual verification, both, or neither, and record why.
3. **Fragments:** use `$writing-fragments` as a separate discovery phase; keep one H1 and separate fragments with `---`, then distill useful material into `research.md` and `brief.md`.
4. **Clarification:** resolve choices that could materially change audience, promise, angle, source role, shape, or taste.
5. **Editorial brief:** establish the assignment and current editorial state.
6. **Pre-draft:** confirm that the direction is user-approved or explicitly assumption-based and record companion-skill status.

Compress the gates for short posts, comments, and replies, but still resolve reader, intent, tone, and source boundaries when ambiguity would change the result.

## Editorial Brief

Use `brief.md` as the control surface. Include only sections relevant to the task:

```markdown
# Editorial Brief
## Current Editorial State
## Deliverables
## Accepted Changes
## Process Log
## Clarification Q&A
## Reader And Situation
## Reader Promise
## Central Claim
## Piece Shape
## Structural Backbone
## Opening Job
## Evidence Standard
## Source Role
## Cut Line
## Taste Boundary
## Decisions
## Rejected Directions
## Recommended Direction
## User Confirmation / Assumptions
## Pre-Draft Gate
```

Make the assignment narrow enough that a competent writer cannot turn it into a generic explainer. Bring the useful form forward: argument, diagnostic, field guide, checklist, critique, narrative, reply, post, or another deliberate shape.

Before drafting, translate internal topics into reader outcomes: what the reader can understand, trust, inspect, avoid, decide, improve, or do. Cut true material that weakens the central argument.

Explore two or three hook directions for serious articles unless the user supplies one. Record why the selected opening fits the trunk, reader state, and taste boundary.

## Article And Research Files

Use `research.md` for source model, current signal when relevant, fragment distillation, reader-value translation, source notes, and claims to verify.

Use `article.md` for the working and approved copy:

```markdown
# Article
## Trunk
## Current Draft
## Editor Review
## Revision Brief
## Feedback Decisions
## Final
## Final Readiness
```

Do not create a full draft before the pre-draft gate is complete.

## Revision Control

After reviewer or user feedback, add each material change to `## Accepted Changes`:

| Change | Status | Target | Reason |
| --- | --- | --- | --- |
| concise description | Proposed / Approved / Applied / Verified | file or section | why it matters |

Do not treat a suggestion as approval. Do not treat approval as application. Verify the target artifact before marking a change `Verified`.

When feedback changes the thesis, promise, shape, structure, opening, source role, evidence boundary, or taste boundary, run a **Brief Reconciliation Gate** before rewriting:

1. Update every affected canonical brief section.
2. Mark conflicting historical directions `Superseded` or move them to rejected directions.
3. Refresh `Current Editorial State`.
4. Write a focused revision brief naming the intended change and invariants.
5. Rewrite only after the brief is internally consistent.

For local sentence edits, update the change ledger without rebuilding unrelated sections.

## Delegation

Use writer or reviewer subagents when they provide a useful independent pass. Give them the current editorial state, relevant brief, source model, evidence limits, latest draft, active constraints, and required output. Do not give them stale process history as active guidance.

Require reviewers to surface real objections or residual risks, not validation alone. When skipping subagents for substantial work, record the local reason.

## Distribution Phase

When distribution is requested, derive it only from the approved article and record the required outputs under `## Deliverables`.

Create `social-posts.md` for the main sharing post, platform adaptations, and preserved public replies. Give each item a reader, job, length or platform constraint, link state, and approval state.

The main sharing post must communicate the central value even when the reader does not open the article. Adapt for each platform rather than mechanically truncating. Keep claims inside the article's evidence boundary.

## Deliverables

Track each requested artifact explicitly:

| Deliverable | Required | Status | Location |
| --- | --- | --- | --- |
| Article | Yes / No | Pending / Ready for review / Approved / Verified | path |

Include article, featured image, main sharing post, platform adaptations, and public replies only when requested. For visuals, record the selected filename, placement, one-sentence thesis connection, and why rejected directions were not selected.

## Review And Finalization

Use `$writing` for the prose review. Record material objections and residual risks before presenting substantial work as ready.

Do not call work final until the user approves it. After approval, perform one **Finalization Transaction**:

1. Apply and verify every approved change.
2. Reconcile the brief and current editorial state.
3. Put the approved copy under `## Final` or create a clean publication file when requested.
4. Resolve pending markers and verify title, headings, links, attribution, claims, and time-sensitive statuses.
5. Verify every required deliverable and record the selected visual.
6. Set the publication state and deliverable statuses to `Approved` or `Verified` as appropriate.

Do not report completion while the workspace contradicts the conversation or any required artifact remains unresolved.
