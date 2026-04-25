# Claude handoff — V3 state

## Where things stand (V3.7)

The Montgomery County small-donor-matching scrollytelling lives in
`scrollytelling-v3.html`. V3 is a refactored mobile-portrait layout that
replaces V2's 4-layer transform cascade with single-layer absolute viewBox
coords for every named element.

Live at: <https://dlanderm-dal.github.io/small-donor-matching-scrolly/scrollytelling-v3.html>
(append `?v=3.7` to bust browser cache)

### What works
- **Scenes 1-5 mobile portrait V3 layouts** — heading, charts, equation
  overlays all rendering with explicit absolute viewBox coords.
- **Scene 6 mobile portrait V3 layout** — top row + multiplication +
  final comparison visible; per-donor breakdown row hidden (per V2.16
  pattern). Many minor scene-6 elements explicitly hidden via V3 dict.
- **Desktop landscape unchanged** — V3 only affects mobile (≤ 768px).
- **V2 cascade preserved as fallback** — if a scene lacks a V3 entry,
  V2 SCENE*_*_IDS shifts still run.
- **Viewer.html** — auto-concern detector with 8 rules. Catches:
  - text overflow past box
  - element outside viewBox
  - off-center chart bars
  - empty bottom space
  - overlapping text
  - cropped past screen edge
  - foreignObject overlap (FO-vs-FO)
  - foreignObject overlap (FO-vs-named-rect)
  - heading-overlaps-content

### Known issues / what's still rough
- **User reported scene 1-5 still broken on iPhone** at V3.6. I haven't
  reproduced this on my preview MCP at 393×852. Possible causes:
  - Real iOS Safari URL bar dynamics (resizes viewport mid-scroll)
  - Font fallback (Helvetica Neue not installed on iOS, fallback uses
    different widths)
  - DPR / sub-pixel rendering quirks
  - A specific scroll position/sub-scene I'm not testing
  Next session should: (1) ask user for a fresh iPhone screenshot of
  V3.7 with the version badge visible, and (2) add a viewer rule for
  detecting whatever the next failure mode is.
- **Scene 6 V3 layout is minimal** — I positioned top row, multiplication,
  and final comparison but didn't pixel-tune all sub-elements. The
  scene-6 has ~60 named elements and many opacity-toggled labels. Some
  may render at unexpected positions because they weren't in the V3
  dict (and thus stay at desktop XD coords).
- **Heading first line hidden by palette toggle** in preview at <768px
  width when palette toggle wraps to multi-line. Fixed in V3.6 by
  making palette `position: static` on mobile so it scrolls with the
  page. Production WP doesn't have palette toggle anyway.
- **eqOverlay positioning** — uses CSS `transform: translate(Xpx, Ypx)`
  where px is interpreted as user units (viewBox units) due to
  `transform-box: fill-box`. Works but is non-obvious.

## Architecture cheat sheet

### Transform cascade (V2, still in place for desktop and as V3 fallback)
```
Effective mobile viewBox y = element_local_y + scene_baseTransform_y + sceneStack_mobile_shift
e.g. Rectangle_61 (scene 2) at scene-local y=1312 → viewBox y = 1312 + (-727) + 400 = 985
```

### V3 layout (single-layer absolute coords)
`MOBILE_LAYOUTS_V3[sceneId][elementId] = { x, y, scale?, textAnchor?, fontSize?, hide? }`

`x`/`y` are **absolute viewBox coords**. `applyV3LayoutForScene` computes
each element's scene-local transform that produces the desired absolute
position after the cascade applies. So V3 dict stays simple even though
runtime cascade is still in effect.

### Y-band convention (V3.6+)
| Band | viewBox y | Used by |
|---|---|---|
| Heading | 40–340 (in headingFo) | All scenes (text via headingOverlayG) |
| Aux content (scene 2 only) | 466–600 | Scene 2 prohibited list |
| Box-equation (scene 1 only) | 660–820 | Scene 1 $50+$350=$400 boxes |
| Chart band | 850–1410 | Scenes 1-5 bars + axes |
| Axis tick labels | 1455–1505 | Below x-axis |
| Equation overlay | 1550+ | Scenes 2-5 running equation rows |
| Empty / bottom margin | 1850–2050 | Scenes 1-5 |
| Scene 6 layout | 180–1450 | Different — comparison view |

## How to verify changes (the "multi-method" workflow)

When fixing a layout bug, use ALL of these in sequence (they catch
different things):

1. **viewer.html** at desktop width → click scene tabs, confirm 0 concerns
2. **preview MCP** at 375×812 (or 393×852 for iPhone) → take screenshots
3. **getBoundingClientRect on key elements** → numerical verification of
   bbox positions
4. **Cross-reference**: if screenshot shows overlap but bbox math says
   "no overlap", that disagreement IS the diagnosis (check ancestor
   opacity, foreignObject overflow, etc.)

## Files

- `scrollytelling-v3.html` — main page (V3 mobile, V2 desktop)
- `scrollytelling-v2.html` — frozen V2 reference
- `viewer.html` — auto-concern audit tool
- `live-snapshot.html` — element bbox dumper
- `editor.html` — design-review tool (uses hand-drawn mocks; out of date
  vs V3 truth, but useful for design intent)
- `audit.html` — older content-audit tool
- `mockup.html` — single composed view of audit decisions
- `portrait-elements/*.svg` — standalone SVG backups for Adobe XD

## What to do first in the next session

1. **Get a fresh screenshot from David** of V3.7 on iPhone (with version
   badge visible to confirm cache).
2. **Extract specific bug list** from that screenshot — don't guess.
3. **Use multi-method workflow** to verify each bug (don't trust
   screenshots alone, don't trust bboxes alone).
4. **Add a viewer rule** for each bug category caught.
5. **Fix in V3 dict** — usually a single y/x value per element.
6. **Push, ask David to verify**, iterate.

## Known V3 dict structure

Search for `const MOBILE_LAYOUTS_V3` in `scrollytelling-v3.html`. Per-scene
entries by sceneId ('1' through '6'). Each entry is `{elementId: spec}`.
Spec fields:
- `x`, `y` — absolute viewBox coords
- `scale` — for `<g>` groups containing `<rect>` children (chart bars)
- `textAnchor` — 'middle' / 'start' / 'end'
- `fontSize` — viewBox units
- `hide: true` — sets `display: none`

## V3 version log (most recent first)

- V3.7: scene 6 V3 layout added (minimal — top row + multiplication +
  comparison; per-donor row hidden; equation table elements hidden).
- V3.6: inner-bar label y values fixed (`_250-10` etc. were at top of
  bar, moved to center of match section); palette toggle made
  non-sticky on mobile so heading first line not hidden.
- V3.5: chart band moved from y=700 (V3.4 overshot, overlapped list) to
  y=850; eqOverlay moved to y=1550.
- V3.4: chart band moved up 300 units to close empty gap (later
  reverted in V3.5 — overshot).
- V3.3: scene 2 prohibited list y fixed (was 550 / overlapping heading,
  now 793 / clean band).
- V3.2: eqOverlay positioned below V3 chart band (was overlapping chart
  axis labels).
- V3.1: chart layouts for scenes 2-5 + viewer hardening (calibrated
  scroll fractions, ancestor-opacity visibility check).
- V3.0: scene 1 V3 proof-of-concept; viewer.html with 6 concern rules.
