---
marp: true
paginate: true
title: Library Category Walkthrough
---

<!--
Format: Marp slide deck. Slides split on `---`.
Speaker notes live in HTML comments and double as a TTS narration script.
Source: Q&A pass over qmr-agents-library/LIBRARY-MAP.md, 2026-09-14.
Status: explainer only. Makes no changes to the library and locks no decisions.
-->

# Library Category Walkthrough

Reading `qmr-agents-library/LIBRARY-MAP.md`

What the categories mean, where they overlap, and what to rename.

<!--
This deck explains the category scheme in the library map. It answers eight
questions: what Instructions means, what diff discipline means, how planning
differs from decision first, whether an identity section still earns its place,
whether the category order matters, what safe defaults and runtime hygiene are
for, what seven specific reference modules actually do, and which names should
change. Nothing here changes the library.
-->

---

## 1. What "Instructions" means

**What to do.** Positive procedure, imperative voice.

| Category | Question it answers |
|---|---|
| Instructions | What do I do? |
| Constraints | What must I not do? |
| Cognition | How do I think before doing? |

<!--
Instructions is the category for positive procedure. It tells the agent what to
do, in imperative voice. It sits against two neighbours. Constraints says what
not to do. Cognition says how to think before doing anything at all.
-->

---

## When to file under Instructions

Write it as **numbered steps** → Instructions.

Write it as **never / only** → Constraints.

Write it as **before you decide** → Cognition.

Examples:
- "Inspect, scope, validate, report" → Instructions
- "Do not commit secrets" → Constraints
- "Run the thought experiment before locking" → Cognition

<!--
The test is mechanical. If the module reads naturally as numbered steps, it is an Instruction. If it reads as never or only, it is a Constraint. If it governs what happens before a decision is made, it is Cognition. Focused change loop is an Instruction. Do not commit secrets is a Constraint. Run the thought experiment before locking is Cognition.
-->

---

## 2. "Diff discipline" — what it actually says

Changes stay tied to the request. No drive-by cleanup.

- No rewrap, no reorder, no prose polish
- No rewriting a file from scratch
- Applies to code, docs, slides, TODOs alike

<!--
Diff discipline is about keeping changes scoped. Changes stay tied to the request or a locked decision. No rewrapping lines, no reordering unrelated sections, no normalising prose style. No rewriting a file from scratch when four lines would do. It applies to every file in the repo, not only code.
-->

---

## Diff discipline in practice

- Edit 4 lines, don't rewrite the 200-line file
- `git mv` for moves, so a rename reads as a rename
- Noticed typo? Only if asked, or a separate commit
- Final `git diff` pass: every hunk traceable to the ask

**The name is wrong.** It sounds like "format diffs in chat a certain way."

<!--
In practice: edit four lines rather than rewriting the two hundred line file. Use git mv for moves so the rename shows up as a rename instead of a delete and an add. If you notice a typo, fix it only when asked or in a separate commit. Before finishing, read the full diff and confirm every hunk traces back to the request. The name is the weak part. Diff discipline sounds like a rule about how to display diffs in chat, not about restraint in editing.
-->

---

## 3. Planning vs decision-first

Different axes. They do not overlap.

| | `decision-first` | `planning` |
|---|---|---|
| What | Lock ambiguous choices with the user before editing | Where planning artifacts live on disk |
| Content | Six decision categories, ask-then-lock, Decision Lock gate | `TODO/TODO-<handle>-<slug>.md`, priority index, `.d` attempt dirs |
| Nature | Behavior protocol | Filesystem convention |

<!--
These two look adjacent but sit on different axes. Decision first is a behavior protocol: collect the user's choices across six categories, lock them, present a decision lock, and only then edit. Planning is a filesystem convention: where TODO files live, how they are named, how attempt directories hang off them. One
governs conversation, the other governs paths.
-->

---

## Planning: what carries over

`agents/planning` is a three-line pointer to a CDINT record-layout guide.

Universal part: **plans live in files, not chat.**

Everything else — handles, `.d` directories, per-protocol layout — is CDINT-specific.

→ Low priority for a personal baseline.

<!--
The planning module today is a three line pointer at a CDINT layout guide. The
only genuinely universal idea inside it is that plans live in files rather than
in chat scrollback. Handles, dot-d attempt directories and per-protocol layout
are all CDINT specific. For a personal baseline this is low priority.
-->

---

## 4. Does Identity still earn its place?

Mostly no — for code work.

- `role.md` — "you are a software engineering assistant on {{repo_name}}"
  → the harness already knows this. Dead weight.
- `source-of-truth.md` — "read the design of record before changing architecture"
  → that is an **Instruction**, misfiled.

<!--
For code work, mostly no. There are two identity modules. Role tells the agent
it is a software engineering assistant working on a named repo, which the
harness already establishes, so it is dead weight. Source of truth tells the
agent to read the design of record before changing architecture, which is a
positive procedure and therefore belongs under Instructions. It is misfiled.
-->

---

## Keep the slot, leave it empty

Identity earns its place when **persona actually matters**:
teacherbot, domain expert voice, a deliberately non-default register.

The map already says *"no active reusable module."* That is the right answer.

<!--
Keep the category slot. Identity earns its place when persona genuinely matters
— a teaching voice, a domain expert register, anything deliberately off the
default. The library map already records no active reusable module under
Identity. That is the correct state. Leave it.
-->

---

## 5. Is the category order arbitrary?

As a **taxonomy** — yes, largely.

As **render order** — no. It is prompt-assembly order, and position carries weight.

Proposed order is better than the current one:

```
Intro/Identity -> Process/Workflow -> Constraints/Safety -> Format -> Code
```

<!--
As a taxonomy the ordering is close to arbitrary. As render order it is not,
because this is the order modules get assembled into the prompt, and position
carries weight. The proposed ordering — intro, then process and workflow, then
constraints and safety, then format, then code — is better than the current
one.
-->

---

## The order is not the point

Constraints last is defensible on recency.
Safety-before-work reads clearer for a human editing the library.

Either works. **Pick one, write it down, stop relitigating.**

The real value: category is **metadata for selection**, not a hierarchy.
"Show me all Constraints modules" — not "Constraints come third."

<!--
Putting constraints last is defensible, because recency gives them weight.
Putting safety before the work reads more clearly for a human editing the
library. Both work. Pick one, write it down, and stop relitigating it. The
actual value of categories is selection metadata — being able to ask for every
Constraints module — not a hierarchy that dictates order.
-->

---

## 6. Safe defaults vs runtime hygiene

Both Constraints. Both "don't leave junk." Different stakes.

- **safe-defaults** — *irreversible harm*
  No secrets, keys, binaries, local state. No deleting or overwriting user work
  without asking. Security and data loss.
- **runtime-hygiene** — *mess*
  Temp files to `/tmp`, not the repo. Deterministic tests. No surprise network calls.

<!--
Both are Constraints and both sound like do not leave junk behind, but the
stakes differ. Safe defaults is about irreversible harm: no committing secrets,
keys, binaries or local state, and no deleting or overwriting the user's work
without asking. Security and data loss. Runtime hygiene is about mess: temp
files go to slash tmp rather than the repo, tests stay deterministic, no
surprise network calls.
-->

---

## Three modules, one idea, split badly

`safe-defaults` + `runtime-hygiene` + `repository-hygiene` overlap heavily.

Suggested collapse:

- `no-secrets-or-destruction` (safety)
- `keep-repo-clean` (hygiene)

Two, not three.

<!--
Safe defaults, runtime hygiene and repository hygiene overlap heavily across
the active tree and the v1 reference library. Collapsing them gives two
modules: one for safety, covering secrets and destruction, and one for
cleanliness. Two, not three.
-->

---

## 7. The reference modules, in one line each

**focused-change-loop** — the base work rhythm.
Understand → scope → preserve existing tree changes → validate → report.
Everything else hangs off it. Most universal module in the library.

**clear-handoff** — end-of-turn report contract.
Files changed, checks run, one concrete example when a decision is subtle.
Stops "I made some updates!"

<!--
Focused change loop is the base work rhythm: understand the request, keep the
change scoped, preserve changes already in the working tree, validate, and
report. Everything else hangs off it, which makes it the most universal module
in the library. Clear handoff is the end of turn report contract: which files
changed, which checks ran, and one concrete example when a decision would
otherwise be hard to follow. It exists to stop the empty I made some updates
sign-off.
-->

---

## The reference modules (cont.)

**minimal-diff** — duplicate of `diff-discipline`. Delete one.

**lightweight-escalation** — risk tiering.
Routine work → just do it. Durable or risky → stop and ask.
Named triggers: architecture, wire format, persisted data, security boundary,
irreversible op, public spec, another repo's ownership.

→ This is the module that makes `decision-first` bearable.
Without it, every edit needs a decision round.

<!--
Minimal diff is a duplicate of diff discipline; one of the two should go.
Lightweight escalation is risk tiering. Routine work just proceeds. Durable or
risky work stops and asks. The triggers are named explicitly: architecture, a
wire format, persisted data, a security boundary, an irreversible operation, a
public specification, or another repository's ownership boundary. This is the
module that makes decision first bearable — without it, every single edit
drags in a full decision round.
-->

---

## The reference modules (cont.)

**coordination-ids** — proquint handles as one shared namespace across
TODO / TE / DR / DI, so records reference each other without timestamps or
counters. Mint with the tool; never invent one.

→ CDINT-specific. Skip for a personal baseline.

<!--
Coordination IDs establishes proquint handles as a single shared namespace
across TODOs, thought experiments, decision records and decision intent
entries, so records can reference each other without depending on timestamps or
an integer counter. Handles are minted with the repository's tool, never
invented by inspection. This is CDINT specific — skip it in a personal
baseline.
-->

---

## The reference modules (cont.)

**staged-migration** — replace an implementation in reviewable stages.
Record direction, compatibility promise, cutover criteria and rollback *before*
building the successor. Inventory the old contract. Parity defined per surface.
Cutover gated on evidence, not on the successor merely existing.

**local-service-design** — sockets, CLI, state files are public interfaces.
One typed operation per capability across GUI/CLI/API. Decide framing, errors
and versioning up front. Name the owner of each mutable state. Test malformed
input and restart.

Both heavy, both correct, both rarely needed.

<!--
Staged migration covers replacing an implementation in reviewable stages:
record the migration direction, the compatibility promise, cutover criteria and
the rollback path before substantial work on the successor, inventory the old
contract, define parity per public surface, and gate cutover on reviewed
evidence rather than on the successor merely existing. Local service design
treats sockets, command line clients and state files as public interfaces: one
typed domain operation per capability across GUI, CLI and API; framing, errors
and versioning decided up front; one named owner for each piece of mutable
state; malformed input and restart tested as first class behavior. Both are
heavy, both are correct, and both are rarely needed.
-->

---

## 8. Renames

Names should say the **behavior**, not the concept.

| Now | Better |
|---|---|
| `diff-discipline` | `smallest-edit` / `scope-the-edit` |
| `minimal-diff` | *(merge into above)* |
| `safe-defaults` | `never-commit-secrets` |
| `runtime-hygiene` | `keep-repo-clean` |
| `focused-change-loop` | `change-loop` (fine as-is) |

<!--
Names should say what the agent does, not name an abstract concept. Diff
discipline becomes smallest edit, or scope the edit. Minimal diff merges into
it. Safe defaults becomes never commit secrets. Runtime hygiene becomes keep
repo clean. Focused change loop is already fine and can shorten to change loop.
-->

---

## Renames (cont.)

| Now | Better |
|---|---|
| `clear-handoff` | `report-what-changed` |
| `lightweight-escalation` | `stop-when-durable` / `ask-before-irreversible` |
| `coordination-ids` | `handle-naming` |
| `comment-preservation` | `keep-comment-intent` |
| `skill-use` | `load-matching-skill` |

**Rule: verb phrase naming what the agent does.**
`decision-first` and `error-handling` already pass.

<!--
Clear handoff becomes report what changed. Lightweight escalation becomes stop
when durable, or ask before irreversible. Coordination IDs becomes handle
naming. Comment preservation becomes keep comment intent. Skill use becomes
load matching skill. The rule underneath all of these is a verb phrase naming
what the agent does. Decision first and error handling already pass that test
and need no change.
-->

---

## Summary

1. **Instructions** = what to do. Steps, not prohibitions.
2. **Diff discipline** = restraint in editing, badly named.
3. **planning** = where files live; **decision-first** = how choices get locked.
4. **Identity** — keep the slot, leave it empty for code work.
5. **Order** — render order, not taxonomy. Pick one and move on.
6. **Three hygiene modules** collapse to two.
7. **focused-change-loop** and **lightweight-escalation** are the load-bearing pair.
8. **Rename to verb phrases.**

<!--
To summarise. Instructions means what to do, in steps, not prohibitions. Diff
discipline means restraint in editing and is badly named. Planning covers where
files live while decision first covers how choices get locked. Identity keeps
its slot but stays empty for code work. Category order is render order rather
than taxonomy, so pick one and move on. The three hygiene modules collapse to
two. Focused change loop and lightweight escalation are the load bearing pair.
And the modules should be renamed to verb phrases.
-->
