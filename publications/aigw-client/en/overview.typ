// AIGW: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([AIGW], [One reviewed configuration, projected into every client], [A local control plane: AIGW points each client at one model, writes only its own settings into the client's files, runs only for a command or a credential read, and never carries a request.], read-from: [Read from 245 files, each cited by its SHA-256.], claim-x: 124pt)

// ── Band 1: the configuration, its projection into each client, the clients' own traffic ──
#head(48pt, 132pt, [Control plane · AIGW])
#tx(48pt, 152pt, [aigw.toml under one lock · Tokens kept apart], fill: soft)
#head(824pt, 132pt, [Data plane · the clients])
#tx(824pt, 152pt, [each client keeps its own state and calls its endpoint itself], fill: soft)

// The configuration: what a provider serves, which model a client selects.
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
#tx(xa - 8pt, yr - 16pt, [Provider], weight: "semibold")
#tx(xr - 8pt, yr - 16pt, [Model], weight: "semibold")
#tx(xb - 8pt, yr - 16pt, [Client selection], weight: "semibold")
#tx(xa + 12pt, yr + 26pt, [a service you hold a Token for: one endpoint per protocol, never a credential], w: 176pt, fill: soft)
#tx(xr + 12pt, yr + 26pt, [what a provider serves, named provider/model, with its protocols], w: 176pt, fill: soft)
#tx(xb + 12pt, yr + 26pt, [the model one admitted client uses], w: 116pt, fill: soft)
#tx(xa + 86pt, yr - 6pt, [serves], fill: mid, style: "italic")
#tx(xr + 76pt, yr - 6pt, [selected by], fill: mid, style: "italic")
#tx(xr + 14pt, 341pt, [Family], weight: "semibold")
#tx(xr + 14pt, 359pt, [optional: which canonical model it is], fill: soft)
#tx(xa + 14pt, 341pt, [Tokens], weight: "semibold")
#tx(xa + 14pt, 359pt, [one selected store: keyring, DPAPI or an owner-only file], w: 190pt, fill: soft)

// The projection: one guarded transaction into each admitted client's own region.
#let rows = (200pt, 262pt, 324pt, 386pt)
#seg((xb + 6pt, yr), (xbus, yr), w: 4pt, c: green)
#seg((xbus, rows.first()), (xbus, rows.last()), w: 4pt, c: green)
#for y in rows { seg((xbus, y), (852pt, y), w: 2.2pt, c: green) }
#tx(xbus + 14pt, 186pt, [plan · apply · check, one guarded transaction], fill: green, style: "italic")
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
#tx(170pt, 414pt, [each client reads its own Token on demand through aigw credential, matched to its client files], fill: ochre, style: "italic")

// Band 1 foot: what the operator does, and the one vocabulary every surface reports.
#hrule(448pt, x1: 776pt)
#hrule(448pt, x0: 824pt)
#dl(48pt, 472pt, 104pt, 728pt, (
  ([setup], [first-time setup: one provider, one installed client and one of its models]),
  ([use], [point one client at one provider/model]),
  ([sync], [make every enabled client's files match; \-\-dry-run shows the plan and reads no secret]),
  ([check], [as deep as \-\-depth asks: local, endpoint, model or client; model and client may use quota]),
  ([provider rotate], [replace one provider's Token]),
  ([config rollback], [restore the configuration and the client files, not the program]),
))
#dl(824pt, 472pt, 132pt, 728pt, (
  ([configured], [local prerequisites pass; the depth of a check says how much more is proven]),
  ([local · endpoint], [a check without a request · one authenticated request that names no model]),
  ([model · client], [one bounded inference request · a real client session]),
  ([deferred], [a credential or a client's files postponed on purpose]),
  ([degraded], [still configured, with a recoverable problem]),
  ([invalid · unavailable], [unsafe to use · a required capability is missing]),
))

// ── Band 2: the transaction every projection is, and who owns what ─────────
#head(48pt, 614pt, [Every change to client files is one guarded transaction])
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
  ([AIGW configuration], [providers, models, recommendations and each client's selection]),
  ([Selected Token store], [the provider Tokens; AIGW chooses the store]),
  ([Client adapter], [AIGW's own settings in one admitted client's files]),
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
#dl(48pt, 836pt, 108pt, 460pt, (
  ([self update], [updates or rolls back only a portable program]),
  ([self uninstall], [removes AIGW's settings from client files, then the program]),
))
#head(560pt, 812pt, [Team files, without secrets])
#dl(560pt, 836pt, 108pt, 470pt, (
  ([setup \-\-from], [applies a team file; what it names wins for models]),
  ([\-\-dry-run], [previews a team file and writes nothing]),
))
#head(1072pt, 812pt, [Changing a provider])
#dl(1072pt, 836pt, 108pt, 480pt, (
  ([provider edit], [changes an endpoint deliberately; no command renames a provider]),
  ([provider rotate], [replaces a Token in the selected store]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its plate; the interactive page is the guide, every claim cited.])
