# Progress log

Newest entry at the top. One entry per working session — three lines is plenty.

**For Claude:** read this at the start of every session, then open with a *retrieval check-in*
about the most recent lesson before doing anything else. Add an entry at the end of the session.
Live red/amber/green status is not tracked here — the tracker page reads the real file, so
trust it over this log. This log is for the things a file can't tell you: what confused him,
what he got wrong, what's worth circling back to.

---

## Template

```
### YYYY-MM-DD · Lessons N–M
- **Wrote:** which lessons went green
- **Got wrong first / had to work at:** (the useful part — this is what to re-quiz later)
- **Still shaky:** what to come back to
- **Next:** the exact lesson to start with next time
```

---

### 2026-08-12 · Lessons 1–3 + Lesson 25 added
- **Wrote:** DL NOTE 1, 2, 3. **3 of 25 green.**
- **His system, adopt it:** he does NOT fill in the `MY ANSWER:` blank — he *overwrites* the whole
  `LESSON n` block with his own `DL NOTE n` comment, so his professor (Jon) can Cmd-F "DL NOTE"
  and see only David's writing. There's a note to Jon at line 3 explaining this. The tracker was
  rewritten to match: green = the LESSON block has been replaced by a DL NOTE.
- **Got wrong first / worth re-quizzing:**
  - L1: predicted correctly that a script in the `<head>` breaks — "you need to create a space
    before you fill it." Confirmed by experiment (`Cannot read properties of null`).
  - L2: he had the right instinct (the prefix stops the page overriding the widget) — **and my
    framing of the question was wrong.** I expected unscoping `*` to collapse the page. Tested it:
    0 of 281 elements outside the widget change, 1 of 191 inside changes (16px). Reason: `*` has
    zero specificity and loses to Bootstrap/template element rules; `.sbs-root *` (0,1,0) beats
    `p` (0,0,1). Don't repeat the textbook claim.
  - L3: nailed it — "an individual thing that needs to be targeted," with the 3 unused ids
    (`chartTicks`, `chartTickMarks`, `eqTable`) as leftovers for human readability.
- **Where he got overloaded:** stacking pseudo-elements → scoping → `!important` → specificity
  notation in one go. He said "I am completely lost." Backing off to one plain-English idea fixed
  it. **Keep to one concept at a time; drop the notation unless he asks.**
- **He asks for direct explanations** and gets frustrated by Socratic loops on *syntax* (what `*`,
  `::before`, `li`, `<g>` mean). Give syntax straight; keep Socratic for "what does this code do
  and why." He stated this explicitly.
- **Added at his request:** Lesson 25 (accessibility / ARIA), placed at the widget's opening div
  ~line 2052, its own tier in the tracker. Also pinned his own question — what swaps the $870,170
  at line 2267 — into the Lesson 8 block.
- **Open:** DL NOTE 2 describes what the selector targets but not the *why* he established by
  testing; DL NOTE 3 says ids are "in addition to classes" but 9 id-ed elements have no class.
  Both flagged to him; his call.
- **Next:** Lesson 4 — the `(function () { ... })()` wrapper, ~line 2769.

### 2026-08-11 · Setup (no lessons done yet)
- **Wrote:** nothing yet — all 24 blanks are empty and red.
- **Built this session:** 24 `LESSON n` placeholders inserted into `DATAVIZFINAL-MARKUP.html`;
  lesson guide, live tracker page, and `.command` launcher created; the professor's
  `learning-opportunities` skill vendored into `.claude/skills/` so its rules apply automatically.
- **Verified:** annotated page runs with no console errors; slider math correct ($180 → $830
  Executive, $680 At-Large); tracker's red→amber→green detection tested against real edits and
  then reverted.
- **Next:** Lesson 1 — "The shape of this file", top of `<body>`, ~line 1843.
