# Nano Banana Pro — prompt format notes

**Model:** Google Gemini 3 Pro Image (“Nano Banana Pro”) — Gemini app (Create images → Thinking), Google AI Studio (`gemini-3-pro-image`), or Higgsfield equivalent.

## Two valid formats

| Format | When to use |
|--------|-------------|
| **JSON** (preferred) | Grids, character lock from refs, multi-panel, repeatable edits |
| **Plain text** | Quick one-offs; still start with style prefix (see Storyboard Generator asset lists) |

Nano Banana responds **more predictably to structured JSON** than long prose — each field is an explicit instruction, especially for **reference images**, **resolution**, and **constraints**.

---

## Reference images — `Image 1`, `Image 2`, …

Attach images in the UI **in upload order**. In JSON, map them with `image_id` (1-based):

```json
"reference_images": [
  {
    "image_id": 1,
    "purpose": "character identity lock",
    "extract": "face, costume, jewelry, hair — be specific",
    "apply_to": "main subject in all panels"
  }
]
```

**Critical:** tell the model **what to extract** and **where to apply it**. Without `extract` / `apply_to`, it guesses and may copy the whole plate literally (wrong for a 3×3 grid).

For our workflow:

- **Image 1** = Nia character sheet → lock identity only
- Do **not** ask it to copy Image 1’s background or pose into every cell

Up to **14 reference images** supported (community docs); our grid uses **1**.

---

## JSON skeleton (minimal)

```json
{
  "goal": "cinematic_storyboard_grid",
  "resolution": "2K",
  "aspect_ratio": "1:1",
  "reference_images": [ { "image_id": 1, "purpose": "...", "extract": "...", "apply_to": "..." } ],
  "global_style": { "look": "...", "color_grade": { "palette": [] } },
  "panels": [ { "cell": "1 top-left", "description": "..." } ],
  "constraints": {
    "must_include": [],
    "must_avoid": []
  }
}
```

Common top-level fields (from [aiHola JSON guide](https://aihola.com/article/nano-banana-pro-json-prompt-guide)):

- `resolution` — `1K` | `2K` | `4K` (test at 1K/2K first)
- `aspect_ratio` — `1:1` for square grid; `16:9` for single plates
- `camera` — angle, focal_length, depth_of_field, composition
- `lighting` — primary/secondary, color_temperature
- `characters` — id, description, consistency_priority (series work)
- `mode`: `"thinking"` — complex multi-panel / diagrams

---

## Plain-text fallback (repo convention)

Storyboard Generator asset prompts use a **style prefix + description** (no `@` in Nano Banana — that’s Seedance):

```
[STYLE PREFIX], [detailed description], full body character design sheet style, clean background, highly detailed
```

Example prefix for this project:

```
Cinematic photorealistic music-video still, Kodak 500T grain, ARRI Alexa 65, deep teal storm woods, 2.39:1 anamorphic —
```

Then add: “Match Image 1 for character identity only” if the UI supports inline ref prose.

---

## This episode

| File | Use |
|------|-----|
| `nano-banana-3x3-grid-prompt.json` | Paste into Nano Banana / Gemini — attach **Image 1** = Nia sheet |
| `nano-banana-3x3-grid-prompt.txt` | Short plain-text backup |

Output → save as `mood-grid-3x3.png` → upload to Seedance as **Image 2** (silent — no `@` in Seedance prompt).
