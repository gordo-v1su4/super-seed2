# Love Me Tonight — Part 2 (Seedance omni)

## Asset map (`image_files` / `audio_files` order)

| Slot | Local file | Role |
|------|------------|------|
| `@image_file_1` | `diego_valentina_split.png` | Diego (**left**) + Valentina (**right**) on one sheet |
| `@image_file_2` | `image3_Imani.png` | Imani — lead singer |
| `@image_file_3` | `image4_Club.png` | Underground tropical nightclub environment |
| `@audio_file_1` | `audio1_try_first_12s.mp3` | Imani vocal — master timing / rhythm (12s) |

URLs:
- `upload_urls.json` — Coze signed CDN (works for fetch, dashboard thumbnails often broken)
- `upload_urls_catbox.json` — public catbox.moe links (thumbnail-friendly; used for job **D**)
- RustFS fallback: bucket `super-seed2` on `https://s3.v1su4.dev` via `https://media.v1su4.dev/upload` (needs `MEDIA_API_TOKEN` from homelab)

## Prompt rules

1. **Top block** — full slot map (once).
2. **First on-screen intro** for each principal — tag the slot **one more time**, then use names only.
3. Keep under **5000 characters** for `st-ai/super-seed2`.

---

## V2 prompt (next submit if current job fails)

Use `@image_file_1` as the split character sheet: Diego (left, Latino male dancer, open red shirt, black jeans, gold chain) and Valentina (right, female dancer, red cutout costume, wet-look hair, bronze tango heels). Use `@image_file_2` as Imani, the Black/Afro-Latina lead singer in metallic red stage dress with gold microphone. Use `@image_file_3` as the illegal underground tropical nightclub environment. `@audio_file_1` is Imani singing live — the master track driving this entire 12s piece; all rhythm, slow-motion ramps, whip-pans, dance beats, and climax must lock beat-for-beat to `@audio_file_1`; lips and mic stay synced throughout.

Continue after Part 1 cracked-floor moment. Camera dives through the golden floor fracture into a lower circular dance chamber matching `@image_file_3`: wet cracked concrete, red haze, amber bulbs, golden spotlights, smoke, packed Latino/Afro-Latino dancers, circular ring light overhead. One breathless relay one-shot, no clean cuts; camera stolen, blocked, and passed forward by bodies.

Start low behind Diego from `@image_file_1` (left side of the sheet) as he pushes through the crowd, shirt open, gold chain on sweat-glossed skin, black boots splashing wet concrete. An unnamed dancer sweeps red fabric across the lens (not Valentina). When the fabric clears, Valentina from `@image_file_1` (right side of the sheet) moves backward through red smoke, bronze-red shoes on wet concrete, eyes locked on Diego off-screen. Crowd parts; Valentina screen-right, Diego screen-left. Music ramps slow-mo; heavy wet footsteps; blurred Imani far behind still singing to `@audio_file_1`.

Crash-zoom between them; passionate embrace — Diego catches Valentina at the waist, orbital tango-reggaeton spin, camera 360, slow-mo back to full speed. Spin throws lens to an unnamed female relay dancer (not Valentina). Follow through raised arms, drop to conga hands, whip-pan to stage ECU of Imani from `@image_file_2`, sweat, gold earrings, singing command and desperation synced to `@audio_file_1`. Imani holds the mic and steps off stage; remains vocalist only.

Behind Imani's shoulder into crowd; unnamed dancer occludes lens. Low follow unnamed dancer, dramatic dip, dive under arms, boot in puddle, couple spinning in gold haze. Relay through unnamed bodies under red smoke and ring light. Romantic, sensual, sweaty, desperate — not violent.

Final: Diego and Valentina beneath the ring light; crowd surrounds. Imani beyond in gold haze singing the final line into the mic on `@audio_file_1`. Orbit Diego and Valentina, whip to Imani mouth ECU, rocket up through broken floor plates, red haze, cut black.

Style: 24fps anamorphic handheld relay-shot, body-wipes, occlusions, extreme lows, flying through bodies, ramped slow-mo, crash zooms, whip pans, shallow DOF, wet skin, tropical heat, red haze, gold spots, deep blacks, rugged Latin clubwear, tango-reggaeton-street-club movement. No fighting, combat, game-show, comedy gag, cyberpunk cliché, plantation, period costumes, drag camp, sterile MV polish, calm camera.

---

## V1 prompt (archived — 4 separate images)

<details>
<summary>Old @image_1–4 layout (do not use with current assets)</summary>

Use @image_1 as Diego; @image_2 as Valentina; @image_3 as Imani; @image_4 as club; @audio_1 as music reference. (Full text was the original single-paragraph prompt before the split sheet.)

</details>
