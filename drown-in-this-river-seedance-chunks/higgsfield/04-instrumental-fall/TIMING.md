# Chunk 04 — verified timing + story (Higgsfield)

**Video 1:** `04-instrumental.mp4`  
**Duration:** **14.954 s** (ffprobe) · **15 s** container

> Instrumental — no Whisper lyrics. Two prompt strategies; both valid for overlap editing.

## Edit strategy

Chunks **overlap on purpose** — do not force seamless handoff from chunk 03 or into chunk 05. Goal is **coverage** across the full song; assemble later.

| Version | End point | Use when |
|---------|-----------|----------|
| **v2 (current)** | Water impact ~**14.5–14.9s** | Long SFX opening, music swells mid-chunk, splash at end |
| v1 (archived) | Beat-2 ad-lib ~**12.7s** | Underwater ECU, synth motif, oh — extra coverage for overlap |

## Story v2 (current)

Trunk-break fall → **long SFX-forward opening** (~0–5s) → music in Video 1 swells (~5–11s) → slow-mo fall → real-time river approach (~11–13.5s) → **water impact on final accent** (~14.5–14.9s) → **cut on splash**. No underwater aftermath in this clip.

## Energy map v2 (visual sync targets)

| Time | Audio | Visual |
|------|-------|--------|
| **0.0–5.0** | Opening accents; quietest ~3.2s | Scream, breath, wind, rain — music feels stripped |
| **5.0–11.0** | Mid-chunk build | Music forward; slow-mo fall; epic camera |
| **11.0–13.5** | Rises toward end | Real-time; river surface fills frame |
| **~14.5–14.9** | Final major peak **14.79** | **Water impact — END HERE** |

## Energy map v1 (archived — extra coverage)

Impact at ~10.62s, then underwater ECU, synth three-note motif, downbeat ~11.82, ad-lib ~12.7s. See `seedance-prompt-simple-v1.txt`.

## Key peaks (verified RMS)

**1.03 · 10.62 · 11.82 · 12.72 · 14.79 s**

- **v2** locks splash to **~14.79** (final peak)  
- **v1** locks splash to **~10.62** and continues for oh/synth coverage  

## Prompts

| Label | File |
|-------|------|
| Option 1 v3 **(current)** | `seedance-prompt-simple-v3.txt` |
| Alt A v3 | `seedance-prompt-alt-A-epic-camera-v3.txt` |
| Option 1 v2 | `seedance-prompt-simple-v2.txt` |
| Option 1 v1 | `seedance-prompt-simple-v1.txt` |
| Alt A v1 | `seedance-prompt-alt-A-epic-camera-v1.txt` |

## Next chunk (overlap OK)

`05-oh.mp4` — can cover post-splash / ad-lib / next vocal regardless of where chunk 04 ends.
