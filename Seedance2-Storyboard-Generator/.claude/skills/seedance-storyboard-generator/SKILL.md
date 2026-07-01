---
name: seedance-storyboard-generator
description: Professional Seedance 2.0 AI video script and storyboard generator. Use when the user wants to (1) convert an article/story into a video script, (2) generate Seedance 2.0 storyboard prompts, (3) plan a multi-episode AI video series, or (4) create character/scene/prop prompts for image models (e.g. Nana Banana Pro). Input can be a full novel, article, or short outline. Output includes a full script (△ shots + dialogue + OS/VO + flashbacks + subtitles), episode breakdown, asset prompts, and Seedance-formatted storyboards.
---

# Seedance Storyboard Generator

AI script and storyboard system for multi-episode video on Seedance 2.0.

## Workflow

Convert source material to production-ready assets in this order:

### 1. Analyze input

**Input type:**
- **Full text** — novel/article needing adaptation and episode split
- **Outline** — short concept needing full script development

**Extract:**
- Protagonist and key characters
- Core conflict and arc
- World / setting
- Key beats and emotional turns
- One-line hook / selling point

Ask clarifying questions if the input is vague.

### 2. Confirm production parameters

Ask:

1. **Visual style** — photoreal / animation / ink-wash / sci-fi / retro / cinematic / other
2. **Duration** — total runtime (e.g. 5×15s ≈ 75s short; 20×15s ≈ 5 min long)
3. **Platform** — aspect ratio (16:9 / 9:16 / 2.35:1)
4. **Tone** — epic / warm / suspense / upbeat / melancholy, etc.
5. **Hook** — one-line pitch (last-stand revenge / wuxia classic / cozy healing / thriller, etc.)

Apply these consistently through the pipeline.

### 3. Full script structure

**Output must follow [good-script-examples.md](references/good-script-examples.md) quality bar.**

#### 3.1 Part 1: Story analysis

```
# [Title] — Script

I. Core hook
[2–4 word hook, e.g. last-stand revenge, classic wuxia]

II. Story summary
Setting: [time, place, situation]
Inciting incident: [what breaks status quo]
Protagonist: [who, core trait, current state]
Main plot: [progression → climax → resolution]
Ending: [outcome, transformation]

III. One-line pitch
[Marketing line with emotion]

IV. Character bios
[Per major character:]

**Name**
Visual: [age, look, costume, markers]
Background: [role, ties to protagonist]
Tags: [2–4 traits]
Personality: [arc under pressure]
Signature line: [memorable quote]

V. Outline
Act I (setup): [world, protagonist, status quo]
Act II (rise/turn): [complications, turning point]
Act III (climax): [confrontation, peak]
Act IV (close): [resolution, theme]

VI. Script body
```

#### 3.2 Part 2: Script body (per episode)

```
Episode X
X-X [DAY/NIGHT] [INT/EXT] [Location]
Props: [list]
Characters: [list]

△ 【Establishing shot】[camera, composition, light, mood]
△ [Shot 2 — specific move: push/pull/pan/truck/follow/orbit/crane/CU/WS]
△ [Shot 3 …]
Name (os): [interior monologue / VO]
△ [Reaction shot]
Name (dialogue / action): [spoken line]
△ [Action beat]
【Subtitle: text】
△ 【Flashback】[scene]
【End flashback】
△ [Return to present]
Name (vo): [off-screen voice]
△ [Climax action]
△ 【Establishing close】
【Subtitle: text】
```

**Script rules:**

1. Every shot starts with `△ ` (triangle + space)
2. **Camera language — be specific:**
   - Scale: WS / MS / MCU / CU / ECU
   - Move: push in, pull out, pan, truck, follow, orbit, crane, Hitchcock zoom, one shot, handheld
   - Combos: `MS push in`, `CU orbit`, `WS high angle`, `fast push`, `slow pull`
3. **Dialogue:**
   - `Name (os)` — interior monologue / off-screen thought
   - `Name (vo)` — voiceover, character not in frame
   - `Name (angry/joyful)` — emotional delivery
   - `Name` — normal dialogue
4. **Special:**
   - `【Establishing shot】` — atmosphere without characters
   - `【Flashback】` / `【End flashback】`
   - `【Subtitle: text】`
5. **Action:** use `→` for chains: `spear through chest → blood spray → snow stains red`
6. **Sensory:** visual, sound, temperature, texture

### 4. Asset generation plan

| Category | Prefix | Example | Notes |
|----------|--------|---------|-------|
| Character | C01–C99 | C01 Lin Chong · front full body | Multiple angles per role |
| Scene | S01–S99 | S01 fodder depot · snow | Key locations |
| Prop | P01–P99 | P01 spear | Important objects |

**Prompt format:**

```
### [ID] — [Name]

[style prefix], [detailed visual description in English], [technical specs]

**Style prefix examples:**
- Chinese ink wash painting style mixed with anime cel-shading
- Cinematic photorealistic style with dramatic lighting
- 3D Pixar-style animation rendering
- Sci-fi cyberpunk aesthetic with neon lighting

**Character distinction:** unique palette and markers per character.
```

### 5. Seedance 2.0 storyboard (per episode)

**a. Upload table**

```
| Slot | Asset ID | Description |
| image_file_1 | C01 | Character consistency ref |
| image_file_2 | S01 | Scene ref |
```

**b. Seedance prompt (timeline, English)**

```
[style], 15s, 9:16 vertical, [mood]

0-3s: [establish] — [camera], [action], [atmosphere]
3-6s: [introduce / develop] — [camera], [action], [emotion]
6-9s: [conflict] — [camera], [key beat], [detail]
9-12s: [climax / turn] — [camera], [peak], [visual punch]
12-15s: [end / hold] — [camera], [final frame], [afterglow]

【Sound】[score] + [SFX] + [dialogue / VO]
【Refs】@image_file_1 [role], @image_file_2 [role], …
```

**c. End frame**

Last-frame content for next-episode continuity: subject, background, light, composition, mood.

**Episode 2+:** start with `Extend @video_file_1 by 15s` and upload the previous episode as video ref.

## Output files

1. **`[Title]_script.md`** — hook, summary, pitch, bios, outline, script body
2. **`[Title]_asset-list.md`** — all C/S/P prompts
3. **`[Title]_E[XX]_storyboard.md`** — per-episode timeline prompt

## Script pacing (15s episodes)

| Type | Shots | Pace |
|------|-------|------|
| Dialogue / emotion | 3–4 | ~4–5s per shot |
| Action / fight | 5–7 | ~2–3s per shot |
| Montage | 6–8 | ~2s per shot |

**Emotional arc per episode:** open (0–3s) → rise (3–9s) → peak (9–12s) → release (12–15s).

## Quality checklist

- ✅ Every `@image_file_N` maps to the upload table
- ✅ End frame → next episode opening
- ✅ Timeline covers full 15s
- ✅ Camera moves are feasible and ordered
- ✅ `△` format and specific camera terms
- ✅ Dialogue tagged (os/vo/emotion)
- ✅ Sensory detail present
- ✅ Clear emotional arc per episode

## References

- [seedance-manual.md](references/seedance-manual.md) — templates, camera table, atmosphere keywords, `@image_file_N` syntax
- [story-to-video-script-template.md](references/story-to-video-script-template.md) — adaptation template
- [good-script-examples.md](references/good-script-examples.md) — script quality bar
- [storyboard-prompt-optimization.md](references/storyboard-prompt-optimization.md) — prompt formula

## Pitfalls

1. **Sensitive terms** — rephrase or test in segments
2. **Overlong prompts** — prefer clarity over 300+ word dumps
3. **Continuity** — always log end frames
4. **Style drift** — same prefix on every asset prompt
5. **Vague camera** — say “push in” not “camera moves”
6. **Flat emotion** — each episode needs an arc, not only plot beats

## Example contrast

**❌ Weak outline:**
```
Beats:
- Lin Chong hears voices outside
- Learns of the plot to burn him alive
- Rushes out for revenge
```

**✅ Proper script:**
```
△ Lin Chong holds his breath, rises silently, presses to the door crack to listen.
△ Voices cut through the wind, clear enough to parse.
Lu Qian (vo): This fire will leave Lin Chong with no grave!
Guard (vo): Even if he survives, losing the depot is still a death sentence!
△ At “Grand Marshal Gao” Lin Chong jolts; patience becomes white-hot rage.
△ 【Flashback】Gao's son harassing his wife, the false trial, exile — images strobe past.
【End flashback】
△ He grips the spear; knuckles bleach; teeth grind.
Lin Chong (os): Lu Qian — I treated you as a brother, and you hunt my life!
△ Outside, oil splashes; firelight paints the door seam red.
△ He lifts his head; killing intent floods the frame; exhaustion vanishes.
```
