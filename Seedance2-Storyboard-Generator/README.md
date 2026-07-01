# AI Video Production Workflow

End-to-end workflow using **Claude Code + Skill + Seedance 2.0** to turn novels and stories into multi-episode video series.

Inspired by: [*20-episode ink-wash AI drama with Seedance 2.0 — real experience*](https://linux.do/t/topic/1619920) (linux.do community). Coze skill share: https://www.coze.cn/?skill_share_pid=7609341973090041882

---

## Overview

Three tools work together from story to finished clips:

- **Claude Code** — script writing and storyboard generation
- **Nana Banana Pro** — character, scene, and prop reference images (or any image model)
- **Seedance 2.0** — video generation and extension

---

## Workflow

```
Theme → Script → Asset prompts → Image gen → Storyboard scripts → Generate video per episode
```

### Steps

1. **Script** — Adapt source material into a four-act structure (setup → development → turn → resolution)
2. **Asset plan** — Numbered prompts for characters (C), scenes (S), props (P)
3. **Image generation** — Unified style prefix across all assets
4. **Storyboard scripts** — Seedance 2.0 timeline prompts (0–3s, 3–6s, …)
5. **Video generation** — Use extension to chain episodes

---

## Project structure

```
Seedance2-Storyboard-Generator/
├── .claude/skills/seedance-storyboard-generator/  # Storyboard skill
├── docs/                                          # Workflow articles and references
│   ├── script-and-storyboard.md
│   ├── workflow.md
│   ├── structured-prompt.md
│   └── ...
├── lin-chong-project/                             # Example: Lin Chong
├── nie-feng-project/                              # Example: Nie Feng
├── necklace-project/                              # Example: The Necklace
├── sima-guang-project/                            # Example: Sima Guang
├── yashan-battle-project/                         # Example: Battle of Yashan
├── lu-zhishen-project/                            # Example: Lu Zhishen
└── script-and-storyboard/                         # Additional examples
```

---

## File naming

| Type | Pattern | Description |
|------|---------|-------------|
| Script | `[title]_script.md` | Full four-act script |
| Asset list | `[title]_asset-list.md` | Numbered image-generation prompts |
| Storyboard | `[title]_E[NN]_storyboard.md` | Single-episode Seedance prompt |

---

## Asset numbering

| Prefix | Range | Type | Example |
|--------|-------|------|---------|
| C | C01–C99 | Characters (multiple angles) | C01 Lin Chong · front full body |
| S | S01–S99 | Scenes / locations | S01 Cangzhou fodder depot · snow |
| P | P01–P99 | Props | P01 spear |

---

## Seedance 2.0 prompt format

Each storyboard file has three parts:

### 1. Asset upload table

```
| Slot | File | Notes |
|------|------|-------|
| image_file_1 | C01 | Character reference |
| image_file_2 | S01 | Scene reference |
```

### 2. Seedance prompt (timeline)

```
Ink-wash wuxia style, 9:16 vertical, gray-black palette

0-3s: High aerial — establish scene
3-6s: Push in — introduce subject
6-9s: Develop conflict
9-12s: Climax / emotional peak
12-15s: End beat / hold

【Sound】Score style + SFX + dialogue
【Refs】@image_file_1 character, @image_file_2 scene...
```

### 3. End frame

Describe the last frame for continuity into the next episode.

---

## Video extension (episode chaining)

From episode 2 onward:

1. Upload the previous episode as `@video_file_1`
2. Start the prompt with: `Extend @video_file_1 by 15s`
3. Chain: intro (new) → E1 (new) → E2 (extend E1) → E3 (extend E2) → …

---

## Style consistency

Start every asset prompt with the same style prefix, e.g.:

```
Chinese ink wash painting style mixed with anime cel-shading
```

Differentiate characters with color schemes and visual markers.

---

## Limits

- **Max 9 images** per generation
- **Max 3 videos** (total ≤ 15s) as reference
- **Sensitive terms** may cause failures — test and rephrase
- **Editing** is limited; most fixes need regeneration
- **Long prompts** (300+ words) may be followed inconsistently

---

## Camera keywords (English)

| Effect | Keywords |
|--------|----------|
| Push in | push in / slow push / fast push |
| Pull out | pull out / slow pull |
| Pan | pan left / pan right / truck |
| Follow | follow shot / tracking |
| Orbit | orbit / 360° rotation |
| Crane | crane up / crane down / dive |
| Special | Hitchcock zoom / one continuous shot |
| Handheld | handheld shake |

---

## Using the skill

```
seedance   A childhood story of Nie Feng from Storm Riders
```

Or invoke: `/skill seedance-storyboard-generator`

The skill produces: story analysis, four-act script, asset plan, and Seedance-formatted storyboards.

---

## Reference docs

- `.claude/skills/seedance-storyboard-generator/SKILL.md` — skill workflow
- `.claude/skills/seedance-storyboard-generator/references/seedance-manual.md` — Seedance manual
- `.claude/skills/seedance-storyboard-generator/references/story-to-video-script-template.md` — story adaptation template
- `.claude/skills/seedance-storyboard-generator/references/good-script-examples.md` — script quality example

---

## Example projects

### Lin Chong (`lin-chong-project`)

*Water Margin* — Lin Chong at Wind, Snow, and the Mountain Temple. Five 15s episodes, ink-wash wuxia. Arc: isolation → suspicion → calm before storm → rage → explosive climax.

### Nie Feng (`nie-feng-project`)

*Storm Riders* — Nie Feng arc.

### The Necklace (`necklace-project`)

Short adaptation of Maupassant’s *The Necklace*.

---

## FAQ

**Sensitive words?** The platform rarely names the trigger. Bisect the prompt to find the segment; keep a local blocklist.

**Character consistency?** Multiple angles per character; reference the correct slot in each storyboard; same style prefix everywhere.

**Bad extension transitions?** Add explicit transitions, e.g. “fade to black; night becomes dawn.”

---

## License

For learning and reference only.
