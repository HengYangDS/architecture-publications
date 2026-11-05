// DDWG: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([DDWG], [From a work question to the one topic that owns its rule], [Members and Agents read these guidelines without installing anything; maintainers change them through one official OpenSpec Change, which installed ETHOS admits, proves and publishes.], read-from: [Read from 48 files, each cited by its SHA-256.], claim-x: 124pt)

// ── Band 1: two entries, one task map, seven topics under the charter ──────
#head(48pt, 132pt, [Two entries, one task map])
#tx(48pt, 152pt, [members and Agents read the same guidance], fill: soft)
#head(588pt, 132pt, [Seven topics, one owner for each rule])
#tx(588pt, 152pt, [the task map routes each work question to the section that owns it], fill: soft)

#let yr = 236pt
#let (xe, xm, xbus) = (120pt, 380pt, 540pt)
// The repository entry leads to the task map; the Agent entry joins it from below.
#seg((xe + 8pt, yr), (xm - 8pt, yr), w: 1.7pt, c: green)
#seg((xe + 8pt, 336pt), (xm, 336pt), (xm, yr + 8pt), w: 1.7pt, c: green)
#ring(xe, yr, r: 6pt, w: 2.2pt)
#ring(xe, 336pt, r: 6pt, w: 2.2pt)
#disc(xm, yr, r: 6.5pt)
#tx(xe - 8pt, yr - 16pt, label-of("repository-entry"), weight: "semibold")
#tx(xm - 8pt, yr - 16pt, label-of("task-map"), weight: "semibold")
#tx(xe + 12pt, yr + 26pt, [README.md: the purpose, then the task map and the MIT grant], w: 220pt, fill: soft)
#tx(xe + 14pt, 326pt, label-of("agent-entry"), weight: "semibold")
#tx(xe + 12pt, 362pt, [AGENTS.md: a delegated scope; people keep authorization and acceptance], w: 236pt, fill: soft)
#tx(xm + 14pt, yr + 26pt, [docs/README.md, urgent route first], w: 132pt, fill: soft)

// The task map's bus to the seven topics; the charter, which the other topics apply, comes first.
#let rows = (176pt, 216pt, 256pt, 296pt, 336pt, 376pt, 416pt)
#seg((xm + 8pt, yr), (xbus, yr), w: 4pt, c: green)
#seg((xbus, rows.first()), (xbus, rows.last()), w: 4pt, c: green)
#let topics = (
  ("charter", [two kinds of authority, four hard boundaries, the risk levels every topic applies]),
  ("decide", [frame a decision, diagnose a failure, make options comparable]),
  ("data", [qualify a data asset; change shared or production data]),
  ("deliver", [check the commitment before acting; close the work on evidence]),
  ("communicate", [structure an update, a decision document or an escalation]),
  ("human-agent", [delegate a bounded task; check the Agent's actual output]),
  ("evolve", [emergencies and exceptions; coaching; admitting or retiring a practice]),
)
#for (k, (id, duty)) in topics.enumerate() {
  let y = rows.at(k)
  seg((xbus, y), (xbus + 40pt, y), w: 2.2pt, c: green)
  if k == 0 { disc(xbus + 48pt, y, r: 6.5pt) } else { ring(xbus + 48pt, y, r: 6pt, w: 2.2pt) }
  tx(xbus + 64pt, y + 5pt, label-of(id), weight: "semibold")
  tx(xbus + 248pt, y + 5pt, duty, fill: soft)
}
#tx(1300pt, 176pt, [One owner for each rule], weight: "semibold")
#tx(1300pt, 196pt, [Each obligation has one editable owner. Navigation, examples, decision records and governance link to it without restating it.], w: 252pt, fill: soft)
#tx(1300pt, 316pt, [Urgent first], weight: "semibold")
#tx(1300pt, 336pt, [The route for an urgent failure or breach comes before every routine route.], w: 252pt, fill: soft)

// Band 1 foot: what the charter holds every topic to.
#hrule(456pt, x1: 776pt)
#hrule(456pt, x0: 824pt)
#tx(48pt, 482pt, [Four hard boundaries], weight: "semibold")
#dl(48pt, 504pt, 144pt, 728pt, (
  ([Tell the truth], [no fabricated, hidden or selected facts; no uncertainty dressed as certainty]),
  ([Stay in bounds], [subject, time, competence, permission, data, security, compliance, action]),
  ([Name the owner], [an accountable person for each judgment, decision, change and acceptance]),
  ([No false completion], [no claim of complete, correct, usable or adopted without matching evidence]),
))
#tx(824pt, 482pt, [Form follows risk], weight: "semibold")
#dl(824pt, 504pt, 112pt, 728pt, (
  ([L0 light], [local and reversible: conclusion, basis and action in one exchange]),
  ([L1 standard], [cross-role work, competing options or material uncertainty: a reviewable record]),
  ([L2 high risk], [production, funds, sensitive data, overwrite: authorization, rollback, review]),
  ([Review], [examines the actual facts and evidence, not the author's or the Agent's account]),
))

// ── Band 2: the life of one change, and who owns what ──────────────────────
#head(48pt, 604pt, [Every change is one official Change])
#let yk = 664pt
#seg((104pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (104pt, "Change", "proposal, design, deltas, tasks.md", "ring"),
  (210pt, "Lane", "owned and leased by ETHOS", "tick"),
  (316pt, "Prewrite", "exact paths, just before writing", "tick"),
  (422pt, "Commit", "a trusted SSH signature", "tick"),
  (528pt, "Proof", none, "ring"),
  (634pt, "Accepted", "dev advances by fast-forward", "tick"),
)
#for (x, name, note, kind) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 100pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, 100pt, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 70pt, [Archive], weight: "semibold")
#txc(744pt, yk + 24pt, 96pt, [a new commit, proved again], fill: soft)
#tx(548pt, yk - 6pt, [pass], fill: green, style: "italic")
#seg((528pt, yk + 6pt), (528pt, 736pt), (548pt, 736pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(555pt, 736pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(568pt, 740pt, [block or unknown: nothing moves, and no raw push goes around it], w: 200pt, fill: ochre)
#tx(48pt, 740pt, [The proof is the full host graph at the exact HEAD.], w: 440pt, fill: soft)

#head(824pt, 604pt, [Who owns what])
#hrule(624pt, x0: 824pt)
#let owners = (
  ([OpenSpec Change], [material intent, requirements, design and progress in tasks.md]),
  ([Installed ETHOS], [attribution, lease, admission, proof, acceptance and publication]),
  ([Governance page], [permission, acceptance, release and retirement boundaries]),
  ([Contributing], [the exact commands to edit, verify, prepare ETHOS and publish]),
  ([Configuration map], [the native input behind each check]),
  ([Decision records], [durable rationale and rejected alternatives, never tasks or logs]),
)
#for (k, (who, what)) in owners.enumerate() {
  tx(824pt, 644pt + k * 18pt, who, weight: "semibold")
  tx(1000pt, 644pt + k * 18pt, what, fill: soft)
}

// ── Band 3: the edition, its two Forges, what a pass does not prove ────────
#hrule(774pt)
#head(48pt, 800pt, [The edition])
#dl(48pt, 824pt, 84pt, 460pt, (
  ([VERSION], [8.0.0, the one release identity; the Changelog follows it]),
  ([Tag], [a signed vX.Y.Z that matches VERSION and its Changelog entry]),
))
#head(560pt, 800pt, [Two Forges, each on its own])
#dl(560pt, 824pt, 72pt, 470pt, (
  ([GitLab], [the organization's publication plane]),
  ([GitHub], [an independent repository, CI/CD and distribution]),
))
#head(1072pt, 800pt, [What a pass does not prove])
#dl(1072pt, 824pt, 96pt, 480pt, (
  ([Checks], [meaning, reading order or team adoption]),
  ([Local proof], [delivery to either Forge]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([Each view has its poster; the interactive page is the guide, every claim cited.])
