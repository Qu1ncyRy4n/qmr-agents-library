# Instructions, Skills, And Guides Across Agent Tools

Status: research reference only. Not active library content.

Reviewed: 2026-09-04.

## Findings

- `AGENTS-other-thing.md` is not a portable convention.
- Codex discovers `AGENTS.md` by directory. Its special replacement filename is
  `AGENTS.override.md`; configurable fallback filenames are tool-local settings.
- Claude Code uses `CLAUDE.md`, `.claude/rules/*.md`, path-scoped rules, imports,
  and skills. It explicitly recommends skills for multi-step or conditional
  procedures.
- Gemini CLI uses `GEMINI.md`, hierarchical/JIT context, `@file.md` imports,
  configurable context filenames, and Agent Skills.
- Agent Skills use startup metadata (`name`, `description`), load `SKILL.md` when
  activated, then load bundled references/scripts/assets as needed.
- A Markdown phrase such as `See build.md` is only a natural-language
  instruction. It does not load the file unless the agent reads it, the tool
  supports an import, or Mogent renders/configures it.

## Practical Library Rule

```text
agent guidance -> always-needed behavior and small routing rules
skill          -> triggered ordered procedure
guide          -> project-specific, explanatory, or currently ambiguous content
tool adapter   -> AGENTS.md / CLAUDE.md / GEMINI.md imports and scoped rules
```

Keep tool-specific override, import, and path-scoping mechanics in output
adapters. Do not make them universal library concepts.

## Primary Sources

- OpenAI Codex, AGENTS.md:
  https://developers.openai.com/codex/guides/agents-md
- AGENTS.md open format:
  https://agents.md/
- Claude Code memory and instructions:
  https://code.claude.com/docs/en/memory
- Gemini CLI context files:
  https://geminicli.com/docs/cli/gemini-md/
- Agent Skills specification:
  https://agentskills.io/specification
