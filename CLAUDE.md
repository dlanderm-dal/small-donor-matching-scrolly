# small-donor-matching-scrolly — published CNS story + a lessons project built on top of it

Two things live in this folder:

1. **The published story** — a scrollytelling piece on Montgomery County's small-donor
   matching program, published to cnsmaryland.org (`index.html`).
2. **"Dataviz lessons"** — David is learning to explain the code he built with AI, by
   writing his own comments into an annotated copy of the story. This is coursework.

## How to run it
- Double-click **`Dataviz lessons/Open Lesson Tracker.command`** — starts a local server
  and opens the red→green progress map.
- Story: <http://localhost:8773/index.html> · Annotated copy:
  <http://localhost:8773/DATAVIZFINAL%20MARKUP.html> · Tracker:
  <http://localhost:8773/Dataviz%20lessons/LESSON-MAP.html>
- Stop the server by closing the Terminal window it opened.

## Key files
- `index.html` — the published story. **Do not touch** for lessons work.
- `posted_story.html`, `story.html`, `LEGACYindex.html` — older/parallel copies of the same story.
- `DATAVIZFINAL MARKUP.html` — the annotation target. Byte-identical to `index.html` except
  for 24 `LESSON n` comment blocks. This is the file David writes his comments into.
- `Dataviz lessons/LESSON-GUIDE.md` — the 24 lessons, in complexity order, questions only.
- `Dataviz lessons/LESSON-MAP.html` — live progress map; parses the markup file, no manual upkeep.
- `Dataviz lessons/PROGRESS.md` — the log. **Read this at session start.**
- `Dataviz lessons/originals/` — pristine pre-annotation copy, for diffing.
- `.claude/skills/learning-opportunities/` — Dr. Cat Hicks' teaching skill (CC-BY-4.0),
  vendored from github.com/DrCatHicks/learning-opportunities. Its rules govern this work.

## Operational notes
- **The whole point is that David writes the comments, not Claude.** His professor knows AI
  built the story and wants him to prove he understands it. Writing an explanation *for* him
  defeats the assignment and is the one way to actually fail him.
- Teaching rules, non-negotiable (from the vendored skill):
  - Ask a question, then **stop the message**. No hints, no "think about…", no example answers.
  - Send him to the file to find things rather than pasting code at him.
  - Wrong predictions are the valuable part — say plainly when he's wrong, then dig in.
  - If he's stuck, make the *question* more specific; never leak the answer.
  - Max 2 exercises per session; ~10–15 min each. Always ask before starting one.
- Start a returning session with a **retrieval check-in**: "What do you remember about how
  [last lesson's thing] works?" — then wait.
- Lesson order is by building complexity, not file order, so lesson numbers do not run in
  line-number order. The tracker sorts them correctly.
- Verify any edit to the markup file by loading it and dragging the slider: at $180,
  County Executive should read **$830**, At-Large **$680**.

## ▶︎ YOU ARE HERE  (read at session start, rewritten at session end)
- **Goal right now:** David works through Lessons 1→24, writing his own explanation into each
  `MY ANSWER:` blank in `DATAVIZFINAL MARKUP.html`.
- **Done + verified:** All 24 placeholders inserted; page still runs clean (no console errors,
  slider math correct, 70 scrolly elements tagged). Tracker verified against real edits —
  red / amber / green all fire correctly. Backup saved to `Dataviz lessons/originals/`.
- **Next step:** Lesson 1. He reads the questions in the file (or the tracker card), writes his
  answer over the underscores, saves. Claude's job is to quiz, not to answer.
- **Watch out for:** Don't let him paste a Claude-written explanation into a blank. If he asks
  "just tell me," give him a narrower question instead.
- *Lineage: first anchor for this project — 2026-08-11. Nothing superseded.*
