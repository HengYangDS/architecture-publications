// OpenAI Responses Proxy: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([OpenAI Responses Proxy], [Portable requests, transactional releases], [A loopback data plane for Codex and other Responses clients: each request is rebuilt store-free and sent to the provider its path names, and the proxy installs, hands off and supervises its own listener.], read-from: [Read from 85 files, each cited by its SHA-256.], claim-x: 300pt)

// ── Band 1: the route of one turn, from the client to its provider and back ──
#head(48pt, 132pt, [The route of one turn])
#tx(48pt, 152pt, [POST /\<provider\>/v1/responses and GET /\<provider\>/v1/models; any other path is refused before upstream I/O], fill: soft)
#head(1324pt, 132pt, [Providers])
#tx(1324pt, 152pt, [one route each, from the manifest], fill: soft)

#let yr = 236pt
#seg((122pt, yr), (1300pt, yr), w: 4pt, c: green)
#let stations = (
  (122pt, [Client], [Codex, Hermes or a Responses SDK], "ring"),
  (260pt, [Listener], [127.0.0.1:8792, loopback only], "ring"),
  (410pt, [Body], [one Content-Length, within 30 s and 64 MiB], "tick"),
  (560pt, [Projection], [store=false, provider bindings removed], "tick"),
  (710pt, [Delegation], [readable only on a route that selects it], "tick"),
  (860pt, [Gate], [a cooling provider answers at once], "tick"),
  (1010pt, [Exchange], [one deadline, 900 s by default], "ring"),
  (1160pt, [Transport], [no redirects; a sent request is never resent], "tick"),
)
#for (x, name, note, kind) in stations {
  if kind == "ring" { ring(x, yr, r: 6pt, w: 2.2pt) } else { tick(x, yr, h: 14pt, w: 2.4pt) }
  txc(x, yr - 16pt, 130pt, name, weight: "semibold")
  txc(x, yr + 26pt, 128pt, note, fill: soft)
}
#seg((1316pt, yr - 46pt), (1316pt, yr + 46pt), w: 4pt, c: green)
#dl(1324pt, yr - 30pt, 80pt, 228pt, (
  ([dmxapi], [www.dmxapi.cn]),
  ([ucloud], [api.modelverse.cn]),
  ([aihubmix], [api.inferera.com]),
  ([upstream], [one origin chosen at install]),
))
#tx(1324pt, yr + 50pt, [The manifest names each route's origin and any wire policy.], w: 228pt, fill: soft)

// The response comes back through delivery, which validates before it writes.
#seg((1300pt, 318pt), (122pt, 318pt), (122pt, 298pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#place(top + left, polygon(fill: ochre, (122pt, 291pt), (118.5pt, 297pt), (125.5pt, 297pt)))
#tx(140pt, 338pt, [Delivery validates each event before writing it, and holds events before content, so a pre-content response.failed can be reopened.], fill: ochre, style: "italic")

// Band 1 foot: what a request keeps, and how each upstream failure is bounded.
#hrule(364pt, x1: 776pt)
#hrule(364pt, x0: 824pt)
#head(48pt, 390pt, [What leaves the listener])
#dl(48pt, 414pt, 84pt, 728pt, (
  ([kept], [dialogue messages, tool calls with their outputs, current-turn controls, encrypted agent messages]),
  ([removed], [previous response and conversation bindings, cache keys, reasoning, item references, search calls]),
  ([rewritten], [an empty tool output becomes a marker; a later tool result becomes an attributed message]),
  ([refused], [unknown types and broken tool pairs, with 400, before any upstream I/O]),
))
#head(824pt, 390pt, [Each failure has one bounded answer])
#dl(824pt, 414pt, 150pt, 728pt, (
  ([429], [relayed once; that provider alone cools for Retry-After, at most 300 s]),
  ([503 after retries], [relayed; that provider cools briefly before the next probe]),
  ([DMXAPI 477], [the exact empty\_response: the same bytes once more]),
  ([response\_failed], [shrinking, pair-safe retries, then one dialogue-only attempt]),
  ([input too long], [one smaller historical projection; current input and images kept]),
  ([lost after sending], [502 upstream\_outcome\_unknown; the client decides]),
  ([deadline], [504 before commitment; after it the stream closes, never replayed]),
))

// ── Band 2: one transaction per release, one handoff per new listener ──────
#hrule(530pt)
#head(48pt, 558pt, [Every release is one journaled transaction])
#let yk = 630pt
#seg((112pt, yk), (712pt, yk), w: 1.7pt, c: green)
#let steps = (
  (112pt, "Admitted", "signature verified with ssh-keygen", "ring", 118pt),
  (262pt, "Prepared", "every file and digest journaled", "tick", 118pt),
  (412pt, "Materialized", "a new generation, prewarmed", "tick", 118pt),
  (562pt, "Activated", none, "tick", 0pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 130pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(712pt, yk, r: 6pt, w: 2.4pt)
#txc(712pt, yk - 14pt, 90pt, [Finalized], weight: "semibold")
#txc(712pt, yk + 24pt, 104pt, [the listener proves its identity], fill: soft)
#seg((562pt, yk + 6pt), (562pt, 700pt), (590pt, 700pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(597pt, 700pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(610pt, 704pt, [unconfirmed: recover finishes or restores it], w: 160pt, fill: ochre)
#tx(48pt, 724pt, [Activation switches the command link and one selector, which names the active generation and its one predecessor; a rollback is a new transaction back to it.], w: 500pt, fill: soft)

#head(824pt, 558pt, [A new listener without a dropped turn])
#seg((896pt, yk), (1496pt, yk), w: 1.7pt, c: green)
#let phases = (
  (896pt, "Prepare", "the successor starts from the selected generation", "ring"),
  (1046pt, "Ready", "socket inherited, identity echoed", "tick"),
  (1196pt, "Commit", "the old listener stops accepting", "tick"),
  (1346pt, "Serving", "health proved on /healthz", "tick"),
)
#for (x, name, note, kind) in phases {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 130pt, name, weight: "semibold")
  txc(x, yk + 24pt, 140pt, note, fill: soft)
}
#ring(1496pt, yk, r: 6pt, w: 2.4pt)
#txc(1490pt, yk - 14pt, 100pt, [Finalize], weight: "semibold")
#txc(1486pt, yk + 24pt, 120pt, [the old one finishes its turns, at most 900 s], fill: soft)
#tx(824pt, 724pt, [A runtime without this capability is drained instead: new turns get a retryable 503 until the successor serves.], w: 728pt, fill: soft)

// ── Band 3: what keeps it running, the commands, and what others own ───────
#hrule(756pt)
#head(48pt, 782pt, [Kept running])
#dl(48pt, 806pt, 116pt, 460pt, (
  ([service manager], [launchd, systemd or Task Scheduler keeps it alive]),
  ([watchdog], [checks the port every 15 s; starts the listener]),
))
#head(560pt, 782pt, [Commands])
#dl(560pt, 806pt, 84pt, 470pt, (
  ([read], [status and doctor only read, and name the next command, if any]),
  ([change], [install, reload, rollback, recover and uninstall, one at a time]),
))
#head(1072pt, 782pt, [Owned elsewhere])
#dl(1072pt, 806pt, 110pt, 480pt, (
  ([client], [conversations, tool state and model selection]),
  ([control plane], [credentials, provider selection and client configuration]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its plate; the interactive page is the guide, every claim cited.])
