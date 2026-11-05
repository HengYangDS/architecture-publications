// Architecture Publisher: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([Architecture Publisher], [Meaning, evidence, form and acceptance each have one owner], [archpub draws any repository's architecture from an explicit model, binds every byte of a delivery to its inputs, and publishes only what a named reviewer accepted.], read-from: [Read from 66 files, each cited by its SHA-256.], claim-x: 270pt)

// ── Band 1: four owners side by side; one build passes through them ───────
#let cols = ((48pt, [Author], [owns the meaning]), (346pt, [Repository], [holds the evidence]), (636pt, [Publisher], [gives it form]), (1196pt, [Reviewer], [accepts and publishes]))
#let yb = 262pt
#let ybind = 176pt
#let xbind = 1100pt
#for (k, (x, name, role)) in cols.enumerate() {
  head(x, 132pt, name)
  tx(x, 152pt, role, fill: soft)
  // A rule that the binding crosses pauses for its line and its sentence.
  if k > 0 and x - 16pt < xbind {
    seg((x - 16pt, 118pt), (x - 16pt, ybind - 22pt), w: 0.8pt, c: rule)
    seg((x - 16pt, ybind + 8pt), (x - 16pt, 460pt), w: 0.8pt, c: rule)
  } else if k > 0 { seg((x - 16pt, 118pt), (x - 16pt, 460pt), w: 0.8pt, c: rule) }
}
// The binding: the manifest names the digest of every input, so every byte answers to one.
#seg((xbind, yb - 8pt), (xbind, ybind), (84pt, ybind), (84pt, yb - 10pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#down(84pt, yb - 8pt)
#seg((380pt, ybind), (380pt, yb - 10pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#down(380pt, yb - 8pt)
#tx(420pt, ybind - 6pt, [manifest.json binds the model, every owned and cited file, every supply and every artifact by digest], fill: ochre, style: "italic")
// The build: one line to the fork, three media, one delivery.
#seg((84pt, yb), (370pt, yb), w: 4pt, c: green)
#seg((390pt, yb), (842pt, yb), w: 4pt, c: green)
#seg((842pt, yb), (864pt, yb - 40pt), (980pt, yb - 40pt), (1002pt, yb), w: 2.4pt, c: green)
#seg((842pt, yb), (1002pt, yb), w: 2.4pt, c: green)
#seg((842pt, yb), (864pt, yb + 40pt), (980pt, yb + 40pt), (1002pt, yb), w: 2.4pt, c: green)
#seg((1002pt, yb), (1406pt, yb), w: 4pt, c: green)
#ring(84pt, yb, r: 7pt, w: 2.6pt)
#ring(380pt, yb, r: 6pt, w: 2.2pt)
#tick(690pt, yb, h: 15pt)
#tick(800pt, yb, h: 15pt)
#tick(922pt, yb - 40pt, h: 13pt)
#tick(922pt, yb, h: 13pt)
#tick(922pt, yb + 40pt, h: 13pt)
#disc(xbind, yb, r: 7pt)
#ring(1246pt, yb, r: 6pt, w: 2.2pt)
#ring(1406pt, yb, r: 7pt, w: 2.6pt)
#tx(96pt, yb - 14pt, [model.json], weight: "semibold")
#tx(392pt, yb - 14pt, [Files], weight: "semibold")
#txc(690pt, yb - 14pt, 90pt, [Plan], weight: "semibold")
#txc(800pt, yb - 14pt, 90pt, [Lay out], weight: "semibold")
#txc(922pt, yb - 54pt, 90pt, [Posters], weight: "semibold")
#tx(960pt, yb - 54pt, [2400 × 1350], fill: soft)
#txc(922pt, yb - 14pt, 90pt, [Overview], weight: "semibold")
#txc(922pt, yb + 66pt, 90pt, [Page], weight: "semibold")
#tx(960pt, yb + 66pt, [the author's guide, ranges verified], fill: soft)
// The delivery's name stands below its stop, clear of the binding that rises from it.
#txc(xbind, yb + 28pt, 100pt, [Delivery], weight: "semibold")
#txc(1246pt, yb - 14pt, 90pt, [Accept], weight: "semibold")
#txc(1406pt, yb - 16pt, 90pt, [Publish], weight: "semibold")
// What each owner contributes, under the line.
#let yn = 360pt
#tx(104pt, yn, [components that claim files, relations that cite them, views, a scope, an overview and a guide; each problem with its JSON path], w: 226pt)
#seg((84pt, yb + 8pt), (84pt, 422pt), w: 1.5pt, c: green)
#ring(84pt, 430pt, r: 5pt, w: 2pt)
#tx(98pt, 435pt, [LikeC4 or version 1], weight: "semibold")
#tx(98pt, 452pt, [imported, or migrated to version 2], fill: soft)
#tx(346pt, yn, [read through Git at the pinned revision, each file given to its most specific claim; no fetch, no prompt, no change to the checkout], w: 260pt)
#tx(636pt, yn, [views on one column lattice, wires only horizontal or vertical; the overview set apart, by Typst in the house faces], w: 196pt)
#tx(1030pt, yn, [staged in a new directory, renamed into place only when complete], w: 150pt)
#tx(1196pt, yn, [acceptance.json names the reviewer and the manifest, once], w: 150pt)
#tx(1376pt, yn, [root/id/version; only an accepted delivery, never over another], w: 176pt)
// The supplies the publisher runs, each verified by digest before use.
#tx(636pt, 435pt, [Supplies in custody], weight: "semibold")
#tx(788pt, 435pt, [Archify 3.2.0 · resvg 0.49.0 · opentype.js 2.0.0], fill: soft)
#tx(788pt, 451pt, [Noto Sans 2.015 and CJK SC 2.004 · Lucide 1.66.0], fill: soft)
#tx(788pt, 467pt, [Source Serif 4 4.005 · Source Sans 3 3.052], fill: soft)

// Band 1 foot: how a view is drawn, and what a delivery holds.
#hrule(476pt, x1: 776pt)
#hrule(476pt, x0: 824pt)
#dl(48pt, 500pt, 104pt, 728pt, (
  ([Rows], [cards on shared row lines of one column lattice, each as wide as its text]),
  ([Wires], [only horizontal or vertical, in channels between rows]),
  ([Overlap], [a layout that overlaps is never drawn]),
  ([Refusal], [a view no layout draws is refused, never shrunk]),
))
#dl(824pt, 500pt, 104pt, 728pt, (
  ([Posters], [page-n.svg and PNG, 2400 px wide unless asked otherwise]),
  ([Page], [index.html: the author's guide, or one Archify panel per view]),
  ([Overview], [overview.svg and PNG: the author's composition in the house class]),
  ([Manifest], [digests of the model, every owned and cited file, the supplies and the artifacts]),
  ([Acceptance], [the reviewer, a note and the manifest it accepts]),
))

// ── Band 2: what is refused, and what the publisher may touch ─────────────
#head(48pt, 594pt, [Every step refuses rather than degrades])
#let refusals = (
  ([Model], [model\_invalid · model\_too\_large]),
  ([Files], [files\_unresolved · source\_read\_failed]),
  ([Layout], [layout\_untidy · layout\_row\_too\_wide]),
  ([Posters], [poster\_unfittable · poster\_unbalanced]),
  ([Page], [page\_layout\_refused · page\_refused]),
  ([Guide], [guide\_missing · guide\_repository\_mismatch]),
  ([Overview], [overview\_composition\_missing · overview\_text\_overlap]),
  ([Delivery], [delivery\_exists · delivery\_changed]),
  ([Acceptance], [acceptance\_exists · acceptance\_reviewer\_missing]),
  ([Publication], [publish\_unaccepted · publish\_conflict]),
)
#for (k, (stage, codes)) in refusals.enumerate() {
  let x = if k < 5 { 48pt } else { 400pt }
  let b = 626pt + calc.rem(k, 5) * 18pt
  tx(x, b, stage, weight: "semibold")
  tx(x + 92pt, b, codes, fill: soft)
}
#tx(48pt, 734pt, [Every refusal lists each problem with its path, so the caller corrects and retries; nothing is shrunk, guessed or retried behind the caller's back.], w: 728pt, fill: soft)

#head(824pt, 594pt, [What the publisher may touch])
#dl(824pt, 626pt, 104pt, 728pt, (
  ([Git], [reads at the pinned revision, and clones it only to check a guide; never fetches or changes the checkout]),
  ([Children], [Git, Archify and Typst run with an allowlisted environment]),
  ([LikeC4], [parsed under Node's permission model, reading only its own supply]),
  ([Output], [one new delivery directory, renamed into place when complete]),
  ([Bytes], [the same model, files and version give the same bytes on one platform]),
))

// ── Band 3: commands, languages, and what it will not do ──────────────────
#hrule(776pt)
#head(48pt, 800pt, [Commands])
#dl(48pt, 822pt, 70pt, 470pt, (
  ([check], [validate, bind, compose and count coverage; \-\-against lists the re-pin work]),
  ([build], [write a delivery; accept and publish follow]),
  ([import], [write a model from LikeC4; migrate converts version 1]),
))
#head(560pt, 800pt, [In the model's language])
#tx(560pt, 822pt, [English, Simplified and Traditional Chinese, Spanish or Korean: the publisher's own words follow the model.], w: 470pt)
#head(1072pt, 800pt, [What it will not do])
#tx(1072pt, 822pt, [infer architecture from code, judge whether a model is true, or decide that a figure is good enough to publish], w: 480pt)

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its poster; the interactive page is the guide, every claim cited.])
