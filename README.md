# Dropping the scrollytelling into a WordPress page

The piece is in `scrollytelling4.html`. You have two ways to embed it.

## Option A — Inline paste (recommended for most cases)

Everything in the story's CSS is scoped under `.sbs-root`, so the styles
will not leak into your WordPress theme or collide with other content.

1. In the WP editor, add a **Custom HTML** block where you want the piece.
2. Open `scrollytelling4.html` in a text editor.
3. Copy the entire `<style>...</style>` block from the `<head>` and paste it
   into the Custom HTML block.
4. Copy everything from `<div class="sbs-root">` through `</div><!-- /.sbs-root -->`
   and paste it below the `<style>` block.
5. Copy the entire `<script>...</script>` block and paste it below the markup.

You can have other WP content (paragraphs, headings, images) before and
after the Custom HTML block — the scrollytelling will sit inline and the
sticky animation will work against the main page scroll.

**Gotcha**: `position: sticky` silently fails if any ancestor has
`overflow: hidden` or `overflow-x: hidden`. Some WP themes wrap the main
content area this way. If the sticky stage doesn't pin, either (a) switch
to the iframe option below, or (b) ask your theme's dev to remove overflow
clipping from the main content wrapper.

## Option B — Iframe embed (strongest isolation)

Host `scrollytelling4.html` as a standalone file on your site (e.g. via
SFTP to `/wp-content/uploads/`, or inside your theme). Then embed it:

```html
<iframe
  src="/wp-content/uploads/scrollytelling4.html"
  style="width:100%; height:100vh; min-height:700px; border:0; display:block;"
  loading="lazy"
  title="Montgomery County matching funds explainer">
</iframe>
```

Notes:
- `height: 100vh` makes the iframe its own scroll context — sticky always
  works.
- The user scrolls *inside* the iframe to advance the story. Once the
  combined view locks in, there's no more dead scroll space inside.
- For the iframe to occupy the whole visible area of the embed, set
  `height: 100vh`. If you want a fixed pixel height, set e.g. `700px`, but
  know that short iframes can make the intro/outro feel cramped.

## Local preview

Double-click `open-scrollytelling.command` in Finder. It starts a tiny
Python web server on port 8765 and opens the page in your default browser.
Close the Terminal window to stop the server.

Opening the raw file via `file://` sometimes triggers a browser timing
quirk where the SVG's panel bounding boxes are measured before fonts load
— which can zoom the camera into the wrong region. The launcher avoids
that entirely by serving over `http://localhost`.

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
so you'll still see the desktop layout. See the comment block at the end
of `<style>` for turning on container-query responsive.

## Color key

- **Blue** (`#1f6fff`) — donations from the public
- **Dark yellow / goldenrod** (`#c9a227`) — county matching funds
- **Green** (`#0a8f3c`) — totals, "what the candidate gets" (money = blue + yellow = green)
