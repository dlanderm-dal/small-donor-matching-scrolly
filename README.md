# Dropping the scrollytelling into a WordPress page

The piece is in `scrollytelling4.html`. That file opens in a browser as a
self-contained preview: lorem-ipsum article paragraphs sit above and below
the graphic so you can see roughly how it will feel once embedded.

**The lorem-ipsum paragraphs are PREVIEW-ONLY. Do not paste them into
WordPress.** Your WP post already has its own article body around the
graphic.

You have two ways to embed — inline paste (recommended) or iframe.

---

## Option A — Inline paste (recommended for most cases)

You will copy three things from `scrollytelling4.html` into one WP
**Custom HTML** block, in this order: **styles → markup → script**.

### 1 · The CSS (styles)

Open `scrollytelling4.html`. Inside `<head>` you'll see a `<style>…</style>`
block. Near the top of that block there is a short rule set labeled
`PREVIEW-ONLY article-body styling` — **skip those rules** (they only
style the lorem ipsum preview; your WP theme already styles paragraphs).

Copy **everything else** inside `<style>…</style>`: that's all the rules
scoped under `.sbs-root` plus the `@media` responsive rules and the
commented container-query block at the bottom.

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
`</div><!-- /.sbs-root -->`** (the comments above/below the block mark
the boundary — don't include the lorem-ipsum
`<section class="article-body-preview">` blocks that sit outside those
markers).

Paste into the Custom HTML block below the `<style>` you pasted in step 1.

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

Host `scrollytelling4.html` as a standalone file on your site — e.g.
upload it by SFTP to `/wp-content/uploads/`, or place it inside your
theme directory. Then embed:

```html
<iframe
  src="/wp-content/uploads/scrollytelling4.html"
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
  the combined view locks in, there's no more dead scroll space inside.
- If you want the iframe to NOT show the preview lorem ipsum, make a
  copy of `scrollytelling4.html` and delete the two
  `<section class="article-body-preview">…</section>` blocks before
  uploading.

---

## Local preview

Double-click `open-scrollytelling.command` in Finder. It starts a tiny
Python web server on port 8765 and opens the page in your default
browser. Close the Terminal window to stop the server.

Opening the raw file via `file://` sometimes triggers a browser timing
quirk where the SVG's panel bounding boxes are measured before fonts
load — which can zoom the camera into the wrong region. The launcher
avoids that entirely by serving over `http://localhost`.

---

## Responsive behavior

- At window widths **> 768px** you get the desktop layout: the 3-option
  slot selector + yellow info boxes live inside the SVG.
- At window widths **≤ 768px** the SVG still shows but full-width HTML
  controls appear below it (a segmented selector + three colored info
  cards).
- Resize your desktop browser window down to phone width to see the
  mobile layout without leaving your computer.

If the piece is embedded in a **narrow WP content column** on a desktop
browser, the `@media` rule keys off *window* width, not container width,
so you'll still see the desktop layout. See the commented block at the
end of `<style>` for turning on container-query responsive.

---

## Color key

- **Blue** (`#1f6fff`) — donations from the public
- **Dark yellow / goldenrod** (`#c9a227`) — county matching funds
- **Green** (`#0a8f3c`) — totals, "what the candidate gets" (money = blue + yellow = green)
- **Red** (`#d92b2b`) — prohibited contributions
