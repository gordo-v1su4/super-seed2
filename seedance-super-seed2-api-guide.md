# Seedance 2.0 (st-ai/super-seed2) API Guide

Model ID: `st-ai/super-seed2`  
Source: 速推AI / xskill.ai

**Seedance speed tier (inside request `params`, not the top-level product id):** Pass **`"model": "seedance_2.0"`** for **Standard** quality. If you omit this field, the service often defaults to **`seedance_2.0_fast`** (Fast). For this repo’s workflows, **always set Standard explicitly** unless you deliberately want the faster, lighter tier.

---

## MCP Config & Chinese Glossary

**Config files (all in this folder):**
- `mcp-config.json` — full MCP config with `${XSKILL_API_KEY}` placeholder
- `.env` — defines `XSKILL_API_KEY` (gitignored). Copy from `.env.example` if missing.
- `generate-mcp-config.sh` — expands variables and outputs final JSON

To regenerate Cursor's mcp.json (run from this folder): `./generate-mcp-config.sh > ~/.cursor/mcp.json`

| Chinese | Pinyin | Meaning |
|---------|--------|---------|
| 速推 | sùtuī | Fast push / rapid promote |
| 速推AI | sùtuī AI | SuTui AI (xskill.ai brand name) |
| 图片 | túpiàn | Image |
| 视频 | shìpín | Video |
| 音频 | yīnpín | Audio |
| 模型 | móxíng | Model |
| 提示词 | tíshì cí | Prompt |
| 积分 | jīfēn | Credits (points) |
| 签到 | qiāndào | Check-in (daily) |
| 套餐 | tàocān | Package / plan |
| 充值 | chōngzhí | Recharge / top-up |

---

## Input Sources Supported

| Type | Max Count | Parameter | Limit |
|------|-----------|-----------|-------|
| **Images** | 9 | `image_files` | URLs only |
| **Videos** | 3 | `video_files` | URLs, total duration ≤ 15 seconds |
| **Audio** | 3 | `audio_files` | URLs only |

### Reference image size (practical)

The public schema does **not** publish a max width/height for `image_files`. For reliable CDN fetch and to stay near the model’s **~2K** output class, use:

- **Longest edge ≤ 2048 px** (resize down if your plates are 4K+).
- **File size** comfortably under **5 MB** per PNG (audio refs are capped at **15 MB**; images are stricter in practice).

**This repo:** run from the project root (requires [uv](https://github.com/astral-sh/uv)):

```bash
uv run --with pillow scripts/resize_ref_images.py "<path-to-folder-of-pngs>" "./refs-resized"
```

Outputs copies or downscaled PNGs into `refs-resized/` (gitignored). On **Windows**, the script uses extended paths (`\\?\`) so long Cursor `assets/` filenames still open correctly.

---

## Reference Syntax (in `prompt`)

**Omni Reference mode:**
- `@image_file_1` … `@image_file_9` — reference images by index
- `@video_file_1` … `@video_file_3` — reference videos by index
- `@audio_file_1` … `@audio_file_3` — reference audio by index

**Legacy (Chinese) syntax (still supported):**
- `@图片1` = `@image_file_1`
- `@视频1` = `@video_file_1`
- `@音频1` = `@audio_file_1`

**Example prompt:**
```
"@image_file_1 中的人物按照 @video_file_1 的动作跳舞"
```

---

## Function Modes

### 1. Omni Reference (default)

Multi-modal mix of images, videos, and audio.

The product schema’s default **`functionMode` is `omni_reference`**. If you are using **`image_files` / `video_files` / `audio_files`** and **`@image_file_1`**-style prompts, you do **not** need to send `functionMode` unless you want to be explicit. Send **`functionMode": "first_last_frames"`** only when you are on the **first-frame / last-frame / text-only** path with **`filePaths`** (see below).

- `image_files`: array of image URLs (max 9)
- `video_files`: array of video URLs (max 3, total ≤ 15s)
- `audio_files`: array of audio URLs (max 3)

### 2. First / Last Frames

Text- or image-driven video with optional first/last frame control.

- `filePaths`: array of 0, 1, or 2 image URLs
  - **0 images** → text-to-video
  - **1 image** → image-to-video (first frame)
  - **2 images** → first + last frame interpolation

### First-frame vs omni (same labels as the xskill / Dreamina UI examples)

These are **different pipelines**. Pick one; do not expect `filePaths` and `image_files` to mean the same thing.

| Example (UI) | `functionMode` | What you pass | What it does |
|--------------|----------------|---------------|----------------|
| **文生视频** | `first_last_frames` | No `filePaths` (or omit it) | Text-only video; `ratio` + `duration` only. |
| **图生视频 (首帧)** | `first_last_frames` | `filePaths`: **one** image URL | That image is the **literal first frame**; the model animates **from** it. Prompt describes motion. No `@image_file_1` binding—there is only one frame image. |
| **全能 · 图+视频 (动作迁移)** | `omni_reference` | `image_files` + `video_files` | Prompt uses **`@image_file_1`**, **`@video_file_1`**, etc. Identity/style from images; motion and camera from the ref clip (per prompt). Matches: *「@image_file_1 中的人物按照 @video_file_1 的动作…」*. |
| **旧版 `media_files`** | (legacy) | Single `media_files` array | Deprecated; prefer separate `image_files` / `video_files` / `audio_files`. |

**Your diner + heroine case**

- **Two still refs (character + location), no ref video:** use **`omni_reference`** with `image_files: [heroineUrl, dinerUrl]` and `@image_file_1` / `@image_file_2` in the prompt. This is **not** the “首帧” example (that mode only accepts **up to 2** images total as **start/end frames**, not as separate indexed refs).
- **Lock the empty diner as the opening composition only:** use **`first_last_frames`** with `filePaths: [dinerUrl]` and describe the heroine fully in text (or accept weaker likeness). Optionally add a **second** URL in `filePaths` for an end frame.
- **Match your edited CapCut clip’s pacing:** use **`omni_reference`** like the official **图+视频** example: `image_files` for the character (and optionally diner as a second still), `video_files: [yourMp4Url]`, prompt: e.g. *@image_file_1 中的人物在 @image_file_2 的场景中，按照 @video_file_1 的运镜与节奏表演* (adjust indices to match your array order).

---

## Full API Schema

Inner `params.model` values:

| Value | Meaning |
|-------|---------|
| `seedance_2.0` | **Standard** — higher quality; **use this by default** |
| `seedance_2.0_fast` | **Fast** — quicker / cheaper; only if you intend the fast tier |

If `model` is **omitted** in `params`, the backend commonly falls through to **Fast**. Set `seedance_2.0` explicitly when you want Standard.

```json
{
  "parameters": {
    "model": {
      "type": "string",
      "description": "模型：seedance_2.0（标准）/ seedance_2.0_fast（快速）。省略时多为 fast；要高画质请显式传 seedance_2.0",
      "enum": ["seedance_2.0_fast", "seedance_2.0"]
    },
    "prompt": {
      "type": "string",
      "description": "提示词。支持使用 @image_file_1 @video_file_1 @audio_file_1 等引用素材文件",
      "required": true
    },
    "functionMode": {
      "type": "string",
      "description": "功能模式",
      "default": "omni_reference",
      "enum": ["omni_reference", "first_last_frames"]
    },
    "ratio": {
      "type": "string",
      "description": "视频宽高比",
      "default": "16:9",
      "enum": ["21:9", "16:9", "4:3", "1:1", "3:4", "9:16"]
    },
    "duration": {
      "type": "integer",
      "description": "视频时长（秒），4-15 的整数",
      "default": 5,
      "minimum": 4,
      "maximum": 15
    },
    "filePaths": {
      "type": "array",
      "description": "图片 URL 数组（first_last_frames 模式）。0 张：文生视频；1 张：图生视频；2 张：首尾帧",
      "items": { "type": "string", "format": "uri" },
      "maxItems": 2
    },
    "image_files": {
      "type": "array",
      "description": "参考图片 URL 数组（omni_reference 模式，最多 9 张）",
      "items": { "type": "string", "format": "uri" },
      "maxItems": 9
    },
    "video_files": {
      "type": "array",
      "description": "参考视频 URL 数组（omni_reference 模式，最多 3 个，总时长 ≤ 15 秒）",
      "items": { "type": "string", "format": "uri" },
      "maxItems": 3
    },
    "audio_files": {
      "type": "array",
      "description": "参考音频 URL 数组（omni_reference 模式，最多 3 个）",
      "items": { "type": "string", "format": "uri" },
      "maxItems": 3
    }
  },
  "required": ["prompt"]
}
```

---

## 速推AI Generate Tool (MCP)

Cursor exposes this as **`user-xskill-ai` → `generate`**. The MCP descriptor only lists **top-level** fields; anything Seedance-specific goes in **`options`**, which the server merges into the same **`params`** shape as REST. If you send wrong keys, the API error often includes the **correct schema** for that model — use that to fix the payload (the tool description says the same in Chinese).

**MCP `generate` arguments (actual schema):**

| Param | Required | Description |
|-------|----------|-------------|
| `model` | yes | e.g. `st-ai/super-seed2` |
| `prompt` | yes | Generation prompt |
| `image_url` | no | Single image URL (simple i2v) |
| `aspect_ratio` | no | Video ratio, e.g. `16:9`, `9:16` |
| `duration` | no | Video length as **string**, e.g. `"10"`, `"15"` |
| `options` | no | Opaque object: Seedance **`params`** such as inner **`model`** (`seedance_2.0`), **`ratio`**, **`duration`** (number OK here), **`image_files`**, **`video_files`**, **`audio_files`**, **`filePaths`**. Omit **`functionMode`** for default omni; set **`first_last_frames`** only with **`filePaths`**. |

**Note:** Top-level `duration` is a string; inside **`options`** the backend often expects **`duration`** as a **number** — follow the error schema if a call fails.

**Example call (simple image-to-video):**
```json
{
  "model": "st-ai/super-seed2",
  "prompt": "Korean-style fast-paced action sequence, neon-lit alley",
  "image_url": "https://cdn-video.51sux.com/...",
  "aspect_ratio": "16:9",
  "duration": "10",
  "options": {
    "model": "seedance_2.0"
  }
}
```

**Example call (omni reference with multiple images):**
```json
{
  "model": "st-ai/super-seed2",
  "prompt": "@image_file_1 中的人物按照 @video_file_1 的动作跳舞",
  "options": {
    "model": "seedance_2.0",
    "image_files": ["https://..."],
    "video_files": ["https://..."],
    "ratio": "16:9",
    "duration": 10
  }
}
```

### REST (`POST /api/v3/tasks/create`)

Body is **not** flat: wrap generation fields under **`params`**. Include **`params.model`** so jobs are not silently treated as Fast.

```json
{
  "model": "st-ai/super-seed2",
  "params": {
    "model": "seedance_2.0",
    "prompt": "…",
    "ratio": "16:9",
    "duration": 15,
    "image_files": ["https://…"]
  }
}
```

Default **`functionMode`** is **`omni_reference`**; omit it when using **`image_files`** unless you want to be explicit.

---

## Audio & Video Duration Rules

### Audio Limits

| Constraint | Limit |
|------------|-------|
| Max files | 3 |
| Combined duration | **15 seconds total** across all tracks |
| Per file size | Max 15 MB |
| Formats | MP3, WAV |

### What Happens If Audio Is Longer Than 15 Seconds?

**You must cut/trim the audio before uploading.** The API won't accept audio longer than 15 seconds total. There is no server-side chopping or "reference parts" — the model receives only what you upload.

### Matching Audio Length to Video Duration

**Best practice: Set `duration` to match your audio clip length.**

- If your audio is 12 seconds → generate a 12-second video
- If your audio is 8 seconds → generate an 8-second video

**Why:** Mismatched durations cause **sync drift**. If audio is 15s and you set `duration` to 10s, the model will compress or stretch visual events to fit 10 seconds, and the beat/transition sync can feel off.

### How the Model Uses Audio

The model treats audio as a **structural input**, not just background:

- **Beat positions** → potential transition points
- **Dynamic builds** → accelerating camera movement
- **Drops** → dramatic visual shifts
- **Sustained passages** → smooth, flowing camera work

It analyzes the full audio you provide and choreographs visuals to match. Trim to the 15s segment with the most interesting structure (e.g. build-to-drop, verse-to-chorus) for best sync.

---

## Model Capabilities

- **Output:** Up to 2K resolution, 4–15 seconds
- **Generation time:** ~60 seconds
- **Audio-visual sync:** Phoneme-level lip sync (8+ languages)
- **Input media:** text, image, video, audio

---

## Dreamina / `status=fail` (task failed with no useful sub-code)

Jobs are executed on ByteDance’s pipeline (often surfaced as **Dreamina**). When the dashboard shows **`Dreamina task failed (status=fail)`** and the xskill API only returns **`failed`**, the rejection is almost always **upstream safety / moderation**, not a JSON or URL formatting bug.

### What the symptom pattern usually means

| Pattern | Likely cause |
|--------|----------------|
| **Text-only** `omni_reference` (no `image_files`) **succeeds** | Prompt is within policy; problem is not “action words” alone. |
| **Same idea + `image_files`** **fails** | One or more **reference images** (or their combination) tripped **image-side** moderation: obvious examples include **blood**, **weapons**, **graphic injury**, multi-panel **fight grids**, or **collage / typography** that reads as messy or policy-triggering. |
| **`video_files` present**, higher price, slow or fail | Video reference is a **separate** moderation and compute path; failures and latency are common. |

There is **no documented public list** of disallowed concepts. Softer English wording alone often **does not fix** a fail if the **refs** are still hot.

### Reference hygiene (highest leverage)

1. **Character plate:** Use a **clean** turnaround: **no blood**, **no visible blade**, neutral pose. Describe costume and attitude in text instead of uploading a “aftermath” sheet.
2. **Environment plate:** A **single** clear diner still (no people, or people trivial in background) is safest for **location lock**.
3. **Storyboard grid:** Treat as **optional**. It is a **mosaic of violent stills** and often triggers fails even when the text says “PG-13”. Prefer **omitting `@image_file_3`** or replacing with **one** calm mood reference.
4. **Order:** Keep `image_files` order aligned with `@image_file_1`, `@image_file_2`, … so you are not accidentally binding the wrong asset.

### Fallback strategies (in order)

1. **`first_last_frames`** with **`filePaths`: [diner URL]** only — **one** clean location image; put **full character + action + camera** in `prompt`. Trades some identity lock for **pass rate**.
2. **Two images only:** clean character + clean diner — **no** fight grid.
3. **Text-only** again — accept **weaker** character/location match; iterate prompt.
4. **Contact xskill support** — ask whether they can surface **Dreamina’s internal reason code** for failed tasks (often they can see more than the UI shows).

### Docs vs reality

This repo documents **parameters and limits** from the product schema. **Moderation** is **not** part of that schema; trial and **cleaner references** are the practical way to reduce `status=fail`.
