// AIGW: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([AIGW], [One reviewed configuration, projected into every client], [A local control plane: AIGW turns reviewed configuration into bounded native-client projections, runs only for a command or a credential read, and never carries a request.], read-from: [Read from 208 files, each cited by its SHA-256.], claim-x: 124pt)

// ── Band 1: the configuration, its projection into each client, the clients' own traffic ──
#head(48pt, 132pt, [Control plane · AIGW])
#tx(48pt, 152pt, [config.toml under one lock · Tokens kept apart], fill: soft)
#head(824pt, 132pt, [Data plane · the clients])
#tx(824pt, 152pt, [each client keeps its own state and calls its endpoint itself], fill: soft)

// The configuration: what an Account exposes, which Route a client uses.
#let yr = 236pt
#let (xa, xr, xb, xbus) = (120pt, 340pt, 560pt, 700pt)
#seg((xa + 8pt, yr), (xr - 8pt, yr), w: 1.7pt, c: green)
#seg((xr + 8pt, yr), (xb - 8pt, yr), w: 1.7pt, c: green)
#seg((xr, yr + 8pt), (xr, 328pt), w: 1.7pt, c: green)
#ring(xa, yr, r: 6pt, w: 2.2pt)
#ring(xr, yr, r: 6pt, w: 2.2pt)
#disc(xb, yr, r: 6.5pt)
#ring(xr, 336pt, r: 5pt, w: 2pt)
#ring(xa, 336pt, r: 5pt, w: 2pt)
#tx(xa - 8pt, yr - 16pt, [Account], weight: "semibold")
#tx(xr - 8pt, yr - 16pt, [Route], weight: "semibold")
#tx(xb - 8pt, yr - 16pt, [Client Binding], weight: "semibold")
#tx(xa + 12pt, yr + 26pt, [one provider capability: endpoints by protocol, never a credential], w: 176pt, fill: soft)
#tx(xr + 12pt, yr + 26pt, [how one Account exposes one Model, by interface and lifecycle], w: 176pt, fill: soft)
#tx(xb + 12pt, yr + 26pt, [the Route one admitted client uses], w: 116pt, fill: soft)
#tx(xa + 86pt, yr - 6pt, [exposes], fill: mid, style: "italic")
#tx(xr + 76pt, yr - 6pt, [selected by], fill: mid, style: "italic")
#tx(xr + 14pt, 341pt, [Model], weight: "semibold")
#tx(xr + 14pt, 359pt, [one canonical upstream product], fill: soft)
#tx(xa + 14pt, 341pt, [Tokens], weight: "semibold")
#tx(xa + 14pt, 359pt, [one selected store: keyring, DPAPI or an owner-only file], w: 190pt, fill: soft)

// The projection: one guarded transaction into each admitted client's own region.
#let rows = (200pt, 262pt, 324pt, 386pt)
#seg((xb + 6pt, yr), (xbus, yr), w: 4pt, c: green)
#seg((xbus, rows.first()), (xbus, rows.last()), w: 4pt, c: green)
#for y in rows { seg((xbus, y), (852pt, y), w: 2.2pt, c: green) }
#tx(xbus + 14pt, 186pt, [plan · apply · verify, one guarded transaction], fill: green, style: "italic")
#let clients = (
  ([Codex], [\~/.codex/config.toml], [conversations, model metadata and the Desktop GUI stay with Codex]),
  ([Claude Code], [\~/.claude/settings.json], [sessions and runtime behaviour stay with Claude Code]),
  ([Claude Desktop], [Claude-3p/configLibrary], [its own library; everything else stays with the app]),
  ([Hermes], [\~/.hermes/config.yaml], [everything but AIGW's own providers and model stays with Hermes]),
)
#for (k, (name, target, keeps)) in clients.enumerate() {
  let y = rows.at(k)
  ring(860pt, y, r: 6pt, w: 2.2pt)
  head(876pt, y + 6pt, name)
  tx(1070pt, y + 5pt, target)
  tx(876pt, y + 24pt, keeps, fill: soft)
  seg((1336pt, y), (1404pt, y), w: 1.5pt, c: mid)
  right-arrow(1412pt, y, s: 6pt)
}
#seg((1420pt, rows.first() - 14pt), (1420pt, rows.last() + 14pt), w: 4pt, c: green)
#head(1436pt, 206pt, [Endpoints])
#tx(1436pt, 226pt, [providers, or a chosen gateway], fill: soft, w: 116pt)
#tx(1436pt, 282pt, [traffic, retries and service lifecycle belong to them], fill: soft, w: 116pt)
#tx(1236pt, 176pt, [each request goes straight to its endpoint], fill: mid, style: "italic")
// The credential read: on demand, by the client, matched to its projection.
#seg((xa, 344pt), (xa, 420pt), (846pt, 420pt), (846pt, rows.last() + 8pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#place(top + left, polygon(fill: ochre, (846pt, rows.last() + 6pt), (842.5pt, rows.last() + 12pt), (849.5pt, rows.last() + 12pt)))
#tx(170pt, 414pt, [each client reads its own Token on demand through aigw credential, matched to its projection], fill: ochre, style: "italic")

// Band 1 foot: what the operator does, and the one vocabulary every surface reports.
#hrule(448pt, x1: 776pt)
#hrule(448pt, x0: 824pt)
#dl(48pt, 472pt, 104pt, 728pt, (
  ([setup], [first-time setup: one Account and one Route, bound to the selected client]),
  ([use], [select a Route for one client]),
  ([sync], [resynchronize every enabled client; \-\-dry-run shows the plan and reads no secret]),
  ([verify], [a Route through a real native client, which may use quota; only a full \-\-for all pass records a checkpoint]),
  ([rotate], [update one Account Token]),
  ([rollback], [restore the configuration and the projections, not the program]),
))
#dl(824pt, 472pt, 132pt, 728pt, (
  ([configured], [local prerequisites pass; no endpoint has been observed]),
  ([endpoint checked], [an endpoint diagnostic succeeded; inference is not proven]),
  ([inference checked], [a request with the Route's exact model succeeded]),
  ([deferred], [a credential or a projection postponed on purpose]),
  ([degraded], [still configured, with a recoverable problem]),
  ([invalid · unavailable], [unsafe to use · a required capability is missing]),
))

// ── Band 2: the transaction every projection is, and who owns what ─────────
#head(48pt, 614pt, [Every projection is one guarded transaction])
#let yk = 682pt
#seg((106pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (106pt, "Discover", "each admitted client and its native paths", "ring", 112pt),
  (248pt, "Plan", "complete and secret-free before any write", "tick", 130pt),
  (390pt, "Prepare", "every target, with its exact state before and after", "tick", 130pt),
  (520pt, "Commit", none, "ring", 0pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 120pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 70pt, [Receipt], weight: "semibold")
#txc(744pt, yk + 24pt, 96pt, [one receipt to compensate], fill: soft)
#tx(560pt, yk - 6pt, [all committed], fill: green, style: "italic")
#seg((520pt, yk + 6pt), (520pt, 740pt), (536pt, 740pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(543pt, 740pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(556pt, 736pt, [Compensate in reverse, only while our write still holds; drift fails closed, and a later writer is never overwritten.], w: 220pt, fill: ochre)

#head(824pt, 614pt, [Who owns what])
#let owners = (
  ([AIGW configuration], [Accounts, Models, Routes, recommendations and Client Bindings]),
  ([Selected Token store], [the Account Tokens; AIGW chooses the store]),
  ([Client adapter], [one admitted, bounded region of a client's own configuration]),
  ([The client], [conversations, memory, tools and GUI state]),
  ([The endpoint product], [traffic normalization, retries and service lifecycle]),
  ([Local Git and the Forges], [signed commits and tags; hosting, CI and Release records]),
)
#hrule(634pt, x0: 824pt)
#for (k, (who, what)) in owners.enumerate() {
  tx(824pt, 654pt + k * 18pt, who, weight: "semibold")
  tx(1010pt, 654pt + k * 18pt, what, fill: soft)
}

// ── Band 3: the program, configuration that travels, accounts that change ──
#hrule(786pt)
#head(48pt, 812pt, [The program itself])
#dl(48pt, 836pt, 96pt, 460pt, (
  ([update], [updates or rolls back only a portable program]),
  ([uninstall], [withdraws AIGW's projections, then the program]),
))
#head(560pt, 812pt, [Configuration without secrets])
#dl(560pt, 836pt, 84pt, 470pt, (
  ([export], [a secret-free configuration manifest]),
  ([import], [merges one such manifest; migrate moves the schema]),
))
#head(1072pt, 812pt, [Changing an Account])
#dl(1072pt, 836pt, 84pt, 480pt, (
  ([rename], [renames an Account; \-\-finalize then removes its old credential slots]),
  ([rotate], [replaces a Token in the selected store]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its plate; the interactive page is the guide, every claim cited.])
