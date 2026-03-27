# Seedance 2.0 (st-ai/super-seed2) API Guide

Model ID: `st-ai/super-seed2`  
Source: 速推AI / xskill.ai

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

- `image_files`: array of image URLs (max 9)
- `video_files`: array of video URLs (max 3, total ≤ 15s)
- `audio_files`: array of audio URLs (max 3)

### 2. First / Last Frames

Text- or image-driven video with optional first/last frame control.

- `filePaths`: array of 0, 1, or 2 image URLs
  - **0 images** → text-to-video
  - **1 image** → image-to-video (first frame)
  - **2 images** → first + last frame interpolation

---

## Full API Schema

```json
{
  "parameters": {
    "model": {
      "type": "string",
      "description": "模型选择：seedance_2.0_fast（快速，默认）/ seedance_2.0（标准）",
      "default": "seedance_2.0_fast",
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

**Top-level parameters** (map to model params):

| Param | Type | Description |
|-------|------|-------------|
| `model` | string | `st-ai/super-seed2` |
| `prompt` | string | Generation prompt |
| `image_url` | string | Single image URL (for simple i2v) |
| `aspect_ratio` | string | e.g. `16:9`, `9:16`, `1:1` |
| `duration` | string | e.g. `5`, `10` |
| `options` | object | Model-specific params (functionMode, ratio, filePaths, image_files, video_files, audio_files) |

**Example call (simple image-to-video):**
```json
{
  "model": "st-ai/super-seed2",
  "prompt": "Korean-style fast-paced action sequence, neon-lit alley",
  "image_url": "https://cdn-video.51sux.com/...",
  "aspect_ratio": "16:9",
  "duration": "10"
}
```

**Example call (omni reference with multiple images):**
```json
{
  "model": "st-ai/super-seed2",
  "prompt": "@image_file_1 中的人物按照 @video_file_1 的动作跳舞",
  "options": {
    "functionMode": "omni_reference",
    "image_files": ["https://..."],
    "video_files": ["https://..."],
    "ratio": "16:9",
    "duration": 10
  }
}
```

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
