# Seedance / Higgsfield prompt format

Two chunk 02 prompts:

| File | Use when |
|------|----------|
| **`seedance-prompt-simple.txt`** | **Try this first** — fewer beats, no lyric text, section headers |
| `seedance-prompt.txt` | Detailed version (montage cuts, flashbacks, word times) |

## Section order (Seedance-friendly)

Jimeng / Seedance storyboard docs use labeled blocks. Higgsfield accepts the same with `@[Image 1](image_1)` refs at the top:

1. **Refs line** — `@Image 1` likeness + `@Video 1` audio master  
2. **【Style】** — look, ratio, environment, grade  
3. **【Duration】** — track length, end behavior  
4. **【Constraints】** — negatives (especially **no subtitles**)  
5. **Timeline** — `0.0–3.3s:` … (wide windows, not 10 micro-cuts)  
6. **【Audio】** — sync Video 1, continuous mix  
7. **【References】** — what each upload does; Image 2 silent  

## Avoid (causes bad gens)

- Spelling **full lyric lines** in quotes → model burns **subtitles**  
- Many **hard cuts / whip pans / flashback** instructions → chaotic transitions  
- Re-describing face, dress, jewelry when **Image 1** is attached  
- **Audio structure** footer as separate paste — fold into 【Audio】 one line  

## Verified times (chunk 02)

See `TIMING.md`. Simple prompt uses **phase windows** only; detailed prompt has word-level times.

## Coming next

**Environment card** (Nano Banana) — multi-panel woods / flooded city / tree break / underwater refs for silent Image 2 slot. Not built yet.

## Analyzer

```bash
uv run --with faster-whisper --with numpy --with scipy scripts/analyze_seedance_chunk_timing.py drown-in-this-river-seedance-chunks/02-lost-in-the-darkness-trying-to-find-my-way.mp4
```
