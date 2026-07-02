# Seedance / Higgsfield prompt format (chunk 03)

Shared rules: `../02-woods-run-breath/PROMPT-FORMAT.md`

## Versioning

Each new pass → new `-vN.txt` file. Do not overwrite old versions. **Keep only the last 3 versions** per prompt line; prune older files when you add a fourth. README points at current.

## Chunk 03 extras

| Do | Don't |
|----|-------|
| Refer to vocals as opening phrase / second phrase / third phrase / final phrase in Video 1 | Quote lyric words (sinking, river, shoulders, weigh, down, drown, feeling, etc.) — burns subtitles |
| Say melismatic riff at close of second phrase (~8.4–9.3s) | Say riff on DOWN or spell the word being riffed |
| Trunk snaps — she falls with the wood, gravity only | Upward launch, pop into air, float then drop on break |
| Describe motion without lyric nouns (upper body slump, torso opens) | Use body-part words that match the sung line (shoulders) |
| Moon or cloud break for brighter clearing | Lightning bolts in frame — renders poorly |
| Off-camera storm flicker at most, if any | Background lightning strikes on tree or branch |
| Plain timeline `0–4s:` … | Sub-second splits like `12.1–12.5s` — model ignores them |

## Subtitle burn-in (observed)

Gen showed on-screen text for a sung word when the prompt used the same word in prose. Treat Video 1 lyrics as toxic for prompt text — timing and phrase index only.

## Prompts

| Label | File | On disk (last 3) |
|------|----------|------------------|
| Option 1 **(current)** | `seedance-prompt-simple-v11.txt` | v9–v11 |
| Alt A **(current)** | `seedance-prompt-alt-A-michael-bay-v14.txt` | v12–v14 |
