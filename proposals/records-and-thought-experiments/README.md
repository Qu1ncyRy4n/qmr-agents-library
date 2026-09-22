# Records And Thought Experiments Proposal

Status: QMR personal workbench. Nothing in this directory is live library
content, selected by a template, or rendered by Mogent. Edit and approve these
sections before placing them in `agents/`, `skills/`, or a future `specs/` tree.

## Todo App Handoff

To evaluate proquint adoption in `todo_app_project`, point the repository agent
at these sources in order:

1. `archive/agents-libraries-v1/cdint/engineering/coordination-ids.md`
   defines the shared proquint namespace, naming conventions, legacy-ID rule,
   and append-only DI supersession rule.
2. `archive/pre-qmr-structure/agents/decision-record-authority.md` defines DR
   and DI authority, citations, and human decision ownership.
3. `archive/pre-qmr-structure/guides/development/dr-di-record-schema.md`
   records the older CDINT identity-field convention. Treat it as evidence, not
   a QMR requirement.
4. `archive/pre-qmr-structure/agents/thought-experiments.md` defines the
   source TE trigger, neutrality, scenario analysis, and artifact expectations.
5. `archive/pre-qmr-structure/skills/edit-thought-experiment/SKILL.md` defines
   preservation and supersedence of an already-filed TE.

The installed Mogent command can mint a collision-checked proquint against a
repository working tree:

```sh
cd /home/qix/dev/omnicortex/todo_app_project
mogent mint -r .
```

Dogfood finding: in the current todo-app working tree, this command did not
finish within two minutes. Do not adopt it as the repository minting workflow
until its whole-tree scan, likely including generated build output, is profiled
and bounded or excluded.

Before adopting it, have the todo-app agent decide and record:

- whether new IDs use one five-character handle namespace across TODO, TE, DR,
  and DI while existing numeric IDs remain historical;
- which current `DI/` and `DR/` files, if any, are migrated or only
  cross-referenced;
- where new TODO and TE artifacts live in this repository; and
- whether one repository-local record convention is sufficient before any
  future multi-repository coordination.

The QMR proposal below recommends retaining numeric records unchanged and using
proquints only for newly created artifacts after that target decision.

## Proposed Agent Modules

### Durable Decision Records

Proposed placement: `agents/workflow/durable-decision-records.md`.

```markdown
# Keep Durable Decision Records

Use a decision request (DR) for an unresolved durable question. Use a decision
intent (DI) for a durable decision the developer has settled. Do not silently
replace an older DI; add a newer DI that names what it supersedes.

The developer owns the decision. An agent records a DR or DI unless the
developer explicitly delegates decision authority. Create or update a record
when a choice is at or above the selected decision involvement level, or when
it materially affects safety, scope, compatibility, cost, or future work.

Use the repository's configured record locations and identifier convention. Link
code or documentation to a record when its reasoning would otherwise be unclear
or easily lost. Use the decision-record skill for record shape and procedure.
```

### Decision Involvement Level

Proposed replacement for
`agents/workflow/developer-decision-involvement-level.md`:

```markdown
# Developer Decision Involvement Level

Define the decision involvement level as the lowest level at which the developer
wants to approve choices. Offer three defaults: `outcome` for mission, intent,
and behavior; `interface` for architecture, API or CLI shape, and data model;
and `implementation` for functions, control flow, and names.

Ask about unresolved choices at or above that level. Surface lower-level choices
only when they materially affect the agreed outcome, safety, or scope. Before
asking about a durable choice at that level, open or update its DR. After the
developer settles it, record a DI before implementation when the decision needs
to remain recoverable.
```

This keeps ordinary implementation moving: it does not require a DR or DI for
every local decision.

### Author Ownership And Record Attribution

Proposed replacement for `agents/intro/author-ownership.md`:

```markdown
# Author Ownership, No Agent Signatures

The developer owns official authorship. Do not add commit trailers, signatures,
or authorship claims unless the developer explicitly requests them. Do not add
model, provider, or company names to Git history, generated attribution, source
files, logs, or record fields unless the developer explicitly requests that
specific disclosure and confirms it is permitted.

For a DR or DI, name the human decision-maker as its author. An agent may be
described as a generic recorder or assistant only when that process history is
useful. Do not claim that an agent made a decision unless the developer
explicitly delegated that authority.
```

This retains the compliance boundary while preserving factual decision history.

## Mutually Exclusive TE Trigger Profiles

Select exactly one profile in a consuming target. These proposed fields are
intentionally not live Mogent frontmatter: Mogent currently rejects unknown
metadata and does not enforce exclusive groups. They are a test case for future
`exclusive_group` metadata design, not a request to fake support now.

### Risk And Choice Trigger

Proposed placement:
`agents/workflow/thought-experiment-when-designs-remain.md`.

```markdown
---
tags: [workflow/decision, records/thought-experiment]
exclusive_group: thought-experiment-trigger
profile: risk-and-choice
---
# Use A Thought Experiment When Multiple Designs Remain

Use a thought experiment before locking a durable decision when multiple
plausible designs remain. Also use one when a decision materially affects
safety, compatibility, data, cost, or long-term architecture.

Compare alternatives under the same assumptions. State what each alternative
makes easier, harder, and newly required. A thought experiment narrows options;
it does not decide for the developer. Use the thought-experiment skill for the
full procedure and artifact shape.
```

### Strict Standalone Trigger

Proposed placement:
`agents/workflow/thought-experiment-before-every-non-trivial-decision.md`.

```markdown
---
tags: [workflow/decision, records/thought-experiment]
exclusive_group: thought-experiment-trigger
profile: strict-standalone
---
# Write A Thought Experiment Before Every Non-Trivial Decision

Before locking a non-trivial decision, write a standalone thought experiment.
Identify the decision, alternatives, assumptions, relevant scenarios,
conclusions, surviving choices, and unresolved questions. Compare alternatives
under the same assumptions and do not pre-select a preferred outcome.

A thought experiment narrows options; it does not decide for the developer.
After the developer chooses, record the decision before implementation. Use the
thought-experiment skill for the full procedure and artifact shape.
```

## Proposed Skills And Specification

### Decision Records Skill

Proposed placement: `skills/manage-decision-records/SKILL.md`.

Trigger: creating, updating, reviewing, or superseding a DR or DI.

Inputs: repository record configuration, decision involvement level, existing
related records, and explicit developer decision or unresolved question.

Procedure:

1. Confirm the target repository's record location and identifier convention.
2. Preserve existing records and identifiers; mint a new proquint only when the
   target has adopted the namespace.
3. Open a DR for an unresolved durable question. Record alternatives, evidence,
   decision owner, and the next required choice.
4. Append a DI for a settled decision. Name prior DIs it supersedes rather than
   rewriting their meaning.
5. Link affected plans, code, or documentation only where the decision context
   is useful to future readers.
6. Report record paths, outstanding questions, and what was not decided.

### Run Thought Experiment Skill

Proposed placement: `skills/run-thought-experiment/SKILL.md`.

Trigger: the selected TE profile requires analysis before a decision.

Procedure:

1. State the decision under test, alternatives, assumptions, affected systems,
   and governing work item.
2. Compare alternatives neutrally through relevant normal, failure, concurrency,
   evolution, trust-boundary, and scale scenarios.
3. Record what each alternative makes easier, harder, and newly required.
4. Identify rejected and surviving alternatives plus questions the developer
   must decide.
5. Write a standalone TE only when required by the selected profile or target
   repository convention.
6. Hand off to the decision-record skill after the developer decides.

### Edit Thought Experiment Skill

Candidate source:
`archive/pre-qmr-structure/skills/edit-thought-experiment/SKILL.md`.

Promote it only after choosing whether QMR adopts its Cat-1a through Cat-7
labels, statuses, and required `## Refinements` layout. Its preservation and
supersedence principle is compatible with this proposal; its exact vocabulary is
not yet QMR policy.

### Record Specification

Proposed placement: `specs/decision-records.md`.

It should define the target-owned parts not appropriate for `agents/`:
identifier namespace, filenames and locations, required DR/DI fields, human
identity conventions, status values, citation conventions, and migration rules
for legacy numeric records.

Do not copy the CDINT identity format or directory layout into QMR by default.
Adopt them per target after review.
