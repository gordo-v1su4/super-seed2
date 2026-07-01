# Chunk 03 — verified timing (Higgsfield)

**Video 1:** `03-sinking-in-this-river-cant-she-the-light-of-day.mp4`  
**Duration:** **13.909 s** (ffprobe + Whisper)  
**Higgsfield:** **15 s** container · sync **0 → 13.9 s** · **no tail**

> Cross-checked 2026-06-30 with faster-whisper on the chunk MP4.

## Vocal map (chunk file)

| Time | Words (Whisper) | Visual |
|------|-----------------|--------|
| **0.00–4.36** | *Sinking in this river can't see the light of day* | Lip sync from **first frame** — continuation of ep 02 |
| **4.36–5.16** | *instrumental* | Breath gap, sway, rain |
| **5.16–9.32** | *Is on the shoulders that weigh me down* | Line 2 — slump, push-in |
| **9.32–10.00** | *instrumental* | Inhale, still |
| **10.00–13.82** | *Drowning in my sorrows feeling like I might drown* | Line 3 — peak intensity, still restrained |
| **13.82** | last syllable **drown** | **End** |

## Word-level (lip sync)

**Line 1:** Sinking 0.00 · in 0.86 · this 1.34 · river 1.50 · can 2.38 · the 3.32 · light 3.58 · of 3.76 · day 3.76–4.36  

**Line 2:** Is/on 5.16–6.14 · shoulders 6.26–6.72 · that 7.42 · weigh 7.52–7.90 · me down 8.44–9.32  

**Line 3:** Drowning 10.00 · sorrows 11.04–11.82 · feeling 12.14 · like 12.48 · might 13.08 · drown 13.42–13.82  

## Phrase-boundary cuts

**4.36 · 5.16 · 9.32 · 10.0 s** — optional accent peaks: 0.51, 1.11, 1.86, 2.6, 3.2, 4.04, 5.36, 6.41, 7.41, 8.75, 10.26, 11.28, 12.21, 13.26  

## vs. old prompt (manifest)

| Old | Verified |
|-----|----------|
| Line 1 from **0.24 s** | Line 1 from **0.00 s** |
| Line 1 ends **4.54 s** | **4.36 s** |
| Line 2 **5.28–9.34 s** | **5.16–9.32 s** |
| Line 3 ends **13.2 s** | **13.82 s** |
| Post-roll 13.9–15 s | **Removed** |

Analyzer: `uv run --with faster-whisper --with numpy --with scipy scripts/analyze_seedance_chunk_timing.py drown-in-this-river-seedance-chunks/03-sinking-in-this-river-cant-she-the-light-of-day.mp4`

Prompt: `seedance-prompt.txt`
