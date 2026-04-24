# Dropping the scrollytelling into a WordPress page

Two versions of the piece live in this repo:

- **V2 — `index.html` (recommended).** The current design: 6 scenes
  with dissolve transitions, a slide-up to the comparison scene, and an
  interactive after-scrolly section with an office selector, a draggable
  donation slider, and a tiered match calculator. Same file is also at
  `scrollytelling-v2.html` so the V2 link is stable.
- **V1 — `scrollytelling4.html` (legacy).** The original two-panel
  scrolly. Kept for reference. Use V2 for new embeds.

Each file opens in a browser as a self-contained preview: lorem-ipsum
article paragraphs sit above and below the graphic so you can see
roughly how it will feel once embedded.

**The lorem-ipsum paragraphs are PREVIEW-ONLY. Do not paste them into
WordPress.** Your WP post already has its own article body around the
graphic.

You have two ways to embed — inline paste (recommended) or iframe.

---

## Option A — Inline paste (recommended for most cases)

You will copy three things from `index.html` (the V2 file) into one WP
**Custom HTML** block, in this order: **styles → markup → script**.

### 1 · The CSS (styles)

Open `index.html`. Inside `<head>` you'll see a `<style>…</style>`
block. Near the top of that block there is a short rule set labeled
`PREVIEW-ONLY styling` — **skip those rules** (they only style the
lorem-ipsum preview and the page background; your WP theme already
styles paragraphs and the page).

Copy **everything else** inside `<style>…</style>`: that's all the
rules scoped under `.sbs-root`, including the `@media` responsive rules
at the bottom.

Paste into the Custom HTML block, wrapped in your own `<style>…</style>`
tags.

### 2 · The markup (graphic)

Inside the `<body>` you'll find two matching boundary comments:

```html
<!-- WORDPRESS DROP-IN BEGIN ↓ ... -->
<div class="sbs-root">
  …
</div><!-- /.sbs-root -->
<!-- WORDPRESS DROP-IN END ↑ ... -->
```

Copy **everything from `<div class="sbs-root">` through the matching
closing `</div>`**. Don't include the `<section class="article-body-preview">`
blocks that sit outside those markers — those are the lorem-ipsum
preview paragraphs.

Paste into the Custom HTML block below the `<style>` you pasted in
step 1.

### 3 · The JavaScript

At the bottom of the file there's one `<script>…</script>` block. Copy
the whole thing (including the `<script>` tags) and paste below the
markup in the Custom HTML block.

That's it — save the WP post. You can put normal WP paragraphs,
headings, images, pull quotes, etc. **before and after** the Custom HTML
block; the scrollytelling graphic sits inline and its sticky animation
runs against the main page scroll.

### Gotcha: `position: sticky` and `overflow: hidden`

`position: sticky` silently fails if any ancestor element (WP content
wrapper, theme column, etc.) has `overflow: hidden` or
`overflow-x: hidden`. Many WP themes wrap the main content that way.

If the sticky stage doesn't pin as expected:

- switch to **Option B** (iframe), or
- ask the theme dev to remove the overflow clipping on the main content
  wrapper, or
- add a high-specificity override:
  `.sbs-root, .sbs-root * { overflow: visible }` (this can affect other
  content inside, so test).

---

## Option B — Iframe embed (strongest isolation)

Host `index.html` (or `scrollytelling-v2.html`) as a standalone file on
your site — e.g. upload it by SFTP to `/wp-content/uploads/`, or place
it inside your theme directory. Then embed:

```html
<iframe
  src="/wp-content/uploads/scrollytelling-v2.html"
  style="width:100%; height:100vh; min-height:700px; border:0; display:block;"
  loading="lazy"
  title="Montgomery County matching funds explainer">
</iframe>
```

Notes:

- `height: 100vh` makes the iframe its own scroll context — sticky
  always works because overflow-clipping on the WP outer page can't
  reach inside.
- The reader scrolls **inside** the iframe to advance the story. Once
  they reach the after-scrolly interactive panel, no more story scroll
  remains — they can use the slider and the **Restart Scrollytelling**
  button to revisit the story.
- If you want the iframe to NOT show the preview lorem ipsum, make a
  copy of the file and delete the two
  `<section class="article-body-preview">…</section>` blocks before
  uploading.

---

## What's new in V2

- **Six scenes**, not two panels. Scenes 1–5 cross-fade in the same
  physical region (the chart morphs from a $50 donation example
  through tiered matching, prohibited contributions, and the $150 cap).
  Scene 6 slides up from below as the comparison scene
  ("$650 from one $100 donor vs $800 from ten $10 donors").
- **New color grammar**: green = donor money, blue = county match,
  purple = total to candidate, red = NOT MATCHED / prohibited.
- **Interactive after-scrolly panel**:
  - 3-segment **office selector** (County Executive / Council – At Large
    / Council – District). Updates the heading bracketed values, the
    bar-chart heights, the equation totals, and the max-per-election
    figure.
  - **Donation slider** ($0–$500). Equation rows populate as the donor
    crosses each tier. Bar chart heights and totals recompute live.
  - **Restart Scrollytelling button**: scrolls the reader back into the
    scrollytelling at the conclusion scene; they can scroll up to
    retraverse the story (no page reload).

V1 is still here at `scrollytelling4.html` for reference.

---

## Local preview

Double-click `open-scrollytelling.command` in Finder (in the source
folder, not in this repo). It starts a tiny Python web server on port
8765 and opens the page in your default browser. Close the Terminal
window to stop the server.

Opening the raw file via `file://` sometimes triggers a browser timing
quirk where the SVG measurements happen before fonts load — which can
zoom the camera into the wrong region. The launcher avoids that by
serving over `http://localhost`.

---

## Color key (V2)

- **Green** (`#229500`) — the donor's contribution
- **Blue** (`#0027ff`) — county matching funds
- **Purple** (`#7600ff`) — total / what the candidate ends up with
- **Orange / yellow** (`#ffb202` / `#ffb100`) — info / callouts /
  recap-row strokes
- **Red** — prohibited contributions, NOT MATCHED segments
- **Cyan (`#00f5ff`)** — design-time alignment markers; not rendered in
  the final piece
