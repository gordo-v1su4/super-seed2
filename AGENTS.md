# Agent runbook — super-seed2 + xskill

Read this **before** improvising Seedance submits. Deep reference: **`seedance-super-seed2-api-guide.md`** (legacy **`st-ai/super-seed2`**). **Preferred (2026-06+):** Ark API — [llms.txt](https://api.apiz.ai/api/v3/models/ark%2Fseedance-2.0/llms.txt). Humans: **`README.md`**.

---

## Preferred: `ark/seedance-2.0` (Ark API direct)

Use this instead of **`st-ai/super-seed2`** when the legacy wrapper keeps failing. Same xskill MCP (`generate` / `submit_task`); different **model id** and **param names**.

| Legacy (`st-ai/super-seed2`) | Ark (`ark/seedance-2.0`) |
|------------------------------|---------------------------|
| `options.image_files` | `options.reference_images` |
| `options.video_files` | `options.reference_videos` |
| `options.audio_files` | `options.reference_audios` |
| `options.filePaths` (first/last frame) | `options.image_url` + optional `options.end_image_url` |
| `functionMode` | **Not used** — mode implied by which fields you set |
| Fixed price (~1350 pts / 15s) | **Token post-pay**; platform may **hold ~45 yuan** for 10s / 720p / Standard |
| — | `options.resolution`: `480p` / `720p` (Fast + Standard); **`1080p` Standard only** |
| — | `options.generate_audio`: default `true`; set **`false`** to reduce cost |

**Canonical Ark submit (omni refs, Nina sheet):**

```json
{
  "model": "ark/seedance-2.0",
  "prompt": "(English prompt; still use @image_file_1 in text for ref binding)",
  "duration": "10",
  "aspect_ratio": "16:9",
  "options": {
    "model": "seedance_2.0",
    "ratio": "16:9",
    "resolution": "720p",
    "duration": 10,
    "generate_audio": false,
    "watermark": false,
    "reference_images": [
      "https://raw.githubusercontent.com/gordo-v1su4/super-seed2/main/exxample-prompts/refs/NinaVale.png"
    ]
  }
}
```

**Notes from live tests (2026-06):**

- **`seedance_2.0_fast`** may return *endpoint does not exist* on some accounts — prefer **`seedance_2.0`** Standard.
- **Balance:** Ark holds more than legacy flat rate; **10s / 720p / Standard + ref** needed **4500 pts** hold with **4170 pts** on account → **~330 pts short**. Top up **~500 pts** or shorten duration / disable audio before retry.
- **`reference_images`** and **`image_url`** are **mutually exclusive** (first-frame vs omni ref).
- REST parity: `POST https://api.apiz.ai/api/v3/tasks/create` with `"model": "ark/seedance-2.0"` and nested **`params`** — see [llms.txt](https://api.apiz.ai/api/v3/models/ark%2Fseedance-2.0/llms.txt).

---

## What worked vs what failed (2026-05 recap)

Successful Super Seed (**`st-ai/super-seed2`**) job pattern:

| Piece | ✅ Worked | ❌ Failed earlier |
|-------|-----------|-------------------|
| **Transport** | xskill MCP **`generate`** → poll **`get_result`** | Ad‑hoc guesses; flaky third‑party hosts only |
| **Inner quality** | **`options.model`:** **`seedance_2.0`** (Standard) | Omitting inner model → often **Fast** by default |
| **Refs + `@` tags** | **`image_files`:** public HTTPS PNG; prompt uses **`@image_file_1`** only for identity | **`@image_file_2`** on a **3×3 mood/keyframe grid** — model copies panels literally, messy output |
| **Silent mood grid** | **Upload** grid as `image_files[1]`; **do not `@` it** in prompt — ambient grade/mood only | Listing five mood boards each with `@image_file_N` in prompt |
| **Image URLs** | **`raw.githubusercontent.com/...`** for a file **actually on `main` and pushed** | **Private repo** (raw 403/404 for workers); **`.../main/NinaVale.png`** when PNG only existed **locally untracked** → **404** |
| **`image_files` order** | First URL binds **`@image_file_1`** | Mismatch with prompt indices |

Supporting tactics used in debugging:

- **Tmpfiles.org** upload gave a valid **anonymous GET** PNG URL when GitHub paths were wrong; fine for proving the pipe, worse for longevity than **committed + public raw**.
- Repo was switched **private → public** so **stable raw URLs** work for **`image_files`** without extra upload services.

Infrastructure errors (`Connection reset`, **`ProxyError`** to **`files.catbox.moe`**) are separate from moderation: retry or **stop using blocked hosts**.

---

## Cursor MCP (`user-xskill-ai`)

Assume the server is **`user-xskill-ai`** (速推 AI / same HTTP API).

| Tool | Use |
|------|-----|
| **`generate`** | Submit image/video tasks. **`model` + `prompt` required.** Seedance knobs in **`options`**. |
| **`get_result`** | **`task_id`** until **`completed`** / **`failed`**. Recent failures list with **`limit` + `status`**. |
| **`search_models`** | Confirm **`ark/seedance-2.0`** or legacy **`st-ai/super-seed2`** / params when schema errors. |
| **`guide`** | Optional tutorials (`query` / `skill_id`); Seedance‑specific prose may be sparse — still use repo guide.

**Note:** Repo **`README`** mentions MCP **`transfer_url`**; **your Cursor MCP schema may not expose it.** If absent, rely on **public HTTPS** refs (GitHub raw, object storage with public GET, reputable temp host).

**API key:** User’s **`XSKILL_API_KEY`** must be wired in **`~/.cursor/mcp.json`** (or merged from **`mcp-config.json`**). Never commit secrets. Template: **`.env.exaample`** in repo root.

---

## Legacy: `st-ai/super-seed2` (Dreamina wrapper)

Use only if Ark is unavailable. Omni **`@image_file_N`** refs: **do not** set **`first_last_frames`** unless you intentionally use **`filePaths`** first/last frame (see **`seedance-super-seed2-api-guide.md`**).

Minimal mental model for **`generate`**:

```json
{
  "model": "st-ai/super-seed2",
  "prompt": "(Full prompt mentioning @image_file_1 matching first image_files URL)",
  "duration": "15",
  "aspect_ratio": "16:9",
  "options": {
    "model": "seedance_2.0",
    "ratio": "16:9",
    "duration": 15,
    "image_files": ["https://raw.githubusercontent.com/OWNER/super-seed2/main/exxample-prompts/refs/NinaVale.png"]
  }
}
```

**Replace:**

- **`OWNER`** with GitHub username/org (`gordo-v1su4` if this fork).
- **Path/commit:** **`main`** is fine if stable; pinning **`SHA`** in raw URL avoids branch surprises.
- **`image_files`**: list **every** ref in order (**`[url1, url2]`** → **`@image_file_1`**, **`@image_file_2`**).

Concrete worked asset (tracked on **`main`**):

`https://raw.githubusercontent.com/gordo-v1su4/super-seed2/main/exxample-prompts/refs/NinaVale.png`

**Do not assume** **`.../main/NinaVale.png`** at repo root — that file must be **committed and pushed**.

---

## Operational checklist

1. **Refs:** Resize if needed (**`README.md`** → **`scripts/resize_ref_images.py`** with **uv**). PNG **well under ~5 MB**, longest edge **≤ ~2048 px** when plates are huge.
2. **URLs:** `curl -I` the URL; expect **`200`** + **`Content-Type: image/png`** (or/jpeg) — no login wall.
3. **GitHub raw:** Repo **PUBLIC** AND file **committed** on ref branch. **`git ls-files`** + **`origin/main`** before claiming a raw link.
4. **Submit:** **`generate`**; save **`task_id`**.
5. **Poll:** **`get_result`** with **`task_id`** until **`completed`** (often minutes) or **`failed`** (inspect UI / logs for moderation vs fetch).
6. **Moderation:** Drug/violence montage refs can **`fail`** Dreamina despite “PG‑13 wording” — see guide fallbacks.

---

## Repo map (agent-relevant)

| Path | Purpose |
|------|---------|
| **`AGENTS.md`** | This runbook |
| **`seedance-super-seed2-api-guide.md`** | Full API: **`functionMode`**, **`filePaths`**, moderation, MCP/REST parity |
| **`README.md`** | Human setup; MCP config; tooling |
| **`exxample-prompts/`** | Prompt shells (e.g. **`tiktok-drug-dynasty-teaser.json`**, **`*.txt`**). Keep **`options`** aligned with omni refs when using **`image_files`**. |
| **`scripts/export_seedance_refs.py`**, **`scripts/resize_ref_images.py`** | Ordered exports + resizing |
| **`mcp-config.json`** | MCP URL template |

---

## MemPalace

Not part of Seedance submits. Operator may disable Cursor MemPalace **stop** hooks independently (see **`~/.cursor/hooks.json`**).

---

End state for a repeat “TIKTOK DRUG DYNASTY teaser + Nina Vale sheet”: use **`tiktok-drug-dynasty-teaser.json`** prompt text with **`ark/seedance-2.0`** + **`reference_images`** (or legacy **`st-ai/super-seed2`** + **`image_files`**).
