# super-seed2

Notes and assets for **Seedance 2.0** on [xskill.ai](https://www.xskill.ai) (`st-ai/super-seed2`). The detailed API, MCP behavior, moderation, and examples live in **`seedance-super-seed2-api-guide.md`** — read that for anything non-trivial.

---

## For Cursor agents (next time)

**Use the xskill MCP server first** instead of improvising raw HTTP, unless the server is disabled or failing.

- In MCP tooling it may appear as **`user-xskill-ai`** (HTTP endpoint) or a Chinese label like **速推AI**; same API.
- **`generate`** — create jobs (`model` + `prompt` required; Seedance extras go in **`options`**). Wrong shapes often return a schema you can fix and retry.
- **`get_result`** — poll a **`task_id`** after submit.
- **`search_models`** — confirm model id / parameters when unsure.
- **`transfer_url`** — optional: rehost an external image/audio URL to their CDN for a stable link (free).

The guide documents how **`options`** maps to REST **`params`**, Standard vs Fast (`seedance_2.0` vs `seedance_2.0_fast`), and when **`functionMode`** matters.

---

## Getting started (humans)

1. **API key:** [xskill API keys](https://www.xskill.ai/#/v2/api-keys). Put it in **`.env`** as `XSKILL_API_KEY=...` (gitignored). Template: **`.env.exaample`** (filename as in repo).
2. **MCP in Cursor:** `mcp-config.json` uses `${XSKILL_API_KEY}`. On macOS/Linux you can expand it with `./generate-mcp-config.sh` and merge into your Cursor MCP config; on Windows, substitute the key manually or use WSL for the script.
3. **Model id for video:** `st-ai/super-seed2`. **Inner** speed tier inside **`options` / `params`:** `"model": "seedance_2.0"` for **Standard** (recommended); omitting often yields **Fast**.

---

## Reference images and uploads

- The API accepts **public HTTPS URLs** only — no local file paths in JSON. Upload elsewhere (temporary host, R2, Litterbox, etc.), or use MCP **`transfer_url`** if you already have a reachable URL to mirror.
- **`image_files`** order must match the prompt: first URL = **`@image_file_1`**, second = **`@image_file_2`**, and so on (up to 9).
- **Resize** large plates before upload: longest edge **≤ ~2048 px**, PNG **well under ~5 MB** when possible. From repo root (uses **uv**):

  ```bash
  uv run --with pillow scripts/resize_ref_images.py "<folder-of-pngs>" "./refs-resized"
  ```

- **`scripts/export_seedance_refs.py`** — copy/export Cursor asset PNGs into ordered filenames under **`seedance-refs/`** (that folder is gitignored by default). Upload those files to get URLs, then paste URLs into **`options.image_files`** in array order.

Heavy violence / blood / weapons in refs often triggers **Dreamina `status=fail`**; the guide has fallback ideas.

---

## Prompts and formatting

- **`exxample-prompts/`** — copy-paste style prompts (e.g. **`diner-fight-seedance-prompt.txt`** has Chinese + English blocks). Use **`@image_file_N`** tags that match your **`image_files`** order.
- **REST** `POST .../tasks/create`: body must nest fields under **`params`** (flat top-level returns **422**). See the guide for a minimal JSON example.
- **Omni reference (default):** you usually **do not** need **`functionMode": "omni_reference"`** if you pass **`image_files`**. Set **`first_last_frames`** only when using **`filePaths`** for first/last frame or text-only flows.

---

## Repo layout

| Path | Purpose |
|------|---------|
| `seedance-super-seed2-api-guide.md` | Source of truth: schema, MCP, REST, moderation, audio limits |
| `exxample-prompts/` | Example prompts |
| `scripts/resize_ref_images.py` | Downscale PNG refs |
| `scripts/export_seedance_refs.py` | Export ordered ref PNGs for Seedance |
| `mcp-config.json` | MCP server URL template |
