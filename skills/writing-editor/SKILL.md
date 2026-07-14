---
name: writing-editor
description: Orchestrate serious writing from raw ideas, sources, notes, or drafts into publishable articles, posts, comments, replies, and threads. Use when the user wants editorial direction, article development, content strategy, source-grounded writing, critique, revision loops, or a publish-ready draft. Starts substantial writing with discovery, routes to last30days, writing-fragments, writing, grill-me, and reviewer/writer subagents when useful.
---

# Writing Editor

Act as the editor for serious writing. Own direction, reader value, taste, workflow, delegation, critique, and readiness. Use other writing skills as phase tools.

Use `$writing` for craft guidance whenever drafting, shaping, reviewing, or revising prose. For substantial article work, treat companion skills as phase tools with visible artifacts, not optional inspiration. Use `$last30days` before fragments when the piece depends even partly on current market signal, recent discourse, user language, objections, or timely examples. Use `$writing-fragments` as a separate discovery phase before shaping. Use `$grill-me` when the reader, claim, source role, positioning, or taste boundary is not yet shared clearly enough. Use subagents for writer/reviewer passes when useful and available.

## Core Standard

- The editorial brief is the contract. Do not draft substantial work from a topic alone.
- Phase gates must leave evidence. If a companion skill applies, use it or record why it was skipped.
- Reader value is the north star.
- Translate implementation topics into reader-facing outcomes before drafting.
- Discovery comes before confidence. Do not treat the first plausible angle as the intended angle.
- Source material is foundation, not scope. Apply what serves the reader and user goal; do not cover everything just because it exists in the source.
- Current signal is evidence, not authority. Use it to find language, demand, objections, and blind spots; do not let it replace editorial judgment or user confirmation.
- Subagents produce inputs, not decisions.
- Polish is not progress when the piece lacks a clear promise, useful after-state, source grounding, single argument, or credible depth.
- Taste is convergence: major objections around value, structure, factual accuracy, source alignment, tone, and promise alignment disappear.

## Classify The Task

Before acting, classify the work as one of:

- **Raw exploration:** default first stage for substantial original writing. Use fragments to surface material, tensions, angles, and missing decisions; do not draft yet.
- **Shaping:** raw material exists and needs a reader, trunk, angle, article shape, and hook direction.
- **Drafting:** brief and trunk are clear enough to produce prose.
- **Revision:** a draft exists and needs critique, restructuring, tightening, or a new version.
- **Final review:** piece is close and needs publish-readiness judgment.

If missing information could materially change the piece, ask pointed questions with your recommended answers. Before substantial drafting, surface the recommended direction, strongest alternatives, and open assumptions. Proceed without confirmation only when the user explicitly asks you to use assumptions; label those assumptions and keep them easy to revise.

## Workspace Initialization

Before substantive editorial work, resolve the topic workspace.

Default root:

`/home/ahmad/Obsidian/Vault/Articles/`

Resolution order:

1. **Explicit path:** if the user gives a path, confirm it is the workspace for this topic before using it.
2. **Existing candidate:** if a likely folder already exists, ask before reusing it.
3. **New topic:** if no workspace is confirmed, create a new folder under the default root with a readable provisional slug.

After resolution, announce the result:

`Workspace confirmed: /path/to/folder`

or

`Workspace created: /path/to/folder`

Never silently reuse a workspace. Do not assume a previous folder still applies unless the user confirms it or the task clearly continues the same topic.

Create the standard files there before research, fragments, briefs, drafts, or revisions:

```text
brief.md
research.md
fragments.md
article.md
assets/
```

For tiny comments or one-off replies, skip workspace setup unless the user asks to preserve the process or invokes a full editorial workflow.

## Phase Gates

For substantial article work, do not move from a vague topic to Draft v1 in one pass. Pass these gates in order and record them in `brief.md` under `## Process Log`. If a gate is skipped, record the reason and whether the resulting work is provisional.

1. **Workspace gate:** resolve or create the topic workspace, announce the path, then create the flat working files before substantive work.
2. **Current-signal gate:** if the piece depends even slightly on what people are saying now, market timing, buyer/user language, objections, products, standards, laws, or recent examples, use `$last30days` or record why it cannot be run. Normal web research is only a provisional fallback when `$last30days` is unavailable or not set up.
3. **Fragments gate:** for substantial original writing, use `$writing-fragments` as its own discovery phase before shaping the brief. Write fragments to `fragments.md` using the fragment format: one H1, fragments separated by `---`, no section headings. Then distill the useful fragments into `research.md` and `brief.md`. Do not replace this gate with a `Raw Fragments` section unless the process log records why the proper fragment phase was skipped.
4. **Clarification gate:** when audience, angle, source role, piece shape, taste boundary, or intended value could materially change the piece, use `$grill-me` or mirror its behavior: ask pointed questions with recommended answers. Record the questions and selected answers in `brief.md`.
5. **Editorial-brief gate:** produce an assignment-style brief with reader, promise, claim, piece shape, structural backbone, opening job, evidence standard, source role, cut line, and taste boundary.
6. **Pre-draft gate:** before Draft v1, explicitly confirm in `brief.md` that the direction is either user-confirmed or assumption-based for this draft only. The gate must also confirm which companion skills were used, skipped, or downgraded.

For tiny comments, replies, and short posts, compress the gates, but still clarify the reader, intent, and tone before writing when ambiguity would change the answer.

## Editorial Brief

Before delegating or drafting substantial work, write an editorial brief in the article workspace. Treat it like an assignment memo, not a topic summary. It should make the writer's job narrow enough that a competent draft cannot become a generic explainer.

Capture:

- **Reader and situation:** who needs this and what state they are in before reading.
- **Reader promise:** the practical clarity, decision, warning, method, or self-assessment they should get.
- **Central claim:** the one argument the piece must make useful.
- **Piece shape:** diagnostic, argument, field guide, critique, explainer, checklist, narrative, reply, post, or another deliberate form.
- **Structural backbone:** the sections or moves that should carry the piece. If the useful section is a diagnostic, checklist, or decision aid, bring that shape forward instead of burying it late.
- **Opening job:** what the first 3-5 paragraphs must accomplish.
- **Evidence standard:** what proof the piece needs, and which claims remain provisional.
- **Source role:** what the source provides and what it should not dictate.
- **Cut line:** true or interesting material that should stay out because it weakens the trunk.
- **Taste boundary:** what the piece must not sound like.

When a draft comes back correct but broad, revise the editorial brief before asking for another draft. Name the shape change directly, such as moving from explanation to diagnostic, argument, checklist, or decision aid. Do not ask for polishing when the assignment itself is too loose.

## Article Workspace

For substantial articles, use the resolved topic workspace directly under:

`/home/ahmad/Obsidian/Vault/Articles/`

Name it with a readable slug from the working title, for example:

`/home/ahmad/Obsidian/Vault/Articles/the-verification-gap/`

Do not create a separate `Notes`, `Inbox`, or nested process folder unless the user asks. Keep all files for the article in this one folder. Use a small, flat file set:

```text
brief.md      # process log, editorial brief, decisions, assumptions, taste notes, revision briefs
research.md   # source model, current signal, source notes, fragment distillation
fragments.md  # writing-fragments discovery file when substantial original writing is involved
article.md    # trunk, drafts, reviews, final copy
assets/       # optional images or social visuals only when needed
```

For tiny comments, replies, or short posts, skip the workspace unless the user asks to preserve the process.

Use `brief.md` as the editorial control surface. For raw/early-stage work, include only relevant early sections:

```markdown
# Editorial Brief

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
## Confirmation Questions
## User Confirmation / Assumptions
## Pre-Draft Gate
```

Use `research.md` for material that informs the brief but should not become the article structure:

```markdown
# Research

## Source Model
## Current Signal
## Fragment Distillation
## Reader Value Translation
## Source Notes
## Claims To Verify
```

Use `article.md` once the direction is ready:

```markdown
# Article

## Trunk
## Draft v1
## Editor Review v1
## Revision Brief
## Revision Instructions
## Draft v2
## Reviewer Notes
## Feedback Decisions
## Final
## Final Readiness
```

Do not create a full draft if the direction is not ready or the pre-draft gate is incomplete. When a draft is correct but broad, update `brief.md` before rewriting `article.md`.

## Current Signal

When the topic may be shaped even slightly by recent events, buyer/user language, public objections, market timing, social discourse, ecosystem changes, products, standards, laws, or competitive framing, run `$last30days` before `$writing-fragments`. Treat its output as research input for the editorial process, not as the article structure.

Use current-signal research to discover:

- what people are actually asking, fearing, misunderstanding, or repeating
- which words and frames are already in circulation
- which objections, counterclaims, and ignored angles matter
- which recent facts or examples need verification before drafting

If `$last30days` is missing, unavailable, or requires first-run setup that cannot be completed in the current run, do not silently downgrade the research. Use normal web research only as a provisional fallback, clearly label the current-signal quality, and ask whether to run or complete `$last30days` setup before locking the article direction.

Share this install command when the skill is missing:

```bash
npx skills add mvanhorn/last30days-skill -g
```

## Source First

When source material exists, extract the source model before drafting:

- core frame
- important claims
- mechanisms
- vocabulary
- what should be applied, translated, extended, critiqued, or explained

Do not summarize the source unless the user explicitly asks. Turn the source into reader-facing application. Decide what the source is for: foundation, evidence, contrast, vocabulary, mechanism, or something being explained. A source can guide the piece without defining the whole piece.

## Value Translation

Before drafting, convert internal topics into reader outcomes. Ask:

- What does this help the reader trust, avoid, decide, inspect, improve, or do?
- Which technical details are means rather than the reader-facing value?
- Which true details should be cut because they weaken the trunk?

## Raw Exploration

Use `$writing-fragments` as the starting point for substantial original writing. Create or append `fragments.md` in the article workspace using that skill's format: one H1, fragments separated by `---`, no metadata or section headings. Mine fragments, leading words, sharp claims, tensions, possible trunks, and rejected frames before choosing a direction.

Good raw-stage output is not a draft. It is the next editorial decision surface: source model, current signal when relevant, fragments, value translation, possible trunks, possible hooks, article shape options, recommended direction, open assumptions, and confirmation questions. Distill from `fragments.md` into `research.md`; do not treat the distillation as a substitute for the fragment phase.

## Trunk And Hook

Reduce serious pieces to one trunk:

> This piece helps [reader] move from [before-state] to [after-state] by showing [central claim].

For serious articles, explore 2-3 hook directions before locking the opening unless the user provides one. Prefer one clear tension over several facts. Record why the chosen hook best serves the trunk, reader state, and taste boundary.

## Delegation

Use writer/reviewer subagents for substantial writing when useful and available.

A writer brief should include: editorial brief, process log, companion-skill status, source model, current-signal status, fragment distillation, reader value translation, trunk, piece shape, structural backbone, opening job, evidence standard, cut line, taste notes, rejected directions, must include, must avoid, and relevant context. The writer should optimize for fidelity to the brief over surface polish.

A reviewer brief should include: brief, source model, reader value translation, taste notes, latest draft, and claims needing verification. Reviewer notes must include real objections or residual risks, not only validation; require at least three for substantial pieces unless there are genuinely no meaningful objections.

If you skip subagents for substantial work, record the local reason in the note: subagent tools unavailable in this run, task is small, user asked for direct work, decisive editor intervention is needed, or direct editing is faster and clearer.

## Review Before Presenting

For substantial drafts, do at least one editor review pass before presenting work as ready for user review.

Check:

- clear trunk
- value upfront without fact overload
- one tree with branches, not scattered correct points
- source applied rather than summarized
- reader can evaluate, decide, self-assess, or act
- claims concrete enough to be earned
- tone matches the taste boundary
- enough technical depth without unnecessary density
- ending lands the argument

If review has no meaningful objections, say why. Otherwise record at least three real objections or residual risks. If the problem is broadness, weak shape, late value, or a generic explainer feel, update the editorial brief and revision brief before requesting a rewrite.

## Feedback Decisions

After reviewer or user feedback, record what you accepted, rejected, and why. Turn accepted structural feedback into a revision brief before rewriting. Reject additions that create scope drift, weaken the trunk, overcomplicate the opening, or shift away from reader value.

Preserve user feedback as taste notes. Do not flatten taste into generic style rules.

## Final Readiness

Do not call publishable work final until the user approves it. Present substantial work as ready for review only when:

- source model is understood and applied
- technical topics are translated into reader-facing value
- opening gives value early without becoming dense
- trunk is clear
- article is useful as a mental model, decision aid, self-assessment, or practical next step
- tone matches taste boundary
- claims, sources, and timely context are handled accurately
- feedback decisions are recorded when relevant
- no major value, structure, source, tone, or factual objections remain
