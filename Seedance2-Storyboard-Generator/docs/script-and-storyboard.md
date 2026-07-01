# Claude Code for Scripts and Storyboards, Nana Banana Pro for Asset Images, Seedance 2.0 for Video — A Three-Tool Workflow for a 20-Episode Ink-Wash Chinese-Style AI Comic Drama

## Real-World Experience Making a 20-Episode Ink-Wash Comic Drama with Seedance 2.0

Lately the internet has been flooded with claims that Seedance 2.0 is absurdly powerful — polished demo clips everywhere.

But honestly, after seeing so many of them, I started to wonder: they're all cherry-picked highlights. If you actually use it to finish a full project, does it hold up?

Practice beats theory. With some free time over the Spring Festival, I decided to find out.

I used Claude Code for scripts and storyboards, Nana Banana Pro for asset images, and Seedance 2.0 for video generation — three tools working together — to produce a 20-episode ink-wash Chinese-style AI comic drama called *Ink Sword Chant* (*Mo Jian Yin*). Each episode is 15 seconds; with the opening title, the total runtime is a little over five minutes. The look is ink wash plus anime cel-shading, similar in feel to *Fog Hill of Five Elements*.

Watch the finished piece first and judge for yourself:

After finishing, here is my honest take: Seedance 2.0 is genuinely strong, but it is not yet as magical as the hype suggests. Below I break down the full pipeline and the pitfalls I hit along the way.

## What the Full Pipeline Looks Like

Making this AI comic drama broke down into six steps:

**Concept → Write script → Generate asset descriptions → Generate images → Write storyboard scripts → Generate video episode by episode**

Claude Code handled almost everything text-related. During concepting I discussed genre and story direction with it; once we aligned, I had it draft the script. With the script in hand, I had it output English prompts for every character, scene, and prop. After the asset images were done, I had Claude Code combine the script with the official Seedance 2.0 manual and output a storyboard script for each episode. Finally I had it run a quality pass to check completeness and continuity between episodes.

Manual work concentrated in two places: generating asset images with Nana Banana Pro, and pasting prompts into the Jimeng platform to generate video episode by episode.

Final output volume: one complete script (four acts, twenty episodes), 30 asset images (13 character + 12 scene + 5 prop), and 21 storyboard scripts (including one opening title).

## Start with a Story

Step one was talking through the theme with Claude. I wanted wuxia — I have had that dream since childhood. After a few rounds of discussion we locked the framework: classic four-act structure (setup, development, twist, resolution), five episodes per act.

The story follows young swordsman Ye Qingyun, whose sect is destroyed. He sets out on a revenge path and saves Su Wanyue, a woman being hunted. They travel together and feelings grow — but Su Wanyue's true identity is the younger sister of Yan Wuchen, leader of the Xuanming cult and the man who wiped out Ye's sect. She stole an ancient sword manual and fled. Ye faces the dilemma of revenge versus love. In the end he and Su Wanyue join forces to defeat Yan Wuchen, burn the manual, and retire to the mountains.

We also set an emotional tone per episode in advance. Act I moves from heavy to warm; Act II from surprise to conflict; Act III from inner turmoil to intensity; Act IV from confrontation to release. Each episode has a clear emotional baseline so sound design and color grading have a anchor when writing storyboards.

This step did not take long — about two hours including manual review. But everything downstream follows the script. Get the script wrong and you rework everything.

## 30 Reference Images, All from Nana Banana Pro

With the script done, the next step was having Claude list every visual asset needed. Each asset got an ID so storyboard scripts could reference them with `@` syntax.

| Category | Count | ID Range | Example |
|----------|-------|----------|---------|
| Characters | 13 | C01–C13 | C01 Ye Qingyun · front full body, C04 Su Wanyue · front full body, C07 Yan Wuchen · front full body |
| Scenes | 12 | S01–S12 | S01 Qingfeng Mountain ruins, S03 moonlit ancient town, S04 cliff precipice |
| Props | 5 | P01–P05 | P01 Qingfeng sword, P03 sword manual *Ink Sword Chant*, P04 half-face demon mask |

One character can have multiple images. Ye Qingyun alone has front full body (C01), side dynamic (C02), back walking away (C03), injured state (C11), and youth flashback (C13). Different episodes need different angles and states.

All 30 images must share one style. Mix realistic and cartoon and the video feels broken. My approach was a unified style prefix on every prompt:

```
Chinese ink wash painting style mixed with anime cel-shading
```

Every character, scene, and prop prompt starts with that line. Example:

### C01 — Ye Qingyun · Front Full Body Character Sheet

```
Chinese ink wash painting style mixed with anime cel-shading, a young male swordsman standing in a heroic pose, full body front view. He has long black hair tied in a high ponytail, sharp eyebrows, bright determined eyes, handsome angular face with a resolute expression. He wears a blue-white hanfu swordsman robe with flowing sleeves, a dark ink-black waist sash, black wrist guard on left arm. An ancient longsword named "Qingfeng" is strapped to his back in a simple dark scabbard. Age around 22. Athletic lean build. Ink splatter effects on the edges. Muted color palette with blue-white-black tones. Traditional Chinese painting background with subtle mountain silhouettes. Full body character design sheet style, clean background, highly detailed costume design
```

Character recognition relies on color and visual markers. Ye Qingyun: black high ponytail, blue-white robe, sword on back. Su Wanyue: silver-white braids, moon-white long dress, short sword at waist. Yan Wuchen: half-face demon mask, black robe, dark red armor. The palette differences are strong enough to read at a glance even in ink-wash style.

All images were generated with Nana Banana Pro at 16:9 to match video aspect ratio. One detail: Nana Banana Pro output includes watermarks — remove them at banana.ovo.re or the watermark can bleed into video and break immersion.

## The Official Seedance Playbook Matters

Before writing storyboards I did one thing: pulled down the official Seedance 2.0 manual from Jimeng.

It lives on Feishu: https://bytedance.larkoffice.com/wiki/A5RHwWhoBiOnjukIIw6cu5ybnXQ. It is very detailed — model capabilities and best practices. I saved the full content as markdown and fed it to Claude Code as context when generating storyboard scripts.

That way Claude Code had a reference when writing prompts, and the storyboards tracked Seedance 2.0 best practices more closely.

The payoff was big. For example, the manual recommends a timeline structure — split 15 seconds into five 3-second beats, each describing picture, camera, and sound. That beats a vague "the whole clip should feel like X" — the model understands what each segment should do.

> **Note: What the manual covers**
>
> Useful topics: timeline prompt segmentation; omni-reference `@image_file_X`, `@video_file_X`, `@audio_file_X` syntax; video extension; camera keywords (Hitchcock zoom, one-shot, 360° orbit, etc.); the 9-image upload cap. These rules directly shape how you write storyboards — read the manual end to end before you start.

## Storyboard Scripts Are the Core

Storyboard scripts took the most effort and matter most. Each episode storyboard has three parts: upload asset checklist, Seedance prompt, and end-frame description.

Take Episode 1, "Ashes," as an example.

The asset checklist lists every reference image for that episode:

| Slot | File | Notes |
|------|------|-------|
| Image 1 | C01 (Ye Qingyun front) | Character consistency |
| Image 2 | C03 (Ye Qingyun back) | End-frame back view |
| Image 3 | C09 (Chen Wangyue bust) | Flashback character |
| Image 4 | S01 (Qingfeng Mountain ruins) | Scene background |
| Image 5 | P01 (Qingfeng sword) | Prop reference |
| Image 6 | S07 (wilderness mountain road) | End-frame scene |

The Seedance prompt is the heart. Episode 1 split into five beats:

```
Ink-wash Chinese anime style. @image_file_4 as scene background reference, @image_file_1 as protagonist — a young swordsman.

0-3s: High aerial shot slowly descending and pushing in (push speed ~0.5x), from bird's-eye to eye-level wide shot.
Panorama of the burned mountain gate ruins — black smoke rising, broken walls, shattered name plaque scattered,
protagonist standing alone in the center of the ruins. Howling wind, crackling embers.

3-6s: Camera continues slow push (speed ~1x), wide to medium to face close-up.
Protagonist bends to pick up master's broken sword (@image_file_5) from the ruins, blade still stained with blood.
Face close-up — brows furrowed, eyes mixing tears and rage. Low mournful strings.

6-9s: Fast flash-cut to flashback, yellowed blurred treatment.
Master (@image_file_3 likeness) pushes young protagonist out of the gate amid flames.
Roaring fire, muffled shouts.

9-12s: Flashback ends. Orbit camera counter-clockwise 270°.
Protagonist kneels on one knee, plants broken sword in ground as grave marker, head bowed swearing revenge. Wind stops abruptly, silence.

12-15s: Medium → wide pull to extreme long shot. Protagonist stands, slings long sword (@image_file_5) on back,
turns and walks along desolate mountain road (@image_file_6).
Back view reference @image_file_2, receding into ink mist. Distant xiao flute rises.

Color palette: gray-black and blue-green throughout, ink-wash texture throughout.
```

Each beat has three layers: picture content (who does what), camera movement (how it is shot), and sound (what you hear). `@image_file_X` references are sprinkled through the beats so the model knows which asset applies where.

The end-frame note records the last frame: "Ye Qingyun's back on a desolate mountain road, dry grass in wind, distant bamboo silhouette, extreme long shot composition." That bridges to the next episode.

All 20 episodes plus the opening — 21 storyboard scripts total — were generated by Claude Code from the script and manual context. After generation I had Claude Code run a completeness review on two points:

1. Do referenced asset IDs exist? Any typos or missing images?
2. Do adjacent episodes connect visually? Episode 1 ends with Ye's back walking into wilderness; Episode 2 should open with him alone on that road.

Claude Code caught several discontinuities. Human review still matters — subtle logic gaps can slip past AI.

> **Note: Camera techniques**
>
> The storyboards use a dozen-plus camera moves learned from the manual. Common ones: Hitchcock zoom (push in while zooming out — subject size stable, background compresses — for inner shock); one-shot (no cuts, continuous follow — action scenes feel present); 360° orbit (rotate around character — training or combat); time-freeze orbit (freeze frame then orbit for detail — key duel moment); first-person POV (through character's eyes — works well for cliff falls). Use explicit English camera terms in the prompt.

## Episode-by-Episode Generation, Chained with Video Extension

With storyboards done, generate video one episode at a time.

The workflow is straightforward: open Jimeng, choose Seedance 2.0 omni-reference mode, upload reference images per the checklist, paste the prompt, select 15 seconds, generate.

The hard part is chaining 20 episodes seamlessly. I used video extension.

Opening and Episode 1 generate fresh — no video reference. From Episode 2 onward, upload the previous episode's video in addition to character and scene refs. Start the prompt with `Extend @video_file_1 by 15s` ("Extend @video_file_1 by 15s") so the model continues from the last frame of the prior clip.

The chain:

```
Opening (new) → E1 (new) → E2 (extend E1) → E3 (extend E2) → ... → E20 (extend E19)
```

Each episode extends the previous one; transitions between end and start frames are model-generated — no manual splice.

It is not always smooth. If the prior episode ends at night and the next should be day, the transition can feel abrupt. Explicit transition language helps, e.g. "Fade to black; sky shifts from stormy night to moonlit night after rain."

## Problems I Ran Into

Several issues showed up across the project — not limited to one episode.

**Sensitive words.** The worst pitfall. The script used *jianghu wanderers* — ordinary wuxia vocabulary — and generation kept failing. The platform does not say why or highlight the blocked term; the page only shows content non-compliant, generation failed.

I binary-searched the prompt: cut the second half — if it works, the problem is there. Halve again until I found that phrase. That took nearly an hour.

There is no great fix yet. If you use Seedance heavily, build a sensitive-word list and have Claude avoid those terms in storyboards from the start.

**Instruction following is inconsistent.** My storyboard prompts are long — 300–400 words per episode, five beats plus camera, sound, and character refs. The model does not always execute everything.

Common misses: camera move in a beat does not match description; a character vanishes for a few seconds. Regenerate and hope. Some episodes took three or four tries. Some storyboards never fully matched — I picked the least bad take.

**AI video editing is weak.** A major Seedance 2.0 limitation. In a 15-second clip, if 0–3s is wrong but the rest is fine, you cannot fix just those 3 seconds. Regenerate the full 15 seconds. If the new take breaks other beats, you chase your tail.

That wastes time and credits. Future versions may improve this.

I am not strong at video editing, so every clip is AI straight output with no post polish — you can still see rough details.

## Strong, Yes — Industry-Replacing, Not Yet

After 20 episodes, my summary in one line: capability is real, but for industrial production it is efficiency gain, not replacement yet.

**Strengths**

Multimodal input works. Reference images anchor style and faces — far more reliable than text-only video. Video extension chains 20 episodes. Ink-wash quality exceeded expectations in several scenes.

**Weaknesses**

Unstable instruction following — complex prompts mean more disobedience and retries. Weak precise editing. Opaque sensitive-word filtering — painful to debug.

That said, AI video iterates fast; many of these issues may shrink in months.

Regardless of tools, the hardest work is still upfront: decide what story to tell, nail the script, design the storyboards. That part cannot be outsourced to the model.
