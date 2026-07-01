# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Repository overview

English-language AI video workflow: **Claude Code** (scripts + storyboards), **Nana Banana Pro** (assets), **Seedance 2.0** (video). Turns stories into multi-episode series with consistent style and character design.

## Core workflow

1. **Script** — Four-act structure from source material
2. **Asset plan** — Numbered C01–C99 / S01–S99 / P01–P99 prompts
3. **Image generation** — Nana Banana Pro (or equivalent) with shared style prefix
4. **Storyboards** — Seedance timeline prompts (0–3s … 12–15s)
5. **Video** — Seedance 2.0 + extension for episode chaining

## Project structure

```
Seedance2-Storyboard-Generator/
├── .claude/skills/seedance-storyboard-generator/
├── docs/
│   ├── script-and-storyboard.md
│   ├── workflow.md
│   ├── structured-prompt.md
│   └── ...
├── lin-chong-project/
├── nie-feng-project/
├── necklace-project/
├── sima-guang-project/
├── yashan-battle-project/
├── lu-zhishen-project/
└── script-and-storyboard/
```

## File patterns

- `[Title]_script.md` — Four-act script with episode breakdown
- `[Title]_asset-list.md` — Asset generation prompts (English style prefix)
- `[Title]_E[XX]_storyboard.md` — Per-episode Seedance storyboard

## Asset numbering

| Prefix | Range | Type | Example |
|--------|-------|------|---------|
| C | C01–C99 | Characters | C01 Lin Chong · front full body |
| S | S01–S99 | Scenes | S01 fodder depot · snow |
| P | P01–P99 | Props | P01 spear |

## Seedance prompt structure

1. **Asset upload table** — Slot → asset ID mapping
2. **Seedance prompt** — Timeline beats, sound, `@image_file_N` / `@video_file_N` refs
3. **End frame** — Last frame for next-episode continuity

## Video extension

Episodes 2+:

- Upload previous episode as `@video_file_1`
- Open with: `Extend @video_file_1 by 15s`

## Style consistency

Shared prefix on all asset prompts, e.g. `Chinese ink wash painting style mixed with anime cel-shading`.

## Constraints

- Max **9 images**, **3 videos** (≤15s total) per job
- Sensitive terms may fail moderation
- Limited in-platform editing — regenerate for most fixes
- Complex prompts (300+ words) may drift

## Camera keywords (English)

Push in, pull out, pan, truck, follow, orbit, crane, Hitchcock zoom, one shot, handheld shake.

## Skill usage

```
/skill seedance-storyboard-generator
```

## Reference documentation

- `.claude/skills/seedance-storyboard-generator/SKILL.md`
- `.claude/skills/seedance-storyboard-generator/references/seedance-manual.md`
- `.claude/skills/seedance-storyboard-generator/references/story-to-video-script-template.md`
- `.claude/skills/seedance-storyboard-generator/references/good-script-examples.md`
