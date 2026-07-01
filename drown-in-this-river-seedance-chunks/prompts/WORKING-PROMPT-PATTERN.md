# Working Seedance prompt pattern (Drown In This River)

**Validated:** single-image identity lock + beat-mapped one-shot with bullet-time ramps. See `rapids-dance-13s-oner-beat-sync.txt`.

This beats the multi-image woods-run storyboard for generation quality. Use this structure for future chunks.

---

## Reference syntax

| Jimeng / prompt prose | MCP `st-ai/super-seed2` |
|----------------------|-------------------------|
| `@[Image 1](image_1)` | `@image_file_1` — first URL in `options.image_files` |
| `@[Video 1](video_1)` | `@video_file_1` — first URL in `options.video_files` |

**Image 1** = **identity lock** — Nia face, yellow dress, storm-flood environment (character sheet or composite plate).

**Video 1** = black-screen chunk MP4 from this folder — audio/rhythm master only.

### Silent upload (3×3 mood grid) — upload but do **not** `@` it

**Validated:** include a **3×3 keyframe / mood grid** as the **second** image in the upload list, but **never** write `@Image 2`, `@image_file_2`, or “match @image_file_2” in the prompt.

| Do | Don't |
|----|-------|
| Put grid at `image_files[1]` (slot 2) | `@image_file_2` or “scene references @Image 2” |
| Only `@Image 1` + `@Video 1` in prompt text | “Use the keyframes from image 2” / timeline per panel |

**Why:** explicit `@` on a keyframe grid makes Seedance **copy panels literally** — messy collages, wrong poses, broken continuity. With a **silent** second image, the model still picks up **color, storm, water, lightning, dress** from the grid as ambient style without treating each cell as a shot list.

**Order matters:**

```
image_files[0]  →  @image_file_1  (ONLY image you @ in prompt)
image_files[1]  →  3×3 mood grid  (upload only — no @ tag)
video_files[0]  →  @video_file_1
```

---

## Prompt formula (copy this skeleton)

```
@[Image 1](image_1) is [SUBJECT] identity and style lock — match [face, costume, environment] exactly.
@[Video 1](video_1) is the music track at [BPM] BPM, [N] seconds — every cut, ramp, and choreography hit is timed to its beats, landing on the downbeats at approximately [t1], [t2], …

Single continuous shot, [N] seconds, 2.39:1 anamorphic — [lens kit], [grain], [camera body], [grade: two opposing color forces], [sky/atmosphere] locked across the whole shot.

On the first downbeat at [t1] [ACTION] — RAMPS TO BULLET TIME exactly on this beat, [frozen detail].
SNAPS BACK TO FULL SPEED on the beat at [t2] [ACTION].
… repeat per beat …

Maintain consistent face, dress, and [environment] identity across every beat, choreography reading as deliberate dance movement rather than panic, fluid natural [physics], no limb warping, anamorphic 2.39:1 locked throughout.

Audio: sync to @[Video 1](video_1) exactly, [SFX under full speed], [bass under bullet holds], [one-off SFX on specific beat].
Total: [N]s / 1 shot / 2.39:1
```

### Why it works

1. **One `@` image** — identity from `@Image 1` only; mood grid uploaded **silently** (see above).
2. **Explicit beat timestamps** — Seedance follows `@video_file_1` rhythm when you name seconds.
3. **RAMPS TO BULLET TIME / SNAPS BACK** — clear speed grammar on alternating beats.
4. **Dance not panic** — keeps motion readable and on-model.
5. **Technical camera block upfront** — stabilizes look for the full oner.
6. **Negative guardrails** — no limb warping, consistent water/debris identity.

---

## MCP submit (legacy `st-ai/super-seed2`)

```json
{
  "model": "st-ai/super-seed2",
  "prompt": "(contents of rapids-dance-13s-oner-beat-sync.txt)",
  "duration": "13",
  "aspect_ratio": "16:9",
  "options": {
    "model": "seedance_2.0",
    "ratio": "16:9",
    "duration": 13,
    "image_files": [
      "https://raw.githubusercontent.com/gordo-v1su4/super-seed2/main/drown-in-this-river-seedance-chunks/nia-character-sheet.png",
      "https://raw.githubusercontent.com/gordo-v1su4/super-seed2/main/drown-in-this-river-seedance-chunks/mood-grid-3x3.png"
    ],
    "video_files": [
      "https://raw.githubusercontent.com/gordo-v1su4/super-seed2/main/drown-in-this-river-seedance-chunks/04-instrumental.mp4"
    ]
  }
}
```

- Set **`duration`** to match `@Video 1` length (13 here; chunk file may be ~14s — trim audio or use closest chunk).
- **2.39:1** is carried in prompt text; API ratio may stay `16:9` unless the host exposes cinematic ratio.
- Omit **`functionMode`: `first_last_frames`** when using omni `@image_file_1` / `@video_file_1`.
- **`mood-grid-3x3.png`** — second slot only; **not** mentioned in prompt (replace with your actual grid filename once committed).

---

## Beat map (this prompt)

| Time | Beat role |
|------|-----------|
| 2.4s | Branch release → fall → **bullet time** |
| 3.6s | **Full speed** — trunk spin dodge |
| 4.8s | Rooftop landing → **slow motion** leap |
| 6.1s | **Full speed** — vine swing |
| 7.2s | Debris gap spin + **lightning** |
| 8.3s | Horizontal leap → **bullet time** |
| 9.6s | **Full speed** — backbend slide |
| 10.8s | Wave lift apex |
| 11.9s | Pulled into rapids — end |

99 BPM · 13s · 9 hit points

---

## Chunk pairing

| Candidate `@Video 1` | Duration | Notes |
|---------------------|----------|--------|
| `04-instrumental.mp4` | ~15s | No vocal conflict; trim to 13s or set duration 14 |
| `02-lost-in-the-darkness-…mp4` | ~13.7s | Closest length to 13s |
| `08-instrumental.mp4` / `09-instrumental.mp4` | ~12–14s | Later instrumental sections |

Re-map downbeat seconds if you change the audio chunk (use a DAW or `manifest.json` + BPM).

---

## Superseded doc

`02-03-woods-run-breath_storyboard.md` — multi-ref forest run; kept for narrative reference. **Use this pattern for submits.**
