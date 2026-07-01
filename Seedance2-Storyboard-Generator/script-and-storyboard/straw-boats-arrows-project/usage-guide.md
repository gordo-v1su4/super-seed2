# Cao Chuan Borrowing Arrows - Project User Guide

---

## Project file list

```
Straw boat borrowing arrow project/
├── Straw Boat Borrowing Arrows_Script.md # Complete script (5 episodes)
├── Straw boat borrowing arrows_material list.md # Asset generation prompt words (40)
├── Straw Boat Borrowing Arrows_E01_storyboard.md # Episode 1 storyboard script
├── Straw Boat Borrowing Arrows_E02_storyboard.md # Episode 2 storyboard script
├── Straw Boat Borrowing Arrows_E03_storyboard.md # Episode 3 storyboard script
├── Straw Boat Borrowing Arrows_E04_storyboard.md # Episode 4 storyboard script
└── Straw Boat Borrowing Arrows_E05_storyboard.md # Episode 5 storyboard script
```

---

## Production process

### Step 1: Generate image material

Use **Nana Banana Pro** or other AI image generation tools to generate materials according to the prompt words in `Grass Boat Borrowing Arrows_Material List.md`.

**Asset generation order suggestions:**

1. **Generate the main character first** (for consistency reference)
   - C01 Zhuge Liang·Full-frontal view
   - C05 Zhou Yu · Full body front
   - C09 Lu Su·Front and full body
   - C12 Cao Cao · Full body from front

2. **Regenerate scene**
   - S01 Soochow Shuai Zhang·Interior
   - S02 Zhuge Liang's residence and courtyard
   - S03 Heavy fog on the Yangtze River
   - S05 Caoying Water Village·Vision

3. **Finally generate props and details**
   - P01 Military Order
   - P02 Feather Fan
   - P05 straw boat
   - Other props and expressions

**IMPORTANT NOTE:**
- Use unified style prefix for all prompt words: `Chinese ink wash painting style mixed with anime cel-shading`
- Use different color schemes for each character to distinguish them
- It is recommended to generate all materials of the same style at once to ensure consistency

---

### Step 2: Make a storyboard video

Use the **Seedance 2.0** platform to create videos based on the storyboards for each episode.

**Episode 1 production process:**

1. Open `Cao Chuan Borrowing Arrow_E01_ storyboard.md`
2. Upload the corresponding images according to the "Material Upload List"
3. Copy the content of "Seedance Prompt" to Seedance 2.0
4. Set the duration to 15 seconds and the frame to 16:9
5. Generate video

**Production process of episodes 2-5:**

1. **Important**: Upload the video generated from the previous episode as @video_file_1
2. Open the storyboard of the corresponding episode
3. Upload pictures according to the material upload list
4. Copy Seedance Prompt (note that there is "Extend @video_file_1 by 15s" at the beginning)
5. Generate video

**Continuous set skills:**
- Episode 2 needs to upload the video of Episode 1 as @video_file_1
- Episode 3 needs to upload the video of Episode 2 as @video_file_1
- And so on...

---

## Notes

### Seedance 2.0 limitations

- **Up to 9 pictures** - Up to 9 pictures can be referenced each time
- **Max 3 videos** - as reference material (for series)
- **Sensitive word avoidance** - Avoid using words such as "charlatan" that may be rejected
- **Instruction Length** - Prompt words exceeding 300 words may result in inconsistent instruction following

### FAQ

**Q: Why is the video series not smooth? **
A: Make sure that when generating episodes 2-5, the video of the previous episode is uploaded correctly as @video_file_1, and that the prompt word includes "Extend @video_file_1 by 15s" at the beginning.

**Q: What should I do if the material styles are inconsistent? **
A: Make sure all prompt words use the same style prefix. If you use Nana Banana Pro, it is recommended to use the same model parameters.

**Q: What should I do if I have difficulty identifying characters? **
A: Differentiate characters by color (Zhuge Liang is light blue, Zhou Yu is silver and red, Lu Su is green, Cao Cao is golden), and emphasizes these visual markers in the prompt words.

**Q: What should I do if the ink effect is not obvious? **
A: Emphasize "Chinese ink style" at the beginning of the Seedance prompt word, and add keywords such as "ink smudge" and "ink gradient".

---

## Production skills

### Create a clever and refreshing drama atmosphere

1. **Contrast Technique**: Create character comparisons in each episode
   - E01: Zhou Yu is proud vs Zhuge Liang is calm
   - E02: Lu Su anxious vs Zhuge Liang leisurely
   - E03: Lu Su is frightened vs Zhuge Liang is calm

2. **Suspense setting**: leaving suspense at the end of each episode
   - E01: How to complete a military order?
   - E02: No movement, can it really happen?
   - E03: The straw boat is approaching Cao Ying, how can I borrow arrows?

3. **Climax progression**: The tension increases episode by episode.
   - E03 Departing in heavy fog → E04 Thousands of arrows fired → E05 Returning with a full load

### Key points for expressing the ink style

1. **Color Control**: Mainly black, white and gray, embellished with character representative colors
2. **Smooth lines**: Emphasis on ink blooming and ink gradient effects
3. **Blank space in composition**: Appropriate white space to create artistic conception
4. **Dynamic effects**: arrow flight, mist flow, ink special effects

---

## Later suggestions

### Add subtitles
- Add subtitles at key points in each episode (such as [Subtitles: xxx] marked in the script)
- It is recommended to use calligraphy fonts to enhance the ink style

### Sound Design
- Guqin/Guzheng soundtrack
- The sound of beating drums, arrows piercing the air, and the sound of river water
- dialogue dubbing (professional dubbing actors recommended)

### Opening and ending
- Title: Ink calligraphy animation of the book title "The Straw Boat Borrowing Arrows"
- Ending: Production team/LOGO, with "End of the play"

---

## Summary of project parameters

| Parameter | Value |
|------|-----|
| Visual style | Chinese ink style |
| Number of episodes | 5 episodes |
| Single episode duration | 15 seconds |
| Total duration | About 75 seconds |
| Aspect ratio | 16:9 landscape |
| Emotional tone | Intelligent and refreshing drama |
| Core meme | Crush by wit |

---

*Wish you good luck with your production! If you have any questions, please refer to `docs/scripts and storyboards.md` or Seedance 2.0 official manual. *