# ChatGPT image — notes for environment sheets

## The grain / "turbulence noise"

**Usually not invisible watermarking.**

OpenAI embeds **C2PA metadata** and reportedly **imperceptible** image watermarking in generated images. That is designed to survive compression and stay **invisible** to the eye — it does not normally show up as swirly grain or turbulent noise in dark teal shadows.

What you are seeing is more often:

| Cause | What it looks like |
|-------|---------------------|
| **Dark-scene generation** | Mushy texture in crushed teal-black areas |
| **Prompt keywords** | "Cinematic," "crushed grade," "film production," "storm" → model adds **fake film grain** |
| **ChatGPT resize/compress** | Softening + noise when saving or displaying |
| **Rain + low light** | Model paints rain as noisy speckle instead of streaks |
| **"Thinking" / image model version** | Some runs are more painterly than photoreal |

### Prompt fixes (in our sheet prompt)

- Say **clean photoreal cinematic**, **minimal film grain**
- Say **no heavy noise**, **no turbulent grain in shadows**
- Say **sharp rain streaks**, **readable building detail**
- Avoid stacking: film grain + crushed + Kodak + noise + gritty all at once

### Post fixes

- Topaz / denoise lightly on **environment plates only** (keep diagrams sharp)
- Regen with shorter prompt if ChatGPT over-styles
- Try: *"photoreal location scout stills, zero film grain, clean digital cinema"*

---

## Environment-only sheets

Character belongs in **Image 1** (Nia sheet) for Seedance. **Image 2** = places + color grade only.

Yellow in the legend = **color swatch** for editors, not a figure in the plate.

---

## Regen checklist

- [ ] 16:9 landscape
- [ ] No people in bottom panels
- [ ] Amber city lights + teal storm (not monochrome)
- [ ] Diagrams readable in top band
- [ ] Grain acceptable or denoise pass
