# QMR Agents Library

Personal agent-module library and primary dogfood source.

## Live Library

- `agents/`: always-loaded core guidance.
- `skills/`: triggered procedures.
- `specs/`: canonical normative protocols.
- `guides/`: deeper selectable language, tool, project, and domain guidance.
- `overlays/`: project, language/tool, or person/machine additions.

The first live core-and-constraints modules have been extracted from the
reviewed design, not copied from the archive.

## Design

[`design/2026-09-14_new_structure.md`](design/2026-09-14_new_structure.md) is
the current structure and module-design workbench.

## Configuration

`library.mogent.hcl` is the live Mogent v2 sidecar. It owns the selectable
section tree, each branch's `offer`, inline tags and TLDRs, and the declared
`skills/` raw tree. A consumer starts from it with:

```sh
mogent init --template qmr-core --source qmr=../qmr-agents-library
mogent plan
mogent apply
```

The historical v1 YAML template is archived under
`archive/yaml-v1-templates/`.

## Archive And Evidence

- `archive/agents-libraries-v1/`: exact archive of the former
  `Agents/libraries/` tree.
- `archive/pre-qmr-structure/`: pre-cutover QMR candidates, intake, and
  checkpoints.
- `archive/provisional-lib-qmr-2026-09-11/`: draft review snapshot with manual
  approval metadata and candidate review order.
- `reference/`: captured source guides and prior library-design evidence.
- `provenance/`: source and migration records.

<!--
Do not render or select archive/ or reference/ content as active library
modules. New proposals and review notes belong in HTML comments.
-->
