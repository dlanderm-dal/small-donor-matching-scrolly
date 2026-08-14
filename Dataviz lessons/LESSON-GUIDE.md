# Dataviz Lessons — the 24-lesson guide

**What this is.** You built a scrollytelling story with AI. Your professor wants you to
understand it, not just ship it. So the code has been cut into 24 lessons, ordered by how hard
they are to *understand* — not by where they sit in the file — and each one has a blank comment
for you to fill in with your own words.

**The rule that makes this work:** Claude does not write the answers. Not in the file, not in
chat as something you can paste. Claude asks questions, points you at lines, tells you when a
prediction is wrong, and explains *after* you've committed to a guess. That's deliberate — it's
the method from your professor's own `learning-opportunities` repo, which exists because reading
AI-written code feels like understanding it and isn't.

---

## How to run a lesson (about 15 minutes)

1. **Open the tracker.** Double-click `Open Lesson Tracker.command`. It opens the red→green map.
2. **Find the lesson in the code.** Open `DATAVIZFINAL-MARKUP.html` and search for `LESSON 7`
   (or whichever). The tracker also shows you the current line number.
3. **Read the questions, then look at the code around them.** Don't read the questions and
   immediately ask Claude. Read the code first, even if it's fog.
4. **Guess out loud before you check.** Say what you think the code does. Wrong guesses are the
   part that makes it stick — that's not a consolation prize, it's the mechanism.
5. **Run the experiment** if the block has a `TRY:` line. Change the number, reload, watch.
6. **Write your answer** over the underscores after `MY ANSWER:`. Plain English, your voice,
   2–5 sentences. If you can't write it without looking, you don't have it yet.
7. **Save.** The tracker turns that lesson green within 4 seconds.

**When you're stuck**, ask Claude like this:

> Lesson 12 — I don't get `Math.min(Math.max(donation - 50, 0), 50)`. Quiz me toward it,
> don't hand me the answer.

Claude should respond with a narrower question, not an explanation. If it just explains, say
"you skipped the question" and it'll correct.

---

## Why this order

Lessons are numbered by building complexity. Lesson 8 sits at line ~2987 and Lesson 16 at line
~2137 — that's intentional. Each tier assumes the one before it.

| Tier | Lessons | What you walk away able to explain |
|---|---|---|
| **A · Orientation** | 1–3 | How a 3,500-line file is organized, CSS scoping, what `id=` is for |
| **B · First JavaScript** | 4–7 | Wrapping code, storing data, holding state, reacting to a click |
| **C · The render pipeline** | 8–13 | The single idea the whole calculator runs on |
| **D · Show & hide** | 14–15 | How JS and CSS split the job between them |
| **E · Drawing with code** | 16–19 | How the bar chart gets built from nothing on every drag |
| **F · Scrollytelling** | 20–23 | The sticky trick, and turning scroll position into a step number |
| **G · Extra credit** | 24 | The nav/menu code, if you're curious |

Do them in order. Tier F is the flashiest and the one you'll be tempted to start with — it will
make far more sense after C and E.

---

## The lessons

Each entry below gives the **goal** (what you should be able to say afterward) and the
**exercise type** it's built as. The actual questions live in the file itself.

### Tier A · Orientation

**1 · The shape of this file** — *Trace the path*
Goal: point at any line and say which of the four zones it's in, and say why scripts go last.
Where: top of `<body>`, ~line 1843.

**2 · Scoping: why every rule starts with `.sbs-root`** — *Prediction → observation*
Goal: explain what a CSS prefix is protecting against when your widget is embedded in someone
else's page. Where: in the `<style>` block, ~line 328.

**3 · The widget's HTML skeleton (ids are handles)** — *Generation → comparison*
Goal: explain what an `id` is for before you've seen the JavaScript that uses it. Guess first,
then confirm in Lesson 6. Where: ~line 2050.

### Tier B · First JavaScript

**4 · The wrapper: `(function () { ... })()`** — *Elaborative interrogation*
Goal: say why four separate script blocks on one page need to be sealed off from each other.
Where: ~line 2771.

**5 · Data as a lookup table: `OFFICE_DATA`** — *Prediction → observation*
Goal: explain why every number that varies lives in one object at the top. This is the lesson
with the most rewarding experiment — change a `7` to a `20` and watch the whole page change.
Where: ~line 2782.

**6 · State and handles** — *Teach it back*
Goal: explain the difference between "the one thing that changes" (`let currentOffice`) and
"the fixed set of things I'm going to poke at" (all those `const` element lookups).
Where: ~line 2817.

**7 · Your first event: the office buttons** — *Trace the path*
Goal: narrate a single click from finger to screen update, naming each line it passes through.
Where: ~line 2835.

### Tier C · The render pipeline

**8 · One render function: the big idea** — *Teach it back*
Goal: explain the pattern "nothing updates the page directly; everything changes the state and
re-renders." **This is the most important lesson in the project.** If you only truly learn one
thing, make it this one. Where: ~line 2987.

**9 · The slider: an `input` event** — *Prediction → observation*
Goal: say where the new value comes from, given it isn't handed to the function. Where: ~line 2851.

**10 · Two-way sync and the `inputFocused` flag** — *Debug this*
Goal: describe the bug that flag exists to prevent — two controls fighting over one number.
Where: ~line 2867.

**11 · Never trust typed input** — *Debug this*
Goal: list what a user could type to break this, and point at the line that catches each.
Where: ~line 2892.

**12 · The actual math: `tierBreakdown()`** — *Generation → comparison*
Goal: work $180 out on paper first, then read the code and see whether you'd have written it
the same way. Where: ~line 2926.

**13 · Turning numbers into readable text** — *Example-problem pairs*
Goal: give an input and output for each of the three helpers, and explain the tabular-figures
problem `tnum` solves. Where: ~line 2958.

### Tier D · Show & hide

**14 · Showing and hiding rows with a class** — *Trace the path*
Goal: explain `classList.toggle(name, condition)` and the `textContent` vs `innerHTML`
difference. Where: ~line 3019.

**15 · The CSS half of show/hide** — *Prediction → observation*
Goal: explain the division of labor — JS flips a class, CSS does the animating. Slow the
transition to 3s and watch it. Where: ~line 848.

### Tier E · Drawing with code

**16 · SVG by hand: the chart's fixed furniture** — *Prediction → observation*
Goal: explain `viewBox` and why SVG's y-axis increases downward. Where: ~line 2137.

**17 · Wipe and redraw + the coordinate system** — *Elaborative interrogation*
Goal: explain "throw it all away and rebuild" as a strategy, and what `620/500` means.
Where: ~line 3066.

**18 · Building elements from scratch** — *Generation → comparison*
Goal: explain why SVG needs `createElementNS`, and what work the two helper functions save.
Where: ~line 3084.

**19 · The tier loop and its escape hatches** — *Debug this*
Goal: explain what bar *height* encodes (it isn't dollars), and find all three
"only draw the label if it fits" guards. Where: ~line 3119.

### Tier F · Scrollytelling

**20 · The sticky trick** — *Prediction → observation*
Goal: explain in one sentence why a tall track plus a sticky stage makes a graphic appear to
freeze. This is CSS only — no JavaScript involved. Where: ~line 1128.

**21 · Steps as data: tagging the scenes** — *Trace the path*
Goal: explain what gets added to the artwork's groups and why the code doesn't just use the
`Scene_1A` names directly. Where: ~line 3216.

**22 · Scroll position → progress → step number** — *Trace the path*
Goal: run the arithmetic by hand with the numbers given, and get the same answer the code does.
Where: ~line 3261.

**23 · Doing less work: dirty checks and rAF** — *Debug this*
Goal: name the two separate mechanisms preventing wasted work, and say what each prevents.
Where: ~line 3312.

### Tier G · Accessibility

**25 · Who is this page for? The accessibility layer** — *Trace the path*
Numbered last only because it was added later; it's plain HTML, so do it any time after
Lesson 3. Goal: explain the two separate jobs — *describing* the widget to someone who can't
see it (`role`, `aria-label`, `aria-hidden`, `sr-only`) and *announcing* that numbers changed
after the page was already read aloud (`aria-live`, `aria-atomic`). The second is the one worth
understanding: a screen reader reads a page once, and your slider rewrites the page afterward.
Where: the widget's opening div, ~line 2052.

### Tier H · Extra credit

**24 · Site chrome** — *Teach it back*
Optional. Pick one behavior (search, drawer, progress bar, back-to-top) and explain it end to
end. Where: ~line 3408.

---

## If you break something

The pristine pre-annotation copy is at `originals/DATAVIZFINAL MARKUP.original.html`. The
published story (`index.html`) is untouched and also in git history, so nothing you do here can
damage what's live.

Quick sanity check that the page still works: load
`http://localhost:8773/DATAVIZFINAL-MARKUP.html`, drag the slider to **$180**. County
Executive should read **$830**; At-Large should read **$680**. If the numbers don't move at all,
you probably broke a comment — a stray `*/` or `-->` in the middle of a code block will do it.
