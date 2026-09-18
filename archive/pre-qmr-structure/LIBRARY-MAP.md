# Library Map

Status: planning reference. The intended structure in
[`2026-09-14_new_structure.md`](../Agents/docs/2026-09-14_new_structure.md) is
the basis for this library. This map is an inventory and selection aid, not a
promotion decision. Only material under `agents/`, `skills/`, and `guides/` is
active library content. Everything under `reference/` remains evidence.

## Core Agent Structure

The active `agents/` content is the always-loaded core. Organize future core
modules under these headings. A module can be short and may serve more than one
heading; do not duplicate rules merely to make the tree look complete.

```text
Intro
|-- Agent role and delegation boundaries
|-- No agent commit/signature identity
`-- Flag conflicting, stale, incomplete, or inaccessible instructions

Workflow / Process
|-- Principled code and tool use: load applicable skills or guides
|-- Decision grain: agree how much implementation detail the developer controls
|-- Decision first: plans, TODOs, DR/DI records, and thought experiments
`-- Staged delivery: API -> CLI -> GUI/network; show interfaces and expected use

Constraints / Safety
|-- Bounded changes and focused change loop
|-- Existing-comment and intent preservation
|-- Test-heavy development and reuse before invention
|-- Read-only investigation where possible
`-- Security, privacy, and operational-security boundaries

Presentation / UX
|-- Direct, low-cognitive-load communication
|-- Examples, schemas, and visual explanations when useful
|-- Optional personas and accessibility modes
`-- Optional teaching and user-model guidance

Multi-Agent Workflow
|-- Defined design, architecture, and implementation roles
|-- Peer communication and manager authority
`-- Naming, location, and retention rules for coordination artifacts

Skills
|-- Tools: Git, shell, TODO tooling, Mogent
|-- Languages: Python/uv/Nix/Jupyter, Go, Rust, Nix
|-- Documentation: DR/DI, TE, handoff, TODOs, research, local docs
|-- Writing: presentations and TTS slides
`-- Code process: refactoring and other triggered procedures

Guides
`-- Deeper language, tool, project, and domain material selected as needed
```

`specs/` remains a distinct non-rendered home for normative protocols. An agent
or skill should point to a specification when it needs the protocol's source of
truth rather than repeat its full schema.

## Interface Tree

```text
qmr-agents-library/
|
|-- agents/                         Always-loaded behavior
|   |-- decision-first               Lock unresolved decisions before edits
|   |-- decision-record-authority    DR/DI authority and provenance
|   |-- thought-experiments          TE trigger, neutrality, scenarios, artifact
|   |-- comment-preservation         Preserve intent; audit comment deltas
|   |-- diff-discipline              Keep changes scoped and traceable
|   |-- error-handling               Do not silently ignore command or Go errors
|   |-- repository-hygiene           Do not commit local state or binaries
|   |-- skill-use                    Load an applicable skill; preserve authority
|   |-- planning                     Route planning work to its guide
|   `-- go-basic-workflow            Basic Go test and formatting commands
|
|-- skills/                         Triggered, ordered procedures
|   |-- edit-thought-experiment      Safely update an already-filed TE
|   `-- promisegrid-poc              Preserve PromiseGrid POC lineage and gates
|
|-- guides/                         Selectable explanatory or scoped guidance
|   |-- development/
|   |   |-- dr-di-record-schema      Current organization record fields
|   |   |-- planning-records         Tentative root TODO convention and alternatives
|   |   |-- go-layout                CDINT Go layout and documented alternative
|   |   `-- go-coding-style          Current intact Go style source
|   `-- promisegrid/
|       `-- promise-action-minimalism  PromiseGrid wire-action rule
|
|-- specs/                          Normative protocols, not automatically loaded
|   `-- (none yet)
|
|-- overlays/                       Project, language/tool, or person/machine additions
|   `-- (none yet)
|
|-- intake/                         Material under active review
|   `-- exemplar/wire-lab-exemplar   Current bounded source exemplar
|
|-- provenance/                     Scope, source, and migration decisions
|   |-- SOURCES                       Imported-source record
|   `-- questions                     Owner decisions and deferred work
|
`-- reference/                      Non-selectable evidence
    |-- v1-library/                  Earlier 51-module library
    |-- prior-libv2-notes/           Earlier vocabulary and intake candidates
    `-- source-guides/               Captured source documents and skills
```

## Legacy Content-Category Cross-Index

This older render-oriented axis remains useful as a discovery cross-index. It
does not control the new library structure above, and a module's category does
not determine whether it is an agent, skill, guide, specification, or overlay.

```text
Identity
`-- No active reusable module. Keep repository facts as local overlays.

Instructions
|-- agents/decision-first
|-- agents/decision-record-authority
|-- agents/thought-experiments
|-- agents/comment-preservation
|-- agents/planning
|-- agents/skill-use
`-- skills/edit-thought-experiment

Constraints
|-- agents/diff-discipline
|-- agents/error-handling
|-- agents/repository-hygiene
`-- guides/promisegrid/promise-action-minimalism

Format
|-- guides/development/go-coding-style
|-- guides/development/dr-di-record-schema
`-- Future: response/handoff and glossary modules

Cognition / Process
|-- agents/decision-first
|-- agents/thought-experiments
|-- skills/edit-thought-experiment
`-- Reference candidates: high-consequence review, lightweight escalation,
    governed handoff, decision lifecycle modules

Communication / Style
`-- Reference candidates: personas, accessibility, teacherbot

Code
|-- agents/go-basic-workflow
|-- guides/development/go-layout
|-- guides/development/go-coding-style
`-- Reference candidates: Go tests, test strategy, Rust, Python, Nix, Godot

Notes / Docs
|-- agents/planning
|-- guides/development/planning-records
`-- Reference candidates: documentation, public prose, terminology, handoff
```

## Reference Candidate Tree

These are available to review, not insert. Paths name the original candidate
area so later selection does not need another archaeology pass.

```text
archive/agents-libraries-v1/
|-- cdint/
|   |-- shared-baseline: identity, safe defaults, runtime hygiene,
|   |   |   focused change loop, Git, documentation, minimal diff, clear handoff
|   |-- process: decision-first, thought experiment, decision intent,
|   |   |   open questions, high-consequence review, lightweight escalation,
|   |   `-- governed handoff
|   |-- engineering: coordination IDs, errors, comment intent, tests,
|   |   |   runtime artifacts, reviewability, code quality
|   |-- go: development, code, tests
|   |-- docs: public prose
|   `-- cdint-and-promisegrid: protocol changes, public prose, terminology,
|       collaboration boundaries
|-- ucd_research: research orientation, reproducible analysis, experiment
|   validity, data protection, scientific analysis, file/CLI work, uv
`-- personal: local services, staged migration, communication variants,
    domain overlays, and Godot/Rust/Python/Nix language overlays

reference/prior-libv2-notes/intake/
|-- workflow: scoped changes, high-consequence review, risk-based escalation
`-- decision-governance: lock decisions, TE analysis, supersession, handoff

reference/source-guides/cdint-grid_skills/
|-- general workflow: load-project-context, resume, handoff, handback, commit
|-- decision/process: decision-first-change, run-thought-experiment, consensus,
|   getq, putq, drain-inbox, next10
`-- maintenance/review: newtree, retire, upgrade, explain-architecture,
    review-against-ninik, update-dobab
```

## Suggested First Personal Baseline

Start with modules that apply to nearly every code task and do not depend on
CDINT record locations, Go, or PromiseGrid:

```text
agents/skill-use
agents/diff-discipline
agents/error-handling                 (split to language guidance later if wanted)
agents/repository-hygiene
```

Add `decision-first`, `thought-experiments`, DR/DI material, Go guidance, and
PromiseGrid guidance only when you intentionally want those policies. Build
`specs/` from protocols you want to cite as normative truth rather than repeat
as agent behavior. Put repository facts, commands, paths, credentials, and
personal or machine state in `overlays/`, never in the baseline.
