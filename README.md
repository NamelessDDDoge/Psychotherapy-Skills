# AI-Psychotherapist

[English](./README_EN.md) | **中文**

> “治疗者使用什么技术，实际上并没有那么重要；关键不在技术，而在使用技术的人。”
> 荣格《心理治疗之现状》

在心理治疗中，技术有时并不起到决定性作用。相反，治疗师的整个人格和精神姿态才是一切改变的关键。

本仓库的 skill 试图呈现一组可执行的人物画像，从经历到价值观再到交流方式，重塑过往的伟大心理治疗师。让 AI 不止于安慰和奉承，不耽于理论的灌输，而是使那些伟大的灵魂重新“在场”。

## 项目理念

- 如果 AI 只模仿语气，而不重建人格（以及造就人格的经历背景），治疗会极其浅薄。
- 对人格的“蒸馏”必须来源于高度可信的资料，仅限于本人作品和访谈自述。任何肤浅的低质量评价都应该被彻底清洗掉。
- 好的模仿未必需要“指名道姓”（这可能引入大众语境中的误解），只需要提供充足的真实案例。

## 仓库结构

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

## 当前 Skills

- **Person-Centered Perspective**: [`skills/person-centered-perspective/SKILL.md`](./skills/person-centered-perspective/SKILL.md)
- **Collective Unconsciousness Perspective**: [`skills/collective-unconsioucness-perspective/SKILL.md`](./skills/collective-unconsioucness-perspective/SKILL.md)

## 安装到 Codex

安装全部 skills：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex.ps1
```

只安装单个 skill：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex.ps1 -Skill person-centered-perspective
```

仅预览复制结果：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex.ps1 -DryRun
```

默认安装位置：

- 如果设置了 `CODEX_HOME`，则安装到 `$CODEX_HOME\skills`
- 否则安装到 `~/.codex/skills`

## 安装到 Claude Code

安装全部 skills：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-claude.ps1
```

只安装单个 skill：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-claude.ps1 -Skill collective-unconsioucness-perspective
```

默认安装位置：

- 如果设置了 `CLAUDE_CONFIG_DIR`，则安装到 `$CLAUDE_CONFIG_DIR\skills`
- 否则安装到 `~/.claude/skills`

## 导出 Claude 技能包

如果你想导出一个干净的分发目录，而不是直接从仓库安装，可以运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\export-claude-skills.ps1 -Force
```

它会把 canonical `skills/` 导出到 `dist/claude-skills/`。

## Skill 制作说明

本仓库还通过大语言模型，提炼出了 skill 制作的基本原则文档，用于高效复刻此流程。

- **Skill Maker**: [`guides/skill-maker.md`](./guides/skill-maker.md)

## 说明

- 这些 skills 是行为与风格指导，不替代持证心理健康服务。如果对话涉及即时危险、自伤、伤人、精神病性失序或无法保证安全，应由 safety-first 支持覆盖纯反思式风格。
- 本仓库中参考了许多有关书籍中的原文，由于版权原因，禁止在商业场景下滥用本 Skill，仅供学习交流。
