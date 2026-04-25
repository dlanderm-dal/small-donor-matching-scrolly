# Portrait elements — Adobe XD backup

Standalone SVG copies of every movable element used by the canvas editor at
`/editor.html`. Open any of these in Adobe XD (or Figma / Illustrator /
Affinity Designer) to manipulate them as a fallback if the live editor
isn't enough.

Each SVG is a self-contained file at the element's native dimensions
(matching its `bbox` in the editor). Coordinates start at (0, 0). Fonts
use Source Serif 4 / JetBrains Mono with Georgia / monospace fallbacks
in case the host machine doesn't have the primary fonts installed.

`<foreignObject>` was avoided — XD doesn't render it. All text is native
SVG `<text>` with manual line wrapping so the files import cleanly.

## File index

| File | Element | Scene | Bbox |
|---|---|---|---|
| scene-1-heading.svg | "Montgomery County Public Campaign Financing Example" + lede | 1 | 1160 × 460 |
| scene-1-boxDiagram.svg | $50 + $350 = $400 boxes diagram | 1 | 953 × 320 |
| scene-1-barChart.svg | Vertical bar chart | 1 | 360 × 480 |
| scene-2-heading.svg | "The county only matches money…" | 2 | 1160 × 380 |
| scene-2-prohibitedList.svg | Prohibited donor list with red × markers | 2 | 1160 × 460 |
| scene-2-barChart.svg | Single-column chart | 2 | 360 × 480 |
| scene-2-equation.svg | Tier 1 equation row | 2 | 800 × 80 |
| scene-3-heading.svg | "The state board keeps a running total…" | 3 | 1160 × 380 |
| scene-3-barChart.svg | Tier 1 + Tier 2 bar chart | 3 | 480 × 480 |
| scene-3-equation.svg | Tier 1 / Tier 2 / Total equation | 3 | 800 × 220 |
| scene-4-heading.svg | Same as scene-3 heading | 4 | 1160 × 380 |
| scene-4-barChart.svg | Tier 1 + Tier 2 + Tier 3 chart | 4 | 600 × 510 |
| scene-4-equation.svg | Tier 1-3 + Total equation | 4 | 800 × 280 |
| scene-5-heading.svg | "The county stops matching when…" | 5 | 1160 × 460 |
| scene-5-barChart.svg | Tiers + long $500 not-matched green strip | 5 | 1100 × 480 |
| scene-5-equation.svg | 5-row equation incl. NOT MATCHED | 5 | 880 × 360 |
| scene-5-maxCountyCallout.svg | "Max county money per election" pull-quote | 5 | 700 × 180 |
| scene-6-heading.svg | "What's better: one person giving $100…" | 6 | 1160 × 200 |
| scene-6-topRow.svg | $100 donor → $650 candidate | 6 | 1160 × 320 |
| scene-6-vsDivider.svg | "vs." horizontal divider | 6 | 200 × 100 |
| scene-6-bottomRow.svg | 10 × $10 donors → $1,150 | 6 | 1160 × 320 |

## Notes

- The bar charts use the original saturated palette (#229500 / #0027ff /
  #7600ff). To preview the muted-editorial palette, swap to:
  `#1a5928 / #11283e / #5e1c4a`.
- Heading text wraps automatically based on the font-size in the SVG. If
  you change the font in XD and the wrap looks wrong, just re-flow.
- The version of these files matches the editor at `editor.html` v2.0.
