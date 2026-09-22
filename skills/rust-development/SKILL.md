---
name: rust-development
description: Develop or review Rust changes with repository-native checks, typed boundaries, and focused tests. Use when changing Rust code, Cargo configuration, or workspace structure.
# Develop Rust Changes

## Start With Repository Practice

Read the relevant crate, workspace, documentation, and existing tests. Use a
documented `just`, `make`, or other repository wrapper when it encodes project
policy. Otherwise run `cargo fmt`, `cargo check`, and focused `cargo test` for
the changed crate or behavior.

## Keep The Boundary Typed And Narrow

Use typed structures and enums for domain concepts rather than distributing
strings through command handling. Prefer enums, named methods, newtypes, or a
builder when they make intent clearer than boolean or ambiguous `Option`
parameters.

Before a first implementation slice that constrains later work, identify its
responsibility and public compatibility boundary. Keep parsing and domain
operations behind typed interfaces so CLI, GUI, or service adapters can share
behavior without prematurely requiring an async or multi-crate design.

## Control Dependencies And Generated Changes

Do not add a database, async runtime, GUI framework, or broad dependency unless
the requested behavior needs it. When dependency files change, run the
repository's documented lockfile refresh command and include resulting updates.

## Verify

Keep tests deterministic and prefer whole-object equality when it makes failures
clear. Report the focused checks run, broader checks intentionally omitted, and
any compatibility or dependency decision that still needs developer approval.


## Strict checks / compilation

Run lints and compile checks often,
# notes / ideas
Possibly research rust idioms / dialects / patterns?
https://github.com/NamtaoProductions/namtao-com/blob/main/src/site/notes/My%202026%20Rust%20Toolkit.md
I think he uses a very strict clippy config thatcould make things even safer.

Don't really know rust super intimately. For all skillsm we should strip out anything pretty generic, or possibly pull and use other peoples rust skills. Please research this, Agent.
