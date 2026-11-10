// Film Kit: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([Film Kit], [Each edition rebuilt from the film's own sources], [A local engine: Film Kit narrates, assembles, captions, gates, renders and packages each edition of a narrated explainer film, and every step records the SHA-256 of what it read.], read-from: [Read from 112 files, each cited by its SHA-256.], claim-x: 124pt)

// ── Band 1: one edition's route, from the declaration to a compared rebuild ──
#let ys = 250pt
#let tr = 20pt
#head(48pt, 132pt, [The film])
#head(170pt, 132pt, [Narration])
#head(420pt, 132pt, [Sound])
#head(660pt, 132pt, [Picture])
#head(900pt, 132pt, [Package])
#head(1030pt, 132pt, [Accept])
#head(1390pt, 132pt, [Rebuild])
#tx(48pt, 152pt, "film.toml and the files it names", w: 110pt, fill: soft)
#tx(170pt, 152pt, "filmkit.narration.narrate", w: 240pt, fill: soft)
#tx(420pt, 152pt, "produce select, assemble, refresh-captions", w: 230pt, fill: soft)
#tx(660pt, 152pt, "stage, check, render and validate the picture", w: 230pt, fill: soft)
#tx(900pt, 152pt, "package-metadata, package-film", w: 120pt, fill: soft)
#tx(1030pt, 152pt, "review.round, delivery.verification, documents_folder", w: 350pt, fill: soft)
#tx(1390pt, 152pt, "delivery.reproduction", w: 162pt, fill: soft)

// The trunk carries what both editions share; zh and en take every step between.
#seg((96pt, ys), (262pt, ys), w: 4pt, c: green)
#seg((1000pt, ys), (1440pt, ys), w: 4pt, c: green)
#seg((262pt, ys), (282pt, ys - tr), (980pt, ys - tr), (1000pt, ys), w: 2.2pt, c: green)
#seg((262pt, ys), (282pt, ys + tr), (980pt, ys + tr), (1000pt, ys), w: 2.2pt, c: green)
#tx(266pt, 218pt, "zh", fill: mid, style: "italic")
#tx(266pt, 292pt, "en", fill: mid, style: "italic")
#let trunk = ((96pt, "Declare", "content/film.toml", "ring"), (206pt, "Check words", "occurrence plans", "tick"), (1070pt, "Review", "production-review", "tick"), (1190pt, "Verify", "writes nothing", "tick"), (1310pt, "Deliver", "delivery-readback", "ring"), (1440pt, "Compare", "report.json", "ring"))
#let lanes = ((340pt, "Narrate", "narration receipt", "ring"), (460pt, "Select", "narration-selected", "tick"), (580pt, "Assemble", "timeline, soundtrack", "ring"), (700pt, "Check picture", "picture-gates", "tick"), (820pt, "Render", "render receipt", "ring"), (940pt, "Package", "film-package", "ring"))
#for (x, name, record, kind) in trunk {
  if kind == "ring" { ring(x, ys, r: 6pt, w: 2.4pt) } else { tick(x, ys, h: 15pt) }
  txc(x, 218pt, 112pt, name, weight: "semibold")
  txc(x, 292pt, 112pt, record, fill: soft)
}
#for (x, name, record, kind) in lanes {
  for dy in (-tr, tr) {
    if kind == "ring" { ring(x, ys + dy, r: 4.5pt, w: 1.8pt) } else { tick(x, ys + dy, h: 11pt) }
  }
  txc(x, 218pt, 112pt, name, weight: "semibold")
  txc(x, 292pt, 112pt, record, fill: soft)
}
#tx(48pt, 336pt, [zh and en take each step from Narrate to Package. Each record binds the SHA-256 of what its step read, and a later step refuses one bound to other bytes.], fill: ochre, style: "italic")

// Band 1 foot: what must hold before narration, and before the picture renders.
#hrule(354pt, x1: 776pt)
#hrule(354pt, x0: 824pt)
#head(48pt, 378pt, [Before anything is narrated])
#dl(48pt, 402pt, 104pt, 728pt, (
  ([Concepts], [each segment says its declared concepts in approved words; no counterexample appears anywhere]),
  ([Readings], [each watched Chinese character has a declared reading, and every name a spoken form]),
  ([Spoken text], [one pronunciation contract per script derives what each thought says]),
  ([Refusal], [narration stops before any speech model loads, and names every failure]),
))
#head(824pt, 378pt, [Before the picture renders])
#dl(824pt, 402pt, 110pt, 728pt, (
  ([Frame audit], [every frame at 1/30 s: layout, legibility, balance and how text lines up]),
  ([Sync audit], [each label against its spoken words; marks that wait for a name]),
  ([Text measures], [the declared title for 1 s before the first word; each text at rest at 4.5:1 or more]),
  ([Motion audit], [ghosts, stalls, pops, jumps and dash snaps at 30 frames per second]),
  ([Gate record], [binds the composition, timeline, stylesheet, fonts and engine version]),
))

// ── Band 2: the take a thought must give, and what each record binds ──────
#head(48pt, 510pt, [A take reaches the soundtrack only if it ends whole])
#tx(48pt, 530pt, [A whole take is quiet at its end, its last syllable dying away instead of stopping.], fill: soft)
#let yk = 590pt
#seg((106pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (106pt, "Seed", "the cast's seed, or a retake", "ring", 108pt),
  (236pt, "Narrate", "one native take per thought", "tick", 120pt),
  (366pt, "Judge", none, "tick", 0pt),
  (496pt, "Select", "bound to the script and the cast", "tick", 120pt),
  (626pt, "Assemble", "designed pauses, one gain", "tick", 112pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 110pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 80pt, [Soundtrack], weight: "semibold")
#txc(744pt, yk + 24pt, 80pt, [-16.5 LUFS], fill: soft)
#tx(394pt, yk - 6pt, [natural], fill: green, style: "italic")
#seg((366pt, yk + 6pt), (366pt, 672pt), (386pt, 672pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(393pt, 672pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(406pt, 668pt, [Abrupt: audition other seeds, or read on into the next thought and cut in the quiet, then bind the chosen seed to the thought's text and speech. The assembly refuses an abrupt take unless the film declares a release for its join.], w: 370pt, fill: ochre)

#head(824pt, 510pt, [What each record binds])
#hrule(530pt, x0: 824pt)
#let records = (
  ([narration receipt], [each thought's request fingerprint, text, seed and waveform]),
  ([narration-selected], [the script, the cast, each recording and the narrator reference]),
  ([audio-assembly], [the script, the soundtrack, the designed pauses and the program level]),
  ([stage.json], [the script, timeline, assembly, soundtrack and source manifest]),
  ([picture-gates], [the composition, timeline, stylesheet, fonts and engine version]),
  ([render receipt], [the staged document and the rendered picture]),
  ([film-package], [both pictures, their equivalence, the soundtrack, cover, script and chapters]),
)
#for (k, (what, binds)) in records.enumerate() {
  tx(824pt, 554pt + k * 18pt, what, weight: "semibold")
  tx(1000pt, 554pt + k * 18pt, binds, fill: soft)
}
#tx(824pt, 696pt, [Verification reads each record again and decodes every film, writing nothing. Reproduction compares a rebuild with the published release, frame by frame.], w: 728pt, fill: soft)

// ── Band 3: what the film holds, what is supplied, what is delivered ───────
#hrule(744pt)
#head(48pt, 770pt, [The film holds])
#dl(48pt, 794pt, 110pt, 460pt, (
  ([declaration], [file prefix, editions, fonts, player colours and review policy]),
  ([scripts, casts], [each edition's text, thoughts, seeds and retakes]),
  ([composition], [the picture's template, script and style]),
))
#head(560pt, 770pt, [Supplied once, then offline])
#dl(560pt, 794pt, 100pt, 470pt, (
  ([browser], [Chrome Headless Shell 152, which HyperFrames drives]),
  ([speech], [Qwen3 voice, recognizer and aligner snapshots on MLX]),
  ([host], [FFmpeg, ExifTool and rsync 3, from Homebrew]),
))
#head(1072pt, 770pt, [Delivered per edition])
#dl(1072pt, 794pt, 72pt, 480pt, (
  ([films], [a UHD master and a 1080p film, each with captions and without]),
  ([viewing], [cover, SRT, VTT, transcript, chapters and player]),
  ([entry], [one language page leads to both players]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its plate; the interactive page is the guide, every claim cited.])
