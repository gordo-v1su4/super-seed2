---
name: prepare-song-for-seedance
description: >-
  Chunk a song into 10–15 second black-screen MP4s for Seedance audio refs.
  Uses Whisper lyrics + energy dips for natural cut points. Use when the user
  asks to prepare a song for Seedance, chunk a track for video generation,
  or render black-background MP4s from audio.
---

# Prepare Song for Seedance

## When to use

Trigger on phrases like:
- "prepare this song for Seedance"
- "chunk the song for Seedance"
- "black background MP4s from this audio"

## Workflow

1. **Input:** Any audio file (`.wav`, `.mp3`, `.flac`) — often from `~/Downloads/`.
2. **Run the repo script** (do not hand-roll ffmpeg one-offs):

```bash
uv run --with faster-whisper --with numpy --with scipy \
  scripts/prepare_song_for_seedance.py "/path/to/song.wav" \
  --out-dir "./song-name-seedance-chunks"
```

3. **Output folder** contains:
   - `01-<lyric-slug>.mp4`, `02-…`, … — black 1920×1080 H.264 + AAC
   - `manifest.json` — cut times, labels, full Whisper transcript

## Chunk rules (defaults)

| Setting | Value |
|---------|-------|
| Min length | 10 s |
| Max length | 15 s |
| Target | 14.5 s |
| Cut preference | End of phrase/verse (Whisper) > energy dip > nearest to target |
| Avoid | Mid-word vocal cuts |

Override: `--min 10 --max 15 --target 14.5`

## MP4 spec (matches working Seedance refs)

- Video: `color=c=black:s=1920x1080:r=30`, H.264, yuv420p
- Audio: AAC 192k, 44100 Hz
- `-movflags +faststart`

## Seedance usage

Pass each chunk as `@video_file_1` (or `@Video_1` in prompt prose). In prompts, state that the black screen is **audio/rhythm only** — ignore the visual. See `exxample-prompts/cinematic-specialty-shots.md`.

Inner model: `"model": "seedance_2.0"` in `options`. Duration param should match chunk length (10–15).

## Filename labels

Derived from Whisper text in each chunk (first phrase words, slugified). Instrumental sections → `instrumental`.

## Dependencies

- `ffmpeg` / `ffprobe` on PATH
- Python via `uv`; script pulls `faster-whisper`, `numpy`, `scipy` at runtime

## Optional flags

- `--no-transcribe` — energy-only cuts (faster, no lyric labels)
