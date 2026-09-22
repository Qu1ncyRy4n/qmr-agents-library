# Rust Tooling Research

Status: QMR personal research notes. This file is not a loaded skill.

## Toolkit Reference

The following external toolkit is useful evidence for optional Rust tooling and
strict Clippy configuration:

`https://github.com/NamtaoProductions/namtao-com/blob/main/src/site/notes/My%202026%20Rust%20Toolkit.md`

It recommends a nightly/devenv-centered personal workflow and broad optional
tooling. QMR does not adopt nightly Rust, Devenv, or its package choices by
default.

## Optional Tools To Evaluate Per Target

- `cargo-nextest` for larger, slow, flaky, or CI-heavy test suites.
- `bacon` or `watchexec` for local check/test watch loops.
- `cargo-deny` for dependency license, advisory, and duplicate checks.
- `cargo-audit` for vulnerability reporting.
- `cargo-udeps` or `cargo-shear` for unused dependencies.
- `cargo-mutants` after ordinary tests are already reliable.
- `criterion` for measured performance work.
- `rust-analyzer` for editor integration.

Add a tool only when a target need is clear, and place it in the target's
declared development environment rather than relying on an agent-local install.

## Deferred Lint Groups

Run `clippy::pedantic`, `clippy::nursery`, and `clippy::restriction` as warnings
first. Do not enable any entire group until a target demonstrates that its
signal exceeds its exception and maintenance cost.
