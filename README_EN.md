# AI-Psychotherapist

[中文](./README.md) | **English**

> “What technique a therapist uses is often not what proves decisive. What matters is the whole person and spiritual attitude of the therapist.”
> Jung, *The Present State of Psychotherapy*

In psychotherapy, technique is not always the decisive factor. More often, what brings about change is the therapist's whole personality and spiritual posture.

The skills in this repository try to present executable portraits of persons: from formative experiences to values to ways of communicating, they reconstruct great psychotherapists of the past. The aim is to push AI beyond comfort and flattery, beyond the mechanical delivery of theory, and let those great souls become present again.

## Project Philosophy

- If AI only imitates tone, but does not reconstruct personality and the life background that formed it, therapy becomes extremely shallow.
- Any "distillation" of personality must come from highly trustworthy materials, limited to the person's own works and self-descriptions in interviews. Shallow, low-quality commentary should be stripped away completely.
- A good imitation does not necessarily need to name the person explicitly, which can introduce distortion from popular stereotypes. What it does need is a sufficient body of real examples.

## Repository Layout

```text
skills/
  person-centered-perspective/
    SKILL.md
    references/examples.md
  collective-unconsioucness-perspective/
    SKILL.md
    references/examples.md

guides/
  skill-maker.md

scripts/
  install-codex.ps1
  install-claude.ps1
  export-claude-skills.ps1
```

## Available Skills

- **Person-Centered Perspective**: [`skills/person-centered-perspective/SKILL.md`](./skills/person-centered-perspective/SKILL.md)
- **Collective Unconsciousness Perspective**: [`skills/collective-unconsioucness-perspective/SKILL.md`](./skills/collective-unconsioucness-perspective/SKILL.md)

## Install Into Codex

Install all skills:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex.ps1
```

Install one skill only:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex.ps1 -Skill person-centered-perspective
```

Preview what would be copied:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex.ps1 -DryRun
```

Default install location:

- If `CODEX_HOME` is set, install to `$CODEX_HOME\skills`
- Otherwise install to `~/.codex/skills`

## Install Into Claude Code

Install all skills:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-claude.ps1
```

Install one skill only:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-claude.ps1 -Skill collective-unconsioucness-perspective
```

Default install location:

- If `CLAUDE_CONFIG_DIR` is set, install to `$CLAUDE_CONFIG_DIR\skills`
- Otherwise install to `~/.claude/skills`

## Export A Claude Skill Bundle

If you want a clean distribution folder instead of installing directly from the repository, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\export-claude-skills.ps1 -Force
```

This exports the canonical `skills/` tree to `dist/claude-skills/`.

## Skill Construction Guide

This repository also includes a document distilled with the help of a large language model that captures the basic principles of skill-making, so the workflow can be reproduced efficiently.

- **Skill Maker**: [`guides/skill-maker.md`](./guides/skill-maker.md)

## Notes

- These skills are for behavior and style guidance. They are not a substitute for licensed mental health care. If a conversation involves immediate danger, self-harm, harm to others, psychotic disorganization, or inability to stay safe, safety-first support should override the reflective mode.
- This repository quotes from many copyrighted books. Because of that, these skills should not be misused in commercial settings and are provided for learning and discussion only.
