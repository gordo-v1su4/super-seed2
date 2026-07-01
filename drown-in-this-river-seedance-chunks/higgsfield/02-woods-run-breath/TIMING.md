# Chunk 02 — verified timing (Higgsfield)

**Video 1:** `02-lost-in-the-darkness-trying-to-find-my-way.mp4`  
**Duration:** **13.723 s** (ffprobe + Whisper)  
**Higgsfield:** **15 s** container · sync **0 → 13.7 s** · no tail

> Cross-checked 2026-06-30 with faster-whisper on the **chunk MP4** (not full-song manifest). Manifest said *Lost* at 8.96 s; **actual chunk file has *Lost* at 9.12 s** — use chunk timings below.

## Vocal map (chunk file)

| Time | Audio (Whisper) | Visual |
|------|-----------------|--------|
| **0.00** | Track starts | Dark run begins |
| **0.90–2.10** | Oh / **yeah** | Lip-sync opening ad-libs while running |
| **2.10–3.26** | **Oh** | Lip-sync, still montage |
| **3.26–5.62** | *instrumental* | **No lip sync** — struggle montage + flashbacks |
| **5.62–8.00** | yeah / Oh / yeah riff cluster | **Gospel peak** — full call, lip-sync all |
| **8.00–9.12** | *instrumental breath* | **Collect** — still, inward, where am I |
| **9.12–9.60** | **Lost** | Emotional snap + first face reveal |
| **9.60–10.86** | in the darkness | Subdued lip sync |
| **10.86–11.54** | *pause in vocal* | Hold, rain, dark |
| **11.54–13.12** | trying to find my way | Subdued lip sync to end |
| **13.12** | last syllable | End on **way** |

## Montage cut accents (energy peaks, first 6 s)

Use these instead of the old 0.5 / 1.4 / 2.3… grid:

**0.6 · 1.0 · 1.6 · 2.3 · 2.8 · 3.4 · 4.1 · 4.6 · 5.1 · 5.8 s**

## What was wrong before

| Old prompt | Actual chunk |
|------------|--------------|
| Silent run 0–6 s | **Oh / yeah from 0.9 s** |
| Riff 6.0–9.0 s only | Riff **also 0.9–3.3** and **5.6–8.0** |
| *Lost* at **8.96 s** | *Lost* at **9.12 s** |
| *way* at **13.2 s** | *way* ends **13.12 s** |

Re-run analyzer: `uv run --with faster-whisper --with numpy --with scipy scripts/analyze_seedance_chunk_timing.py drown-in-this-river-seedance-chunks/02-lost-in-the-darkness-trying-to-find-my-way.mp4`

Prompts: **`seedance-prompt-simple.txt`** (recommended) · `seedance-prompt.txt` (detailed)
