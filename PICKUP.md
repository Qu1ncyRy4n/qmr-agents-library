# Agents Library Pickup

Date: 2026-09-04
Status: paused after coding style and error handling; resume with DR/DI records
and comment preservation

## Purpose

Build a dogfoodable agents library from the wire-lab exemplar by copying source
language verbatim, comparing variants visibly, and obtaining explicit choices
before placing material in agents, skills, guides, or specifications.

## Working Method

- Workbench source blocks are verbatim, not summaries or rewrites.
- Graphical comparison comes after the verbatim source blocks.
- The workbench contains only current or new material; do not retain completed
  sections under a `Recorded` heading.
- Present no more than five decision questions at once.
- Put the source name beside every choice.
- Classify always-needed guidance as `agents/`, triggered procedures as
  `skills/`, and project-specific or ambiguous material as `guides/` for now.
- Preserve every source rule until it has an explicit disposition. The prior
  libv2 material is reference evidence, not the active library.
- After writing an active-library Markdown file, open it with `zed <filename>`.

## Decisions Through This Checkpoint

### Repository And Source Handling

- `/Users/q/Documents/Code/cdint/agents_library` is the active new library.
- `reference/` contains copied evidence only and is not rendered as active
  library content.
- Repository-wide `git diff --check` reports pre-existing whitespace in several
  verbatim reference files. Do not normalize those source bytes; run the check
  on authored paths separately until reference preservation has a dedicated
  validation rule.
- Keep source wording and source labels visible. Do not replace source text with
  a generalized summary at the top of the workbench.

### Planning And Skills

- Use root `TODO/` plus proquint handles as the tentative planning-record
  default; ask Steve to confirm it against the older per-protocol layout.
- Keep a small always-loaded skill-authority rule and put detailed triggered
  procedure in skills.
- Keep PromiseGrid promise-action minimalism in a PromiseGrid guide.
- Keep PromiseGrid POC superset discipline in a triggered PromiseGrid skill.
- Defer generalizing the POC skill until it is dogfooded.

### Decision-First Workflow

- Retain strict decision-first behavior as the current default. Preserve lighter
  mutually exclusive profiles for later comparison.
- Ask small batches of independent questions; ask dependent or complex
  questions individually.
- Check architecture, behavior, implementation, function naming, variable
  naming, and path decisions semantically, without forcing six separate
  questions.
- Tentatively use bounded path approval for ordinary work and exact approval for
  risky operations; Steve must confirm this simplification.
- Keep the complete workflow in agent guidance during dogfooding. Attempt skill
  extraction later and keep the agent version recoverable.

### Thought Experiments

- Trigger a TE when multiple plausible designs remain. Defer stricter profiles.
- Do not preselect a winner; compare alternatives under the same assumptions.
- Use the full relevant scenario list by default. Defer a reduced risk-based
  profile.
- Keep the complete TE workflow in agent content during initial dogfooding.
- Always write a standalone TE for now. Defer a high-consequence-only artifact
  profile.

### Editing Filed Thought Experiments

- Keep Cat-1a through Cat-7 behavior unchanged for now. Ask Steve whether the
  historically numbered interface should eventually gain clearer names.
- Put the compact durable-history invariant in agent guidance and the detailed
  categorized procedure in a triggered skill.
- Read the affected TE plus directly relevant locally present linked TEs and
  refinements. This agrees with current cdint-grid more closely than an
  unbounded transitive policy-chain read.
- Require the canonical TE status field. Status is part of the editing policy,
  but it is separate from category classification.

### Coding Style, Diffs, And Errors

- User wording for design placement: "seems like spec / guide / skills
  terirtory. Global state is always good advice. lets keep it for now, we can
  trim and tighten up later." Current implementation preserves the complete
  source in `guides/development/go-coding-style.md`; its eventual split remains
  open.
- Select the full minimal-diff and no-unrelated-normalization rule. Add its
  CDINT-wide status to the questions for Steve.
- Retain explicit shell command statuses and the prohibition on ignored Go
  errors for now. Preserve a portable language-neutral variant as future work.
- Require `gofmt` and `errcheck` for Go changes for now. Preserve moving both to
  a Go-specific guide as a future option.

## Active Library Written So Far

- `agents/decision-first.md`
- `agents/diff-discipline.md`
- `agents/error-handling.md`
- `agents/go-basic-workflow.md`
- `agents/planning.md`
- `agents/repository-hygiene.md`
- `agents/skill-use.md`
- `agents/thought-experiments.md`
- `guides/development/go-coding-style.md`
- `guides/development/go-layout.md`
- `guides/development/planning-records.md`
- `guides/promisegrid/promise-action-minimalism.md`
- `skills/edit-thought-experiment/SKILL.md`
- `skills/promisegrid-poc/SKILL.md`

## Open Questions For Steve

The authoritative list is `provenance/questions.md`. Current Steve questions
cover planning-record placement, bounded path approvals, Cat naming, and full
diff discipline as a CDINT-wide default.

## Remaining First-Document Review

1. DR/DI records and comment-preservation policy.
2. DR record format and source-of-truth boundaries.
3. Testing guidance and commit workflow.
4. Glossary and terminology handling.
5. Final handoff, compliance, and output requirements.
6. End-to-end audit that every wire-lab source section has an explicit active,
   deferred, repository-local, or rejected disposition.

## Resume Sequence

1. Read this file and `provenance/questions.md`.
2. Read `../Agents/docs/wb.md`; replace its paused notice with only the current
   DR/DI source slices, graphical comparison, and at most five choices.
3. Continue from
   `reference/source-guides/promisegrid_wire-lab_refs_heads_main_AGENTS.md:200`.
4. Keep every displayed source excerpt verbatim.
5. Open each written active-library Markdown file in Zed.
