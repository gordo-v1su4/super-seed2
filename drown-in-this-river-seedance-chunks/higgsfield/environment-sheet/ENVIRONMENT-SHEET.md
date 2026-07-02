# Environment sheet — Drown In This River (chunks 03–04+)

**Environment only — no person** in the sheet. Character = **Image 1** (Nia). This sheet = **Image 2** (places + color grade).

Upload as **Image 2** and **`@Image 2`** in Seedance for geography + color lock.

**Output:** **16:9 landscape** — `environment-sheet-16x9-env-only.png`

---

## Generate (primary: Nano Banana)

| File | Use |
|------|-----|
| **`nano-banana-environment-sheet-prompt.json`** | Full sheet — diagrams + 8 cinematic plates (regen if bottom row looks like concept art) |
| **`nano-banana-environment-plate-single.json`** | **Better photoreal** — one live-action 16:9 still per run (E notch, F city, J water, K underwater); stitch or upload best plates |
| `nano-banana-environment-sheet-prompt.txt` | Plain-text backup |
| `NANO-BANANA-NOTES.md` | Ref rules + troubleshooting |
| `COLOR.md` | Hex palette |

**Photoreal rule:** Multi-panel sheets often render as **concept art / game env**. For cinema look, run **`nano-banana-environment-plate-single.json`** 4× (E, F, J, K) with your best Higgsfield still as Image 1, then composite or upload plates directly as Image 2.

**ChatGPT fallback:** `chatgpt-environment-one-sheet-prompt.txt` — known speckle issues; new chat per regen.

---

## Layout A (default) — top diagrams / bottom storyboards

```
┌──────────────────────────────────────────────────────────── 16:9
│  MAP (wide)      │  CROSS-SECTION  │  STORY FLOW  │ [legend] │  ~45%
├────────────────────────────────────────────────────────────
│  D woods │ E notch │ F city │ G give │ H hang │ I fall │ J/K │  ~55%
│              storyboard row(s) — 16:9 frames in each cell
└────────────────────────────────────────────────────────────
```

| Zone | Content |
|------|---------|
| **Top ~45%** | Graphic diagrams only — orthographic map, cross-section, story flow, **hex legend** |
| **Bottom ~55%** | **Empty** photoreal environment plates — same angles, **no actor** |

**Geography:** Bluff rim notch + storm tree at cliff edge. **NOT** log-bridge / megalog bridge.

Prompt: `nano-banana-environment-sheet-prompt.json`

---

## Layout B (alternate)

`chatgpt-environment-one-sheet-layout-B.txt` — ChatGPT only; same hex rules.

---

## Story beats (bottom zone)

| Panel | Beat |
|-------|------|
| Rim woods | Bluff trail, basin hidden |
| Notch | Trail ends, amber lights below |
| City reveal | Wide deep drowned city |
| Give-way | Dreamlike rim slide, tree tilts |
| Suspended | Hang beat — tree tether |
| Release | Flash + fall begins |
| Above water | Chunk 04 rapids |
| Underwater | Chunk 05+ — **turbulent current**, cars/debris dragged, ruined city; **not calm** |

**Color:** locked hex in `COLOR.md`. Yellow = legend swatch only (character = Image 1).

---

## Gens gone wrong

- **Log-bridge / people in panels** → used legacy 4×3 prompt; use JSON above
- **Crushed black** → ignored hex floor `#1A3238`; regen with Nano Banana JSON
- **Speckle noise** → clean ref + denoise before Seedance; see `NANO-BANANA-NOTES.md`
- **Refs ignored for color** → attach mood still as Image 1 with color-only extract (JSON)

---

## Chunk links

| Chunk | Storyboard panels |
|-------|-------------------|
| 03 | D–I |
| 04 | I–J |
| 05+ | K underwater — debris current, cars in flow |
