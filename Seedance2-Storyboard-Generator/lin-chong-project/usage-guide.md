# Lin Jiaotou Fengxueshan Temple - Production Overview

## 📦 Generate file list

| File name | Content | Purpose |
|--------|------|------|
| `Lin Jiaotou Fengxueshan Temple_Script.md` | Complete script structure | Understand the overall story and emotional arc |
| `Lin Jiaotou Fengxue Mountain Temple_material list.md` | Character scene props drawing prompt | Generate visual materials |
| `Lin Jiaotou Fengxue Mountain Temple_E01_ storyboard.md` | Episode 1 storyboard script | Seedance 2.0 generated video |
| `Lin Jiaotou Fengxue Mountain Temple_E02_ storyboard.md` | Episode 2 storyboard script | Seedance 2.0 generated video |
| `Lin Jiaotou Fengxue Mountain Temple_E03_ storyboard.md` | Episode 3 storyboard script | Seedance 2.0 generated video |
| `Lin Jiaotou Fengxue Mountain Temple_E04_ storyboard.md` | Episode 4 storyboard script | Seedance 2.0 generated video |
| `Lin Jiaotou Fengxue Mountain Temple_E05_ storyboard.md` | Episode 5 storyboard script | Seedance 2.0 generated video |

---

## 🎬 Production process

### Step 1: Generate visual material

1. Open `Lin Jiaotou Fengxueshan Temple_Material List.md`
2. Copy the English prompt of each material in numerical order
3. Paste into an image generation tool (such as Nana Banana Pro)
4. Generate size selection: **9:16 vertical screen**
5. Use banana.ovo.re to remove watermark after generation
6. Rename and save by number (such as C01.png, S01.jpg, etc.)

**Total number of materials:** 18 (7 characters + 6 scenes + 5 props)

### Step 2: Generate video

#### Episode 1 (newly generated)
1. Enter the Seedance 2.0 platform and select **All-round Reference Mode**
2. Press the "Material Upload List" in the E01 storyboard to upload the corresponding materials.
3. Copy the Seedance Prompt content of E01
4. Paste into the input box
5. Select duration: **15 seconds**
6. Click Generate

#### Episodes 2-5 (extended using video)
1. Enter Seedance 2.0 and select **All-round reference mode**
2. Upload the picture materials required for this episode
3. **Key:** Upload the video file generated from the previous episode (as @video_file_1)
4. Copy the Seedance Prompt of this episode (already includes the `Extend @video_file_1 by 15s` command)
5. Paste, select 15 seconds, generate

---

## 📋 Material citation cheat sheet

| number | name | for set number |
|------|------|----------|
| C01 | Lin Chong full body front | E1, E2 |
| C02 | The back view of Lin Chong in a raincoat | E1, E2 |
| C03 | Lin Chong holds a gun and glares | E4, E5 |
| C04 | Drinking in Lin Chong Temple | E3, E4 |
| C05 | Lu Qian’s cunning close-up | E4 |
| C06 | Lu Qian's full body portrait | E5 |
| C07 | Masked thug | E5 |
| S01 | Snow scene in the fodder yard | E1 |
| S02 | After the fodder yard collapsed | E2 |
| S03 | Mountain Temple Appearance | E2, E3 |
| S04 | Interior view of the mountain temple | E3, E4 |
| S05 | Snowy Mountain Road | E5 |
| S06 | Snow fighting arena | E5 |
| P01 | Long gun | E1, E5 |
| P02 | Wine Gourd | E3 |
| P03 | Torch | E4 |
| P04 | coir raincoat | E1, E2 |
| P05 | Ancient temple wooden door | E3, E4 |

---

## 🔗 Video chain generation instructions

Seedance 2.0’s video extension feature allows episodes to flow naturally:

```
E01 (newly generated)
    ↓
E02 (extended E1) — Upload E01 video as @video_file_1
    ↓
E03 (extended E2) — upload E02 videos as @video_file_1
    ↓
E04 (Extended E3) — Upload E03 video as @video_file_1
    ↓
E05 (extended E4) — upload E04 videos as @video_file_1
```

Each episode will use the ending scene of the previous episode as a starting point to achieve seamless connection.

---

## ⚠️ Notes

1. **Sensitive word avoidance**: Avoid using words that may be blocked by the platform
2. **Material number is consistent**: Make sure the uploaded material corresponds to the @reference number in the script
3. **Style Unification**: All materials use the same ink martial arts style prefix
4. **Remove watermark**: Be sure to remove the watermark after the image is generated.
5. **Multiple attempts**: AI generation is random. If you are not satisfied, you can regenerate it.

---

## 🎨 Emotional arc

```
E1 loneliness and depression → E2 uncertainty → E3 calm before the storm
                                     ↓
E5 Explosion of Heroic ← E4 Shock and Anger
```

Color changes: gray-white → gray-blue → warm yellow (inner)/grey-blue (outer) → dark red/black → bright red/pure white

---

## 📞Need to modify

If you need to adjust the script style, increase the number of episodes, modify the visual style, etc., please provide specific requirements and the corresponding files can be regenerated.