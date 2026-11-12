// ETHOS · 问道: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([ETHOS · 问道], [Intent is compiled and proven before the repository moves], [Each step compiles official intent and fresh facts into one TransitionPlan; only a pass admits an effect, every effect is one exact compare-and-swap, and no Attestation grants authority.], read-from: [Read from 505 files, each cited by its SHA-256.], claim-x: 196pt)

// ── Band 1: the repository's roles above, one change below them ───────────
#let ys = 236pt
#let tr = 22pt
#head(48pt, 132pt, [Intent])
#head(200pt, 132pt, [Work Lanes · in parallel])
#head(812pt, 132pt, [Candidate])
#head(982pt, 132pt, [Accepted])
#head(1150pt, 132pt, [Release])
#head(1318pt, 132pt, [Peers])
#tx(48pt, 152pt, [openspec/ · Change], fill: soft)
#tx(200pt, 152pt, [work/\* · one worktree and Lease each], fill: soft)
#tx(812pt, 152pt, [candidate/dev · land], fill: soft)
#tx(982pt, 152pt, [dev · closeout], fill: soft)
#tx(1150pt, 152pt, [main · signed v\* tags], fill: soft)
#tx(1318pt, 152pt, [GitLab · GitHub · publish], fill: soft)

// The archive returns to the intent: the specs change with the repository.
#seg((682pt, ys - tr), (682pt, 182pt), (112pt, 182pt), (112pt, ys - 12pt), w: 1.15pt, c: mid)
#down(112pt, ys - 8pt, c: mid)
#tx(300pt, 177pt, [the archive updates the specs], fill: mid, style: "italic")
// The proof is made once and read by every move below the lanes.
#seg((748pt, 182pt), (1206pt, 182pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#for x in (880pt, 1046pt, 1206pt) {
  seg((x, 182pt), (x, ys - 12pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
  down(x, ys - 8pt)
}
#tx(886pt, 177pt, [the proof Attestation of the exact commit], fill: ochre, style: "italic")

// The change: one heavy line, three lanes in parallel, one at a time after them.
#seg((112pt, ys), (208pt, ys), w: 4pt, c: green)
#seg((208pt, ys), (792pt, ys), w: 4pt, c: green)
#seg((208pt, ys), (230pt, ys - tr), (770pt, ys - tr), (792pt, ys), w: 1.7pt, c: green)
#seg((208pt, ys), (230pt, ys + tr), (770pt, ys + tr), (792pt, ys), w: 1.7pt, c: green)
#seg((792pt, ys), (1366pt, ys), w: 4pt, c: green)
#ring(112pt, ys, r: 7pt, w: 2.6pt)
#let lane = ((262pt, "Start", "tick"), (382pt, "Prewrite", "ring"), (502pt, "Commit", "ring"), (622pt, "Archive", "tick"), (742pt, "Prove", "ring"))
#for (x, name, kind) in lane {
  for dy in (-tr, 0pt, tr) {
    if kind == "tick" { tick(x, ys + dy, h: if dy == 0pt { 15pt } else { 11pt }) } else { ring(x, ys + dy, r: if dy == 0pt { 5pt } else { 3.6pt }, w: if dy == 0pt { 2pt } else { 1.5pt }) }
  }
  txc(x, ys - tr - 11pt, 110pt, name, weight: "semibold")
}
#tick(880pt, ys, h: 15pt)
#disc(1046pt, ys, r: 6pt)
#disc(1206pt, ys, r: 6pt)
#ring(1366pt, ys, r: 7pt, w: 2.6pt)

// What each role does, set directly under it.
#tx(48pt, 290pt, [OpenSpec is the only tracked intent; a Change compiles into a Commitment.], w: 140pt)
#dl(200pt, 290pt, 72pt, 290pt, (
  ([Start], [own branch from the candidate train]),
  ([Prewrite], [exact tracked paths before a write]),
  ([Commit], [hooks of the selected runtime admit it]),
))
#dl(500pt, 290pt, 66pt, 300pt, (
  ([Archive], [the official archive, one signed commit]),
  ([Prove], [the gate graph for the exact HEAD, kept beside Git]),
))
#tx(812pt, 290pt, [Lanes land one at a time; a stale base is refused and replayed by #box[lane refresh-base].], w: 158pt)
#tx(982pt, 290pt, [dev advances only by the closeout of a proven candidate.], w: 150pt)
#tx(1150pt, 290pt, [main takes signed tags of accepted dev; hosted jobs release them.], w: 150pt)
#tx(1318pt, 290pt, [One atomic push per peer, each with its receipt; no atomicity is claimed across peers.], w: 234pt)

// Band 1 foot: how a lane is held, and how a move is refused.
#hrule(360pt, x1: 776pt)
#hrule(360pt, x0: 824pt)
#dl(48pt, 384pt, 112pt, 728pt, (
  ([Lease], [holder, generation and expiry in state.sqlite: one owner per lane, renewed, resumed or taken over]),
  ([Write order], [target path · repository root · context refresh · status · prewrite · write · post-write audit]),
  ([Handoff], [a lane moves between hosts as one content-addressed package; revoke-source ends the old Lease]),
  ([Retire], [landed, superseded, absorbed-ref, abandon or recover, always at the expected head]),
))
#dl(824pt, 384pt, 140pt, 728pt, (
  ([No authority], [without \-\-authorize and \-\-expect-head nothing moves]),
  ([Diverged train], [candidate \-\-refresh-from-accepted resets it before the lane is replayed]),
  ([Unproven archive], [archive-change \-\-compensate restores the exact pre-archive head]),
  ([Unknown or dirty], [observe only, until a public transition can derive one safe effect]),
))

// ── Band 2: the plan every step is, and the structure every repository shares ──
#head(48pt, 500pt, [Every step is one TransitionPlan])
#let yk = 586pt
#seg((104pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (104pt, "Inputs", "Commitment, Facts, prior Attestations", "ring", 104pt),
  (216pt, "Authority", "resolved, with every contradiction", "tick", 104pt),
  (320pt, "Compile", "checks, decisions and effects", "tick", 96pt),
  (424pt, "Order", "one DAG; equal inputs, equal bytes", "tick", 112pt),
  (536pt, "Verdict", none, "ring", 0pt),
  (640pt, "Effect", "one exact compare and swap", "tick", 104pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 110pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 70pt, [Attest], weight: "semibold")
#txc(744pt, yk + 24pt, 70pt, [evidence only], fill: soft)
#tx(568pt, yk - 6pt, [pass], fill: green, style: "italic")
#seg((536pt, yk + 6pt), (536pt, 652pt), (556pt, 652pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(563pt, 652pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(576pt, 656pt, [block or unknown: no effect], fill: ochre, style: "italic")
#tx(48pt, 700pt, [Inputs are explicit values: compilation reads no ambient file, clock, network or process. Only an adapter holding an explicit root, authority, precondition and expected state performs an admitted effect, then attests it.], w: 728pt, fill: soft)

#head(824pt, 500pt, [Structure every governed repository shares])
#let cols = (
  (824pt, [Declared], (([profile.toml], [binding, OpenSpec paths]), ([Paradigm], [names, documents, toolchain]), ([OpenSpec], [the only tracked intent]))),
  (1008pt, [Checked], (([Documents], [names, licence, links]), ([Size], [one per-file ceiling]), ([Pipelines], [one CI model, every Forge]))),
  (1192pt, [Enforced], (([Commits], [grammar and SSH signature]), ([Layout], [imports resolve to owners]), ([Projections], [native producers only]))),
  (1376pt, [Beside Git], (([state.sqlite], [the Leases]), ([attestations-set], [the durable Attestations]), ([runtime/CURRENT], [one runtime; ROLLBACK kept]))),
)
#for (x, title, rows) in cols {
  tx(x, 536pt, title, weight: "semibold")
  hrule(546pt, x0: x, x1: x + 166pt)
  for (k, (term, def)) in rows.enumerate() {
    tx(x, 570pt + k * 40pt, term, weight: "semibold")
    tx(x, 586pt + k * 40pt, def, fill: soft)
  }
}
#tx(824pt, 700pt, [ETHOS holds itself to the same floor. A profile chooses facts and gates, never what a command means.], w: 728pt, fill: soft)

// ── Band 3: how a repository is formed, how it is reached, how a lane ends ─
#hrule(744pt)
#head(48pt, 770pt, [Formed or adopted])
#dl(48pt, 794pt, 152pt, 460pt, (
  ([adopt \-\-create], [forms a new repository from a starter]),
  ([adopt], [binds an existing repository at its head]),
  ([adopt \-\-evolve-starter], [merges a starter upgrade into a candidate]),
))
#head(560pt, 770pt, [Reached the same way])
#dl(560pt, 794pt, 72pt, 470pt, (
  ([CLI], [status, plan, prove, land, publish, lane, hook and host]),
  ([MCP], [the same operations over a root-bound transport]),
  ([Skills], [packages checked against the commands they declare]),
))
#head(1072pt, 770pt, [Every lane ends explicitly])
#dl(1072pt, 794pt, 72pt, 480pt, (
  ([retire], [landed · superseded · absorbed-ref · abandon · recover]),
  ([lease], [renew · resume · reacquire · takeover]),
  ([handoff], [transfer · export · import · revoke-source]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its plate; the interactive page is the guide, every claim cited.])
