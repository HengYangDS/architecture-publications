# How does OpenAI Responses Proxy keep Codex traffic portable across providers, and keep itself running? {#guide}

OpenAI Responses Proxy is a loopback listener between a Responses client, such as Codex, and third-party Responses providers.[](source:readme-what) It rebuilds every request in one closed, provider-portable grammar and never edits the client's conversation storage.[](source:readme-portable)[](source:dr2-decision) It installs as an immutable generation and runs under a watchdog that the native service manager keeps alive.[](source:readme-generations)[](source:readme-macos)

- [It changes requests, never conversations](block:p-portable): store=false, no provider bindings, and tool calls kept with their outputs.[](source:readme-compat)
- [A request the provider received in full is never sent again](block:p-resend); the client gets `502 upstream_outcome_unknown` and decides.[](source:dr6-resend)
- [An upgrade keeps admitting turns](block:p-handoff): the successor process inherits the listening socket, and the old one finishes what it accepted.[](source:readme-handoff)
- [Every installation step is journaled](block:p-install), so `recover` finishes or undoes an interrupted one.[](source:arch-completion)

@answer scope="OpenAI Responses Proxy v8.0.0 · commit bc63eca · its source and its own documents"
@meta locale=en style=editorial
@source readme-what title="What the proxy is" path="README.md" lines=3:6
@source readme-portable title="No conversation storage is edited" path="README.md" lines=11:12
@source readme-boundary title="Product boundary" path="README.md" lines=22:34
@source readme-linux title="Supervision on Linux" path="README.md" lines=48:58
@source readme-macos title="The watchdog on macOS" path="README.md" lines=60:68
@source readme-install title="Installing a signed asset" path="README.md" lines=82:85
@source readme-install-tx title="Installation as a transaction" path="README.md" lines=97:105
@source readme-routes title="A base URL that names the upstream" path="README.md" lines=123:136
@source readme-status title="What status reports" path="README.md" lines=177:191
@source readme-purge title="Purging exact files" path="README.md" lines=207:213
@source readme-generations title="Generations and the selector" path="README.md" lines=215:222
@source readme-handoff title="Admission-preserving handoff" path="README.md" lines=227:234
@source readme-compat title="Compatibility behavior" path="README.md" lines=240:260
@source readme-deadline title="One exchange deadline" path="README.md" lines=262:281
@source readme-agent title="Collaboration messages as sent" path="README.md" lines=283:286
@source readme-request title="Request boundary" path="README.md" lines=290:321
@source readme-body title="Body admission" path="README.md" lines=323:330
@source readme-evidence title="Runtime evidence" path="README.md" lines=352:362
@source arch-authority title="Who owns which state" path="docs/architecture/authority-and-runtime-boundary.md" lines=40:50
@source arch-projection title="What the projection removes" path="docs/architecture/authority-and-runtime-boundary.md" lines=226:239
@source arch-agent title="Encrypted agent messages" path="docs/architecture/authority-and-runtime-boundary.md" lines=248:257
@source arch-live title="The live-response boundary" path="docs/architecture/authority-and-runtime-boundary.md" lines=259:263
@source arch-recovery title="Recovery ownership" path="docs/architecture/authority-and-runtime-boundary.md" lines=272:283
@source arch-commit title="Commit, prewarm, handoff, rebind" path="docs/architecture/authority-and-runtime-boundary.md" lines=312:326
@source arch-selector title="One selector" path="docs/architecture/authority-and-runtime-boundary.md" lines=328:341
@source arch-completion title="Completion and recovery" path="docs/architecture/authority-and-runtime-boundary.md" lines=343:350
@source arch-deletion title="Exact-file deletion" path="docs/architecture/authority-and-runtime-boundary.md" lines=352:362
@source threat-assets title="Assets and the client's credential" path="docs/architecture/threat-model.md" lines=18:30
@source threat-boundaries title="Trust boundaries" path="docs/architecture/threat-model.md" lines=32:43
@source threat-residual title="Residual risks" path="docs/architecture/threat-model.md" lines=72:85
@source dr1-decision title="DR-0001: two products, two owners" path="docs/decisions/dr-0001-control-plane-data-plane-boundary.md" lines=23:29
@source dr2-decision title="DR-0002: stateless, portable replay" path="docs/decisions/dr-0002-provider-portable-stateless-replay.md" lines=23:48
@source dr2-consequence title="DR-0002: continuity from replayed dialogue" path="docs/decisions/dr-0002-provider-portable-stateless-replay.md" lines=59:68
@source dr3-decision title="DR-0003: recovery scoped by upstream origin" path="docs/decisions/dr-0003-provider-scoped-recovery-and-backpressure.md" lines=23:38
@source dr6-resend title="DR-0006: a sent request is not sent again" path="docs/decisions/dr-0006-semantic-fit-before-framework-adoption.md" lines=200:228
@source code-route title="Route dispatch" path="src/openai_responses_proxy/serving/server.py" lines=171:195
@source code-body title="Reading one framed body" path="src/openai_responses_proxy/relay/responses.py" lines=106:124
@source code-project title="Projection" path="src/openai_responses_proxy/relay/responses.py" lines=223:246
@source code-gate title="Cooldown, then admission" path="src/openai_responses_proxy/relay/responses.py" lines=270:296
@source code-cooldown title="Cooldowns per upstream origin" path="src/openai_responses_proxy/relay/responses.py" lines=30:66
@source code-deadline title="One exchange, one deadline" path="src/openai_responses_proxy/relay/exchange.py" lines=120:150
@source code-http-error title="Classified upstream errors" path="src/openai_responses_proxy/relay/exchange.py" lines=367:429
@source code-transport-error title="Transport failures" path="src/openai_responses_proxy/relay/exchange.py" lines=432:469
@source code-outcome title="A failure after a complete send" path="src/openai_responses_proxy/relay/upstream.py" lines=409:422
@source code-reused title="A failed send on a reused connection" path="src/openai_responses_proxy/relay/upstream.py" lines=346:387
@source code-reopen title="Only a pre-content failure is reopened" path="src/openai_responses_proxy/relay/sse.py" lines=276:283
@source code-hold title="Events held before content" path="src/openai_responses_proxy/relay/sse.py" lines=128:170
@source code-stream-terminals title="The events that end a stream" path="src/openai_responses_proxy/relay/sse.py" lines=34:35
@source code-stream-end title="The end of a committed stream" path="src/openai_responses_proxy/relay/sse.py" lines=324:328
@source code-stream-class title="The failure class of a failed stream" path="src/openai_responses_proxy/relay/sse.py" lines=335:349
@source code-stream-log title="The log line for a stream's ending" path="src/openai_responses_proxy/relay/sse.py" lines=353:373
@source code-json-terminal title="The log line for a delivered JSON response" path="src/openai_responses_proxy/relay/downstream.py" lines=446:449
@source code-diagnostic title="Codes and event types named in diagnostics" path="src/openai_responses_proxy/protocol/response.py" lines=92:112
@source code-disposition title="Which statuses are retried" path="src/openai_responses_proxy/protocol/recovery/execution.py" lines=56:92
@source code-compact title="Pair-safe compaction" path="src/openai_responses_proxy/protocol/recovery/execution.py" lines=105:156
@source code-input-variant title="The input-variant contract" path="src/openai_responses_proxy/protocol/recovery/input.py" lines=90:100
@source code-capacity title="Input-length and media-budget refusals" path="src/openai_responses_proxy/relay/exchange.py" lines=382:393
@source code-signature title="Verifying the signature" path="src/openai_responses_proxy/lifecycle/artifact.py" lines=295:333
@source code-artifact title="Admitting the archive" path="src/openai_responses_proxy/lifecycle/artifact.py" lines=223:292
@source code-begin title="Beginning a transaction" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=393:470
@source code-downgrade title="Downgrade and replay refused" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=416:421
@source code-materialize title="Materializing the candidate" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=140:201
@source code-activate title="Activating the candidate" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=203:238
@source code-finalize title="Finalizing the installation" path="src/openai_responses_proxy/lifecycle/transaction/completion.py" lines=44:65
@source code-rollback title="Rolling back" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=257:273
@source code-recover title="Recovering from the journal" path="src/openai_responses_proxy/lifecycle/transaction/recovery.py" lines=25:157
@source code-close title="Closing an unwritten transaction" path="src/openai_responses_proxy/lifecycle/transaction/recovery.py" lines=160:167
@source code-recover-wait title="Waiting before a restoration" path="src/openai_responses_proxy/lifecycle/control.py" lines=442:488
@source code-strategy title="Both handoff capabilities" path="src/openai_responses_proxy/lifecycle/deployment/strategy.py" lines=49:59
@source code-incompatible title="An incompatible runtime is refused" path="src/openai_responses_proxy/lifecycle/deployment/apply.py" lines=117:120
@source code-lease title="The predecessor's lease" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=125:133
@source code-request title="Requesting the handoff" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=395:490
@source code-finalized title="Proof of a finalized successor" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=561:574
@source code-failed-handoff title="A failed handoff is rolled back" path="src/openai_responses_proxy/lifecycle/deployment/apply.py" lines=278:296
@source code-predecessor title="Proof that the predecessor still serves" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=375:392
@source code-wait-at-rest title="Waiting out an unanswered request" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=250:277
@source code-resolve title="Resolving a failed request" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=493:558
@source code-disk-match title="Only the selected payload" path="src/openai_responses_proxy/serving/control.py" lines=137:150
@source code-expired title="An expired request is refused" path="src/openai_responses_proxy/serving/control.py" lines=76:82
@source code-spawn title="Passing the socket" path="src/openai_responses_proxy/serving/handoff/protocol.py" lines=198:244
@source code-prepare title="Preparing a successor" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=256:324
@source code-commit title="Crossing COMMIT" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=335:371
@source code-old-finishes title="The old listener finishes" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=398:429
@source code-child title="The successor's side" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=480:538
@source code-local title="Requests from a local client only" path="src/openai_responses_proxy/relay/admission.py" lines=96:111
@source code-address title="The upstream that a path names" path="src/openai_responses_proxy/relay/addressing.py" lines=36:61
@source code-selector title="Reading the selector" path="src/openai_responses_proxy/serving/identity.py" lines=110:133
@source code-selected title="The selected generation" path="src/openai_responses_proxy/lifecycle/generation.py" lines=74:79
@source code-no-selection title="Status without a selected generation" path="src/openai_responses_proxy/lifecycle/control.py" lines=240:247
@source code-journal-paths title="The journal beside the data root" path="src/openai_responses_proxy/lifecycle/records.py" lines=26:38
@source code-command-path title="The command path" path="src/openai_responses_proxy/lifecycle/command.py" lines=36:45
@source code-uninstall title="The order of an uninstall" path="src/openai_responses_proxy/lifecycle/uninstall.py" lines=129:139
@source code-purge title="A purge needs an owned generation" path="src/openai_responses_proxy/lifecycle/transaction/completion.py" lines=228:241
@source code-watchdogs-linux title="Ending each generation's watchdog on Linux" path="src/openai_responses_proxy/lifecycle/supervision/linux.py" lines=197:207
@source code-plist title="The launch agent" path="src/openai_responses_proxy/lifecycle/supervision/macos.py" lines=125:138
@source code-domains title="GUI or Background domain" path="src/openai_responses_proxy/lifecycle/supervision/macos.py" lines=66:87
@source code-unit title="The systemd user unit" path="src/openai_responses_proxy/lifecycle/supervision/linux.py" lines=21:35
@source code-roots title="Data and state roots" path="src/openai_responses_proxy/runtime/config.py" lines=147:170
@source code-watchdog title="The watchdog loop" path="src/openai_responses_proxy/lifecycle/supervision/watchdog.py" lines=91:129
@source code-activate-carrier title="Each role loads its carrier" path="src/openai_responses_proxy/lifecycle/runtime_spec.py" lines=149:156
@source code-carrier-schema title="A carrier must hold every field" path="src/openai_responses_proxy/lifecycle/runtime_spec.py" lines=159:166
@source code-earlier-shape title="A payload of an earlier shape" path="src/openai_responses_proxy/lifecycle/generation.py" lines=98:103
@source readme-eligibility title="A payload of 7.0.2 or earlier" path="README.md" lines=116:119
@source code-status-next title="One next command per state" path="src/openai_responses_proxy/cli/outcome.py" lines=37:43
@source code-lock title="One lifecycle writer" path="src/openai_responses_proxy/cli/application.py" lines=67:86
@source code-options title="What the port and deadline options accept" path="src/openai_responses_proxy/cli/options.py" lines=32:73
@source readme-port title="The default port" path="README.md" lines=87:95
@source readme-budgets title="Limits a fresh installation may choose" path="README.md" lines=332:348
@source code-defaults title="Runtime defaults" path="src/openai_responses_proxy/runtime/config.py" lines=66:82
@source code-platforms title="Release platforms" path="src/openai_responses_proxy/product_identity.py" lines=13:20
@source changelog-100 title="The 1.0.0 release" path="CHANGELOG.md" lines=2256:2262
@source changelog-202 title="Renamed in 2.0.2" path="CHANGELOG.md" lines=1651:1661
@source changelog-500 title="Renamed in 5.0.0" path="CHANGELOG.md" lines=751:758
@source changelog-5111 title="The 5.1.11 release" path="CHANGELOG.md" lines=322:335
@source changelog-5112 title="The 5.1.12 release" path="CHANGELOG.md" lines=300:320
@source changelog-600 title="The 6.0.0 release" path="CHANGELOG.md" lines=244:298
@source changelog-601 title="The 6.0.1 release" path="CHANGELOG.md" lines=204:242
@source changelog-602 title="The 6.0.2 release" path="CHANGELOG.md" lines=151:202
@source changelog-603 title="The 6.0.3 release" path="CHANGELOG.md" lines=121:149
@source changelog-800 title="The 8.0.0 release" path="CHANGELOG.md" lines=11:53

## Who sends traffic through the proxy, and what does it leave to others? {#p-context}

The proxy owns Responses normalization, replay portability, bounded recovery and its own service lifecycle. It configures no client and reads no client configuration.[](source:readme-boundary)[](source:dr1-decision)

@facts
| Listener | 127.0.0.1, port 8792 |
| Request body | One Content-Length, at most 64 MiB, received within 30 s |
| Exchange deadline | 900 s for the whole exchange, including every write to the client |
| SSE event | At most 64 MiB, also for the events held before content |
| Model catalog | 30 s and at most 8 MiB per request |
| Release platforms | macOS arm64, Linux x86_64 |

The listener binds 127.0.0.1 only and does not authenticate requests.[](source:threat-boundaries) Use `--port` only when 8792 conflicts with another local service.[](source:readme-port) The other values are the runtime's defaults, and each platform has its own native release asset.[](source:code-defaults)[](source:readme-deadline)[](source:code-platforms) A fresh installation can choose other body, event and catalog limits, and an upgrade keeps the persisted values.[](source:readme-budgets)

`--port` takes a whole number from 1 to 65535 written in decimal digits. A fraction, a base prefix or a plus sign is a usage error.[](source:code-options)[](source:changelog-5111)

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-client | Responses client | Codex, Hermes or a Responses SDK, admitted only after its request, replay, streaming, error and installed-client journeys pass.[](source:readme-boundary) | context-map | ctx-client |
| step-ctx-control | Client control plane | Owns credentials, provider selection and client configuration. It writes the client's base URL, which names the upstream after the loopback address.[](source:readme-boundary)[](source:readme-routes) | context-map | ctx-control |
| step-ctx-proxy | OpenAI Responses Proxy | Listens on 127.0.0.1 only and holds no credential of its own; the client's Authorization header goes upstream for one request.[](source:threat-boundaries)[](source:threat-assets) | context-map | ctx-proxy |
| step-ctx-providers | Provider endpoints | Any Responses upstream that the client's base URL names; a new one needs no proxy release.[](source:readme-routes) Plain HTTP is allowed only for a loopback upstream.[](source:threat-boundaries) | context-map | ctx-providers |
| step-ctx-operator | Operator | Installs a signed release asset with a trust anchor supplied through a separate trusted channel.[](source:readme-install) | context-map | ctx-operator |
| step-ctx-service | Native service manager | Keeps the watchdog running: launchd on macOS, a systemd user manager on Linux.[](source:readme-macos)[](source:readme-linux) | context-map | ctx-service |

| Owner                | Authoritative state                                                    |
| -------------------- | ---------------------------------------------------------------------- |
| Client               | Conversations, tool state, JSONL, SQLite, stored items, model metadata |
| Client control plane | Credentials, provider selection, client endpoint configuration         |
| Installed proxy      | Manifest-owned payload and native service projection                   |
| Provider             | Model execution, quota and upstream availability                       |

Each kind of state has one owner, and the proxy writes only its own.[](source:arch-authority)

## What happens to one turn? {#p-turn}

Only `POST /<upstream>/responses` and `GET /<upstream>/models` are admitted, where `<upstream>` is a scheme, an authority and a base path. Headers, bodies and query parameters cannot select another host.[](source:readme-request)[](source:code-address) A request from a web page gets HTTP 403.[](source:readme-request)[](source:code-local)

@sequence id=turn-flow title="One Responses turn through the proxy"
| actor turn-client | Responses client | frontend |
| actor turn-listener | Loopback listener | backend | source:code-route |
| actor turn-relay | Responses relay | backend | source:code-gate |
| actor turn-projection | Replay projection | security | source:code-project |
| actor turn-exchange | Upstream exchange | backend | source:code-deadline |
| actor turn-delivery | Response delivery | backend | source:code-hold |
| actor turn-provider | Provider endpoint | external |
| phase | Admit |
| turn-client | turn-listener | POST /https/api.example.com/v1/responses |
| turn-listener | turn-relay | route and body |
| turn-relay | turn-projection | project the body |
| turn-projection | turn-relay | portable bytes | return |
| phase | Send |
| turn-relay | turn-exchange | open within the deadline |
| turn-exchange | turn-provider | store=false request | emphasis |
| turn-provider | turn-exchange | event stream | return |
| turn-exchange | turn-relay | accepted response | return |
| phase | Deliver |
| turn-relay | turn-delivery | relay the stream |
| turn-delivery | turn-client | validated events | return |

@steps id=turn-steps
| step-turn-route | Loopback listener | Refuses a web page's request with 403, resolves the upstream from the path, and rejects encoded, dotted or unrelated paths before any upstream I/O.[](source:readme-request)[](source:code-route)[](source:code-address) | turn-flow | turn-listener | | turn-client-to-turn-listener-1,turn-listener-to-turn-relay-1 |
| step-turn-body | Responses relay | Reads one ASCII Content-Length body within 30 s and 64 MiB; a slower or larger body gets 408 or 413.[](source:readme-body)[](source:code-body) | turn-flow | turn-relay | | turn-listener-to-turn-relay-1 |
| step-turn-project | Replay projection | Rebuilds the body in the portable grammar, or refuses unproved structure with 400 before any upstream I/O.[](source:code-project) | turn-flow | turn-projection | | turn-relay-to-turn-projection-1,turn-projection-to-turn-relay-1 |
| step-turn-gate | Responses relay | A cooling upstream origin answers 429 or 503 with Retry-After. Otherwise the turn is admitted and counted as one active Response.[](source:code-cooldown)[](source:code-gate) | turn-flow | turn-relay | | turn-relay-to-turn-exchange-1 |
| step-turn-send | Upstream exchange | One deadline, 900 s by default, bounds headers, retries, reads and every write to the client.[](source:readme-deadline)[](source:code-deadline) | turn-flow | turn-exchange | | turn-exchange-to-turn-provider-1,turn-provider-to-turn-exchange-1,turn-exchange-to-turn-relay-1 |
| step-turn-deliver | Response delivery | Validates each event before writing it, and holds events that come before any content.[](source:code-hold)[](source:arch-live) | turn-flow | turn-delivery | | turn-relay-to-turn-delivery-1,turn-delivery-to-turn-client-1 |

## What does a request keep on its way out? {#p-portable}

Continuity comes from the dialogue the client replays, not from a provider's store. So a portable conversation can move between admitted providers without server-side state.[](source:dr2-consequence)

@diagram tree id=projection-tree source=projection.tree.json

@steps id=projection-steps
| step-pr-bindings | Provider bindings | Response, conversation, cache and stored-item bindings have no shared meaning across providers, so they are removed.[](source:arch-projection) | projection-tree | pr-bindings |
| step-pr-pairs | Tool calls with their outputs | A call keeps its identity and its output stays paired. A later result with its own identity becomes an attributed message in place.[](source:arch-projection) | projection-tree | pr-pairs |
| step-pr-agent | Encrypted agent messages | Native control data keeps its envelope and ciphertext; the proxy does not decrypt it or promise that another provider can.[](source:arch-agent) | projection-tree | pr-agent |
| step-pr-controls | Current-turn controls | An empty additional_tools list stays empty, also during native compaction.[](source:dr2-decision) | projection-tree | pr-controls |
| step-pr-refused | Refused before upstream I/O | Unknown or unproved structure fails locally with 400 instead of being guessed or silently dropped.[](source:dr2-decision)[](source:arch-projection) | projection-tree | pr-refused |

@callout level=note title="Collaboration messages as the client sent them"
| Every upstream receives Codex's native collaboration messages as the client sent them. An encrypted message remains subject to its original provider's decryption support.[](source:readme-agent)[](source:dr2-decision) |

## When may a request be sent again? {#p-resend}

A provider that received a complete request may already be working on it. Sending it again could duplicate the provider's work and its billing.[](source:dr6-resend)

@diagram lifecycle id=exchange-life source=exchange.lifecycle.json

@steps id=exchange-steps
| step-ex-sending | Sending | Connection, DNS and TLS failures before the request is complete are retried, at most four attempts with backoff. A send that fails on a reused idle connection repeats once on a new one.[](source:code-transport-error)[](source:code-reused) | exchange-life | ex-sending |
| step-ex-sent | Sent completely | From here a lost connection or a malformed reply means outcome unknown, because the provider may have accepted the request.[](source:code-outcome) | exchange-life | ex-sent |
| step-ex-held | Before content | Only a pre-content response.failed is reopened; a stream that just ends is not.[](source:code-reopen) | exchange-life | ex-held |
| step-ex-unknown | Outcome unknown | The client receives one `502 upstream_outcome_unknown` and decides whether to retry its turn.[](source:dr6-resend) | exchange-life | ex-unknown |
| step-ex-expired | Deadline expired | Before commitment the client gets `504 upstream_deadline_exceeded`; after it, the stream closes without a terminator.[](source:readme-deadline) | exchange-life | ex-expired |

Each upstream error has one bounded answer, and a cooldown holds back only the upstream origin that caused it.[](source:dr3-decision)[](source:arch-recovery)

| Upstream answer                       | What the proxy does                                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `429`                                 | Relays it once, then cools that upstream origin for its Retry-After, at most 300 s[](source:code-http-error)                                                             |
| `503` after bounded retries           | Relays the original error, then briefly cools that upstream origin[](source:code-disposition)[](source:code-http-error)                                                  |
| `477`                                 | Relays it once, like any other client error[](source:dr3-decision)                                                                                                       |
| `response_failed`                     | Strictly shrinking, pair-safe retries, then at most one dialogue-only attempt[](source:code-compact)                                                                     |
| Invalid `input` union                 | One smaller current-dialogue attempt, then stops[](source:code-input-variant)                                                                                            |
| Input too long or media over budget   | One attempt without older history, if the current input allows, then stops[](source:code-capacity)[](source:code-compact)                                                |
| `invalid_encrypted_content`           | Relays the refusal without replacing the task[](source:arch-agent)                                                                                                       |
| A top-level `error` event in a stream | Relays the event and the end of the response, and nothing the upstream sends after it[](source:code-stream-terminals)[](source:code-stream-end)[](source:changelog-5112) |

## How does a signed release become the serving generation? {#p-install}

Installation never downloads dependencies or reads provider credentials.[](source:readme-install-tx) First, ssh-keygen must find exactly one principal for SHA256SUMS.sig, and the archive and its platform manifest must match the signed sums.[](source:code-signature)[](source:code-artifact) Only then does a transaction commit the bundle, and it proves the listener before it finishes.[](source:arch-commit)

`--timeout-seconds` gives a cold native executable more than the default 30 seconds. A value above 3600 is a usage error.[](source:readme-install-tx)[](source:code-options)[](source:changelog-5111)

@diagram lifecycle id=tx-life source=transaction.lifecycle.json

@steps id=tx-steps
| step-tx-prepared | Prepared | The journal records every candidate file and digest before a write. A downgrade or a replay of the installed release is refused.[](source:code-begin)[](source:code-downgrade) | tx-life | tx-prepared |
| step-tx-materialized | Materialized | The candidate becomes a new immutable generation, is verified against its manifest, and its exact executable is prewarmed.[](source:code-materialize) | tx-life | tx-materialized |
| step-tx-activated | Activated | One atomic selector names the candidate active and the old generation its predecessor; the command link moves with it.[](source:code-activate)[](source:readme-generations) | tx-life | tx-activated |
| step-tx-finalized | Finalized | Only a listener reporting the candidate's identity finalizes. Older generations are then removed by their recorded bytes.[](source:code-finalize)[](source:arch-selector) | tx-life | tx-finalized |
| step-tx-recovery | Recovery required | The journal stays, and `recover` reads the running listener's identity to finish or restore. Before it restores an activated upgrade or rollback whose previous release still serves, it waits 121 seconds and reads health again.[](source:code-recover)[](source:code-recover-wait)[](source:arch-completion)[](source:changelog-602) | tx-life | tx-recovery |
| step-tx-rolled-back | Rolled back | The prior selection and command link return, and only the candidate's recorded files are deleted.[](source:code-rollback)[](source:arch-deletion) | tx-life | tx-rolled-back |
| step-tx-closed | Closed | A transaction that wrote nothing is closed without any other effect.[](source:code-close) | tx-life | tx-closed |

@callout level=warning title="An installation from 5.0.6 or earlier is refused"
| A runtime configuration without the body, catalog and SSE limits is refused, and so is a payload manifest without its receipt digest. On macOS a launch agent without the Aqua and Background session pair is refused too. Each fails with its reason and changes nothing. Remove such an installation with the release that wrote it, then install this one.[](source:code-carrier-schema)[](source:changelog-600) |

@callout level=warning title="An installation from 7.0.2 or earlier is refused"
| The payload of 8.0.0 holds no `providers.toml`, and a generation that 7.0.2 or earlier wrote is refused. The refusal names `uninstall --purge` and changes nothing. Remove such an installation with its own `uninstall --purge`, then install this release.[](source:readme-eligibility)[](source:code-earlier-shape)[](source:changelog-800) |

## How does an upgrade replace the listener without dropping a turn? {#p-handoff}

Upgrade, rollback and reload use one handoff, and no other transition exists. The running listener passes its listening socket to a successor, so new turns are admitted throughout.[](source:readme-handoff)

@sequence id=handoff-flow title="Handing the socket to a successor"
| actor ho-deploy | Deployment | backend | source:code-request |
| actor ho-old | Running listener | backend | source:code-commit |
| actor ho-new | Successor | backend | source:code-child |
| actor ho-client | Responses client | frontend |
| phase | Prepare |
| ho-deploy | ho-old | POST /control/handoff |
| ho-old | ho-new | start, pass the socket |
| ho-new | ho-old | READY, identity echoed | return |
| ho-old | ho-deploy | 202 ready | return |
| phase | Commit |
| ho-old | ho-new | COMMIT | emphasis |
| ho-new | ho-old | SERVING, health proved | return |
| ho-old | ho-new | FINALIZE |
| ho-new | ho-old | FINALIZED | return |
| phase | Serve |
| ho-client | ho-new | new turns | emphasis |
| ho-old | ho-client | accepted turns finish | return |
| phase | Prove |
| ho-deploy | ho-new | read /healthz |
| ho-new | ho-deploy | finalized identity | return |

@steps id=handoff-steps
| step-ho-request | Deployment | Posts the exact release and digests. The listener refuses a request that does not match the selected payload on disk. It begins a handoff only within the request's timeout of accepting the connection, and refuses a later request with HTTP 408.[](source:code-disk-match)[](source:code-local)[](source:code-prepare)[](source:code-expired) | handoff-flow | ho-deploy | | ho-deploy-to-ho-old-1,ho-old-to-ho-deploy-1 |
| step-ho-prepare | Successor | Starts from the selected generation, inherits the socket, and echoes the identity before it serves.[](source:code-spawn)[](source:code-prepare) | handoff-flow | ho-new | | ho-old-to-ho-new-1,ho-new-to-ho-old-1 |
| step-ho-commit | Running listener | At COMMIT it stops accepting; the successor serves and proves its identity on /healthz before FINALIZE.[](source:code-commit)[](source:code-child) | handoff-flow | ho-old | | ho-old-to-ho-new-2,ho-new-to-ho-old-2,ho-old-to-ho-new-3,ho-new-to-ho-old-3 |
| step-ho-finish | Running listener | Accepted turns finish on the old process until they end or reach the upstream timeout, at most 900 s.[](source:code-old-finishes)[](source:code-lease) | handoff-flow | ho-old | | ho-client-to-ho-new-1,ho-old-to-ho-client-1 |
| step-ho-prove | Deployment | Finalizes only when the old process has exited and the successor reports the finalized identity.[](source:code-finalized)[](source:code-request) | handoff-flow | ho-deploy | | ho-deploy-to-ho-new-1,ho-new-to-ho-deploy-1 |

A handoff that fails before its successor commits is rolled back. Deployment first reads from /healthz that the predecessor serves as captured, accepts requests and has no handoff in flight. It also needs evidence that no handoff of its request is still to come. When that cannot be proved, an upgrade or a rollback keeps its transaction open for `recover`.[](source:code-failed-handoff)[](source:code-predecessor)[](source:changelog-600)[](source:changelog-602)

A request that ends without the listener's answer is not rolled back at once, because the listener may still begin it. Deployment waits for the request's timeout and one second, 31 seconds by default, from its first read of a listener with no handoff in flight. An upgrade or a rollback then restores the previous release if the listener still shows none. A handoff that begins in that time is followed to its end.[](source:code-wait-at-rest)[](source:code-resolve)[](source:changelog-602)

@callout level=warning title="A listener that lacks a handoff capability is refused"
| `install`, `rollback` and `reload` refuse a running listener that does not advertise both `selected-generation-handoff` and `admission-preserving-handoff`, before any change. Every release from 5.0.0 on advertises both. Remove an older installation with its own release, then install this one.[](source:code-strategy)[](source:code-incompatible)[](source:readme-handoff)[](source:changelog-600) |

## What does an installation write, and where? {#p-disk}

These are the macOS defaults; Linux follows XDG directories.[](source:code-roots)

@diagram tree id=disk-tree source=disk.tree.json

@steps id=disk-steps
| step-dk-selector | payload-selection.json | The sole authority for the active generation and its one predecessor, read by both the listener and the lifecycle commands. An installed payload is read only through the generation it names; payload files at the data root's own level are not the product's.[](source:code-selector)[](source:code-selected)[](source:changelog-603) | disk-tree | dk-selector |
| step-dk-generations | generations/ | Each install writes a new directory, and a successful upgrade keeps exactly one predecessor.[](source:readme-generations) | disk-tree | dk-generations |
| step-dk-transaction | Transaction journal | Lives beside the data root only while a transaction is open, outside the files it may delete.[](source:code-journal-paths) | disk-tree | dk-transaction |
| step-dk-command | Command link | A symbolic link to the newest selected release, so a serving rollback cannot downgrade the command.[](source:code-command-path)[](source:readme-generations) | disk-tree | dk-command |
| step-dk-agent | Launch agent | Runs the executable in its watchdog role, with RunAtLoad and KeepAlive.[](source:code-plist) | disk-tree | dk-agent |

`uninstall` reads the payload generations before it removes the native service, so an invalid `generations/` directory is refused before anything is removed. On Linux it ends the watchdogs of every generation in that directory.[](source:code-uninstall)[](source:code-watchdogs-linux)[](source:changelog-603)

`uninstall --purge` records each payload file's path and digest first, then deletes only those exact files. Unknown content stays and is reported.[](source:readme-purge) A data root without a generation that the product owns fails the purge, and its content is preserved.[](source:code-purge)[](source:changelog-603)

## How did the proxy get here? {#p-history}

The proxy went from 1.0.0 in July 2026 to 8.0.0 in November, and changed its name twice on the way.[](source:changelog-100)[](source:changelog-202)[](source:changelog-500)[](source:changelog-800) Below are twenty-two of its releases that changed what a client or an operator meets.

@diagram timeline id=history source=history.timeline.json title="How the proxy got here"

## Who keeps the listener running, and what does status report? {#p-running}

The watchdog starts the listener when its port is closed, and waits while a transaction is open and not yet activated.[](source:code-watchdog)

@diagram architecture id=running-map source=running.architecture.json

@steps id=running-steps
| step-run-manager | Native service manager | Starts the watchdog at load and keeps it alive.[](source:code-plist)[](source:code-unit) | running-map | run-manager |
| step-run-watchdog | Watchdog | Checks the listener port every 15 s and backs off up to 120 s while starts keep failing.[](source:code-watchdog) | running-map | run-watchdog |
| step-run-carrier | runtime-config.json | The listener, watchdog and handoff child each load the config beside their own executable, not the shell's environment.[](source:code-activate-carrier) | running-map | run-carrier |
| step-run-cli | Command line | One lifecycle writer at a time; `status` reads /healthz and the payload without changing anything.[](source:code-lock)[](source:readme-evidence) | running-map | run-cli |

@facts
| macOS | With a GUI login the agent lives in that login's domain and returns after a restart; in the Background domain it does not.[](source:readme-macos)[](source:code-domains) |
| Linux | A reachable systemd user manager is required; lingering, owned by the host administrator, decides whether it runs after logout.[](source:readme-linux) |

| State               | Meaning                                                                     | Next command     |
| ------------------- | --------------------------------------------------------------------------- | ---------------- |
| `running`           | Payload verified, supervisor bound, listener serving the installed identity | none             |
| `stopped`           | Supervisor declared, but neither it nor a listener runs                     | `reload`         |
| `degraded`          | Installed, with one named problem                                           | `doctor`         |
| `recovery_required` | A payload transaction is open                                               | `recover`        |
| `invalid`           | Installed evidence cannot be verified                                       | `status --json`  |
| `not_installed`     | No owned service, listener, command, payload or transaction exists          | `install --help` |

Each result names at most one next command.[](source:code-status-next)[](source:readme-status) Without a selected generation, `status` reports `payload_integrity` as not ok, with the detail `no payload generation is selected`.[](source:code-no-selection)[](source:changelog-603)

`status --json` also reports reliability counters and classified failures, all secret-free.[](source:readme-evidence) A stream that the upstream ended with a top-level `error` event is the failure class `stream_error`.[](source:code-stream-class)[](source:changelog-5112)

The log names how every admitted response ended, never an event's message.[](source:code-gate)[](source:changelog-601) A stream that ended with an `error` event gets `terminal=error` and the event's code. A stream that ended without a terminal event gets `last=` and the type of the last accepted event.[](source:code-stream-log)[](source:code-diagnostic) A delivered JSON response gets `json_terminal` and the response's `status`.[](source:code-json-terminal)

@callout level=note title="Accepted local risks"
| Every residual risk the threat model keeps needs another process of the same user. One example: `recover` reads /healthz without the process check that `status` performs.[](source:threat-residual) |
