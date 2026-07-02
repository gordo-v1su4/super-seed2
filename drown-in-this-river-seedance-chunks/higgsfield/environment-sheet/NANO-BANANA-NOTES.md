# Nano Banana — environment sheet (why gens went wrong + how to fix)

## What went wrong on your last regens

Your outputs matched the **legacy square 4×3 prompt**, not the hex-locked 16:9 spec:

| Problem in your sheets | Cause |
|------------------------|--------|
| **Log-bridge / megalog bridge** | Old prompt still said "log-bridge spanning gorge" |
| **Tiny yellow-dress figures in every panel** | Old prompt allowed silhouettes; refs copied whole frame |
| **Crushed near-black** (`#050505`, `#0A0F12`) | Prompt said "crushed teal-black" — model ignored sampled hex |
| **Speckle / rain dot soup** | "Torrential rain" + storm + no anti-grain rules |
| **Attached mood photos ignored for color** | No `extract` / `apply_to` — model copied composition + wrong geography |

Attaching example photos **without** "color grade only, do not copy people/bridge" makes Nano Banana treat the ref as **layout + character + color** — you get bridge + yellow figure + wrong blacks.

## Correct workflow

1. **Use** `nano-banana-environment-sheet-prompt.json` (not the old `.txt` legacy block).
2. **Attach Image 1** = one of your **good Higgsfield fall frames** (teal water, amber city, readable midtones).
3. **Do NOT attach** Nia character sheet to this gen — character = Seedance Image 1.
4. **Optional Image 2** = second mood still for water/sky tone only.
5. **Aspect ratio** = **16:9** (not 1:1 square).
6. **Regen in fresh session** if speckle appears — don't iterate on noisy output.

## Reference image rules (Nano Banana)

```
Image 1 purpose: COLOR GRADE ONLY
extract: hex palette + smooth cinematic grade
apply_to: bottom photoreal panels only
do_not_extract: people, dress, bridge, composition, grain, rain speckle
```

If the sheet still shows a person or bridge → your ref is being copied literally. Regen with stronger "empty plates, no human, invent new angles" or use a **crop of sky+water only** from the mood ref (no figure in the crop).

## After generation

1. Check legend swatches — should read close to `#2E5058`, `#3A5660`, `#C9A656` (not `#050505`).
2. Light denoise if any speckle remains before Higgsfield upload.
3. Save as `environment-sheet-16x9-env-only.png` → **Image 2** in Higgsfield.

## Sheet vs single plates (photoreal)

**Problem:** One image asking for diagrams + 8 frames → model defaults to **concept art / game environment** board, not live-action cinema.

**Fix:** Use `nano-banana-environment-plate-single.json` — **one 16:9 cinematic still per generation:**

1. Attach Image 1 = your best **photoreal** Higgsfield fall frame (look + grade)
2. Paste JSON; in prompt text add which plate: `E_NOTCH`, `F_CITY_REVEAL`, `J_ABOVE_WATER`, or `K_UNDERWATER`
3. Run 4 times → save `plate-E.png` … `plate-K.png`
4. Upload **F + J** (or composite grid) as Seedance **Image 2**

Single plates hit ARRI/anamorphic photoreal far more reliably than full sheets.
