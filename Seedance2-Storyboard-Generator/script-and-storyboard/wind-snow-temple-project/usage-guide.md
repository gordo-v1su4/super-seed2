# Fengxueshan Temple Project - User Guide

## Project Overview

This project adapts Lin Chong's classic story "Fengxueshan Temple" in "Water Margin" into a 5-episode AI short video series, showing Lin Chong's complete transformation from tolerance to resistance.

## File structure

```
Lin Chong Project/
├── Fengxueshan Temple_Script.md # Complete script, including 5 episodes of plot
├── Fengxueshan Temple_material list.md # Character, scene, prop definition
├── Fengxueshan Temple_E01_ storyboard.md # Episode 1 Seedance 2.0 Prompt words
├── Fengxueshan Temple_E02_ storyboard.md # Episode 2 Seedance 2.0 Prompt words
├── Fengxueshan Temple_E03_ storyboard.md # Episode 3 Seedance 2.0 Prompt words
├── Fengxueshan Temple_E04_ Storyboard.md # Episode 4 Seedance 2.0 Prompt words
├── Fengxueshan Temple_E05_ storyboard.md # Episode 5 Seedance 2.0 Prompt words
└── User Guide.md # This document
```

## Production process

### Step 1: Asset generation

Use **Nana Banana Pro** to generate all required image assets according to the asset list.

**Key points for asset generation:**
1. Use style prefixes uniformly: "Traditional Chinese ink painting style combined with realistic rendering, with black, white and gray as the main colors"
2. Character materials require multiple angles (C01-C11)
3. scene materials need to be distinguished between day and night scenes (S01-S09)
4. Pay attention to the details of prop materials (P01-P10)
5. Each asset number corresponds to a specific purpose and cannot be confused.

### Step 2: Video generation

Use the **Seedance 2.0** platform to generate 5 episodes of video.

**Episode 1 generated (no video extension required):**
1. Upload the corresponding picture to the location of Picture 1-Picture 6
2. Copy the Seedance Prompt in the E01 storyboard
3. Generate 15 seconds video

**Episodes 2-5 generated (using video extension function):**
1. Upload the previous episode video to the @video_file_1 location
2. Upload the corresponding image to the image location
3. Modify the beginning of Prompt to: "Extend @video_file_1 for 15s,"
4. Keep the subsequent description unchanged
5. Generate 15-second video to achieve seamless connection

### Step 3: Post-processing

1. **Subtitles added:** Add Chinese subtitles based on [Subtitles] information
2. **Sound adjustment:** Ensure the balance of music, sound effects, and dialogue
3. **Inter-episode connection:** Check the coherence between episodes
4. **Overall color grading:** Unify the black, white and gray ink style of the entire drama

## Key technical points

### Style consistency

- **Color:** Celluloid style, clear outlines, flat color scheme, red is only used for embellishment (blood, fire, gun tassel)
- **Light and Shadow:** Explicit shadow blocks, animation-like cel shading
- **Lines:** Clear and powerful outlines, consistent lines of characters and scenes

### Emotional progression

| Number of episodes | Core emotions | Visual expression |
|------|----------|----------|
| 1 | Loneliness and depression | Large areas of blank space and small characters |
| 2 | Crisis, dilemma | Dynamic shots, chaotic scenes |
| 3 | Shock, awakening | Close-up of eyes, contrast between internal and external light |
| 4 | Explosion, catharsis | Quick editing, red and white contrast |
| 5 | Determination, rebirth | The morning light appears and the steps are firm |

### Seedance 2.0 Constraints

- **Maximum 9 pictures**: The storyboards of each episode have been controlled within 9 pictures
- **Max 3 reference videos**: Only 1 reference video is required for episodes 2-5 (previous episode)
- **Avoid sensitive words**: Words such as "official government" and "imperial court" can be replaced appropriately.
- **Command Length**: Prompt in each episode is controlled to a reasonable length

## Key points of character creation

### Lin Chong’s image changes

1. **Episode 1-2:** Forbearing and giving in, eyes suppressed
2. **Episode 3:** Shocked awakening, anger ignited
3. **Episode 4:** Explode completely and kill the enemy angrily
4. **Episode 5:** Reborn firmly and never look back

### Lin Chong’s identification mark

- Felt hat (headgear)
- Sheepskin jacket (outer jacket)
- Parrot green jersey (underwear, occasionally exposed)
- Flower gun (weapon)
- Wine gourd (personal belongings)

## Frequently Asked Questions and Answers

### Problem 1: Image generation styles are inconsistent

**Solution:** Make sure each prompt word includes the complete style prefix: "2D Chinese animation style, cel shading, clear lines, flat color scheme"

### Problem 2: Video connection is not smooth

**Solution:** Episodes 2-5 must use the video extension function, and the last frame description must be accurate to ensure that the next episode can start from the last frame state

### Problem 3: The effect of wind and snow is not obvious

**Solution:** Emphasis on keywords such as "heavy snow", "flying snow", "wind and snow" in the prompt

### Problem 4: The fighting scenes are not intense enough

**Solution:** Use dynamic lens language, emphasizing techniques such as "quick editing", "slow-motion close-ups", and "action afterimages"

## Extension suggestions

If you need to expand to more episodes, consider:

1. **Prequel part:** Lin Chong accidentally enters Baihu Hall, Cangzhou, Wild Boar Forest, etc.
2. **Subsequent part:** Liangshan’s recruitment, recruitment, Fangla recruitment, etc.
3. **Character branch lines:** Mrs. Lin’s story line, Lu Qian’s story line, etc.

## Style reference

It is recommended to refer to the 2D Chinese animation style of the following works:

- Celluloid shading and line processing for "The Great Protector"
- Action scenes and color use in "Five Elements of Mist Mountain"
- scene composition of "Big Fish and Begonia"
- Character design and dynamic performance of "Mr. Miao"

## Summary

"Fengxueshan Temple" is a turning point in Lin Chong's life and a symbol of his transition from "endurance" to "resistance". This project fully presents this classic scene through 5 episodes of short videos, hoping to allow the audience to feel the whole process of Lin Chong's loneliness, depression, explosion and rebirth.

Good luck with your creation!