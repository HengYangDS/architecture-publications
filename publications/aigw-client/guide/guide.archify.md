# How does AIGW keep every AI client of a team in step with one reviewed configuration? {#aigw-guide}

AIGW is a local-first control plane for a team's AI clients.[](source:readme-what) It keeps reviewed Accounts, Routes and Client Bindings in one locked configuration, and writes a bounded region into each client it supports, as one guarded transaction.[](source:store-owner)[](source:transaction) It never carries a request: each client reads its Token on demand and calls its endpoint itself.[](source:boundary)

- [It controls configuration, not traffic](block:p-owners): request execution, session continuity and team access stay with clients and gateways.[](source:research-boundary)[](source:research-restraint)
- [A failed sync restores only what it wrote](block:p-race), so a newer edit by another writer survives.[](source:restore)
- [No client file holds a Token](block:p-token): a helper reads it from one selected store when the client asks.[](source:helper-projection)
- [Each check proves one more thing](block:p-ready), and a synchronized file is not an answered request.[](source:experience-readiness)

@answer scope="AIGW v0.6.0 · commit 9c26591 · its source and its own documents"
@meta locale=en style=editorial repo_url="https://github.com/HengYangDS/aigw-cli.git" repo_revision=9c26591fb3efec088075a7ba18b6dae6d840eacf
@source readme-what title="What AIGW is" path="README.md" lines=3:6
@source readme-install title="Install" path="README.md" lines=29:41
@source readme-team title="Importing a team manifest" path="README.md" lines=94:102
@source readme-connect title="Connecting one Account" path="README.md" lines=101:108
@source readme-activate title="Activating later" path="README.md" lines=118:125
@source readme-sync title="What sync changes" path="README.md" lines=136:142
@source readme-credentials title="Credential storage" path="README.md" lines=158:163
@source readme-model title="The product model" path="README.md" lines=244:253
@source readme-adapters title="Supported clients" path="README.md" lines=255:261
@source readme-boundaries title="Boundaries" path="README.md" lines=269:280
@source readme-rollback title="Program rollback" path="README.md" lines=308:311
@source readme-uninstall title="Uninstall" path="README.md" lines=339:343
@source readme-update-trust title="Signed updates from either peer" path="README.md" lines=349:354
@source readme-check title="Checking without inference" path="README.md" lines=24:25
@source concepts title="Five concepts" path="docs/concepts/product-concepts.md" lines=11:14
@source account-concept title="Account" path="docs/concepts/product-concepts.md" lines=49:62
@source route-concept title="Route" path="docs/concepts/product-concepts.md" lines=71:84
@source binding-concept title="Client Binding" path="docs/concepts/product-concepts.md" lines=93:105
@source projection-concept title="Native Projection" path="docs/concepts/product-concepts.md" lines=107:119
@source catalog-states title="From observation to Route" path="docs/concepts/product-concepts.md" lines=147:162
@source catalog-qualify title="What qualifies a Route" path="docs/concepts/product-concepts.md" lines=164:168
@source account-struct title="Account in configuration" path="internal/domain/model.go" lines=85:92
@source model-struct title="Model in configuration" path="internal/domain/model.go" lines=94:100
@source route-struct title="Route in configuration" path="internal/domain/model.go" lines=102:113
@source binding-struct title="Client Binding in configuration" path="internal/domain/clients.go" lines=200:216
@source research-responsibilities title="Four responsibilities" path="docs/research/provider-tooling-assessment.md" lines=48:57
@source research-boundary title="A narrower boundary" path="docs/research/provider-tooling-assessment.md" lines=204:207
@source research-restraint title="Not another workbench" path="docs/research/provider-tooling-assessment.md" lines=211:219
@source research-value title="AIGW's value hypothesis" path="docs/research/provider-tooling-assessment.md" lines=231:235
@source experience-questions title="Three questions" path="docs/experience/terminal-experience.md" lines=11:15
@source experience-readiness title="Readiness, decomposed" path="docs/experience/terminal-experience.md" lines=17:26
@source adapter-admission title="Two admissions" path="docs/governance/adapter-admission.md" lines=13:23
@source acceptance-journey title="Real-client release journey" path="docs/operations/real-client-acceptance.md" lines=69:79
@source acceptance-windows title="Hermes on Windows" path="docs/operations/real-client-acceptance.md" lines=39:41
@source rollout-intro title="Team rollout" path="docs/guides/team-rollout.md" lines=11:13
@source rollout-maintainer title="The maintainer's steps" path="docs/guides/team-rollout.md" lines=15:29
@source boundary title="Authority and projection boundary" path="docs/architecture/authority-and-projection-boundary.md" lines=38:41
@source owners title="Who owns which state" path="docs/architecture/authority-and-projection-boundary.md" lines=48:59
@source transaction title="The synchronization transaction" path="internal/app/synchronization/transaction.go" lines=40:53
@source preflight title="The preflight" path="internal/app/synchronization/transaction.go" lines=55:70
@source commit-order title="Entry point, configuration, then projections" path="internal/app/synchronization/transaction.go" lines=74:96
@source transaction-boundary title="The transaction boundary" path="docs/architecture/security-model.md" lines=175:189
@source restore title="The guarded restore" path="internal/platform/files.go" lines=166:180
@source store-commit title="Committing the configuration" path="internal/store/store.go" lines=131:134
@source store-owner title="What the store owns" path="internal/store/store.go" lines=24:25
@source store-lock title="The mutation lock" path="internal/store/store.go" lines=407:423
@source seam title="The adapter contract" path="internal/adapter/registry.go" lines=93:106
@source entrypoint title="The credential entrypoint" path="docs/architecture/security-model.md" lines=72:80
@source credential title="The credential protocol" path="docs/architecture/security-model.md" lines=119:128
@source token-storage title="Where Tokens live" path="docs/architecture/security-model.md" lines=13:16
@source token-store title="Reading the selected store" path="docs/architecture/security-model.md" lines=38:44
@source helper-projection title="A Claude Desktop projection" path="internal/adapter/claudedesktop/adapter.go" lines=252:266
@source verify-checkpoint title="The full verification checkpoint" path="internal/cli/verify/verify.go" lines=119:124
@source rollback-checkpoint title="What rollback restores" path="internal/cli/rollback/rollback.go" lines=38:47
@source decision title="DR-0006: one guarded transaction" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=15:30
@source rejected title="DR-0006: rejected alternatives" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=32:37
@source revisit title="DR-0006: when to revisit" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=45:48
@source readiness title="The readiness states" path="internal/app/readiness/state.go" lines=1:27

## Who uses AIGW, and what does it touch? {#p-context}

AIGW's value hypothesis: a team member with any one supported provider credential reaches a usable client configuration, understands it and safely withdraws it.[](source:research-value)

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-maintainer | Team maintainer | Curates a reviewed, token-free manifest and publishes it from a tag or commit, not a moving branch.[](source:rollout-maintainer) | context-map | ctx-maintainer |
| step-ctx-member | Team member | Imports that manifest and connects only the Account whose Token they hold.[](source:readme-team) | context-map | ctx-member |
| step-ctx-control | AIGW control plane | Manages Accounts, Tokens, Routes and Client Bindings; it relays no requests, runs no gateway and owns no conversation state.[](source:readme-what) | context-map | ctx-control |
| step-ctx-clients | Supported clients | Codex, Claude Code, Claude Desktop and Hermes each get a bounded region; release support needs completed native evidence.[](source:readme-adapters) | context-map | ctx-clients |
| step-ctx-store | Token store | The platform credential service, a local fallback or a read-only environment; an explicit choice fails closed.[](source:readme-credentials) | context-map | ctx-store |
| step-ctx-endpoints | Provider endpoints | A direct provider or an independently operated compatible service; AIGW stores the choice and never operates the service.[](source:readme-boundaries) | context-map | ctx-endpoints |

## How does a team get started? {#p-team}

A team distributes reviewed public configuration, and each member supplies Tokens locally.[](source:rollout-intro)

@diagram workflow id=rollout-flow source=rollout.workflow.json

@steps id=rollout-steps
| step-curate | Curate the manifest | Only reviewed Account endpoints and admitted Routes; no Tokens, personal paths, identities or release credentials.[](source:rollout-maintainer) | rollout-flow | rollout-curate |
| step-publish | Publish at a tag | From a release tag or immutable commit, so every member receives the same file.[](source:rollout-maintainer) | rollout-flow | rollout-publish |
| step-install | Install AIGW | A signed, notarized Homebrew cask on macOS, or a portable archive for macOS, Linux and Windows.[](source:readme-install) | rollout-flow | rollout-install |
| step-import | Import the manifest | Importing needs neither every provider Token nor an installed client.[](source:readme-team) | rollout-flow | rollout-import |
| step-connect | Connect one Account | Select only the Account you hold; the others stay available without becoming prerequisites.[](source:readme-connect)[](source:readme-activate) | rollout-flow | rollout-connect |
| step-check | Sync and check | `aigw sync` projects every enabled binding whose Route, authentication and native surface are available, and never creates a missing client.[](source:readme-sync) | rollout-flow | rollout-check |

- [ ] Save the reviewed `team.toml` from your team's tag, not a moving branch.[](source:rollout-maintainer)
- [ ] Run `aigw setup --from team.toml --account <account>` for the Account whose Token you hold.[](source:readme-connect)
- [ ] Run `aigw check --endpoint-only`, then `aigw check`, then `aigw verify --for all`.[](source:experience-readiness)

## What does AIGW's configuration hold? {#p-model}

A Client Binding selects one Route; the Route names one Account and one Model; the Token stays in a separate store.[](source:concepts) There is no global model choice: `aigw use --for <client> <route>` changes exactly one binding.[](source:readme-model)

@diagram erd id=model-erd source=model.erd.json

@steps id=model-steps
| step-binding | Client Binding | One client's Route, enabled intent, protocol and authentication; no global default, inheritance or fallback across clients.[](source:binding-concept)[](source:binding-struct) | model-erd | erd-binding |
| step-route | Route | One Account and one Model, with the exact upstream model ID and the protocols qualified for that pairing.[](source:route-concept)[](source:route-struct) | model-erd | erd-route |
| step-model | Model | One canonical upstream product, independent of any Account, protocol or client selection.[](source:model-struct) | model-erd | erd-model |
| step-account | Account | A provider's endpoints and, when authentication needs one, a Token slot; configuration and manifests never contain the Token.[](source:account-concept)[](source:account-struct) | model-erd | erd-account |
| step-token | Account Token | Kept in the selected store, outside the configuration and every client file.[](source:token-storage) | model-erd | erd-token |

A Native Projection is the AIGW-owned part of one client's configuration, written from its binding; missing clients stay untouched.[](source:projection-concept)

## What happens in one sync? {#p-sync}

@sequence id=sync-flow title="One sync, as one guarded transaction"
| actor sync-operator | Operator | external |
| actor sync-engine | Synchronizer | backend | source:transaction |
| actor sync-store | Configuration store | database | source:store-commit |
| actor sync-helper | Credential entrypoint | security | source:entrypoint |
| actor sync-files | Client files | frontend | source:restore |
| phase | Preflight |
| sync-operator | sync-engine | aigw sync |
| sync-engine | sync-store | re-read the configuration |
| sync-store | sync-engine | unchanged since read | return |
| sync-engine | sync-files | plan every projection |
| phase | Commit |
| sync-engine | sync-helper | stage a private copy |
| sync-engine | sync-store | commit the configuration |
| sync-engine | sync-files | apply every projection | emphasis |
| sync-engine | sync-helper | confirm the copy |
| phase | On a failure |
| sync-engine | sync-files | restore while each file holds this write |
| sync-engine | sync-store | restore the configuration |
| phase | Report |
| sync-engine | sync-operator | result | return |

@steps id=sync-steps
| step-preflight | Synchronizer | Refuses an invalid configuration, or one changed since it was read, and plans every projection. A failed preflight changes nothing.[](source:transaction)[](source:preflight) | sync-flow | sync-engine | | sync-engine-to-sync-store-1,sync-store-to-sync-engine-1,sync-engine-to-sync-files-1 |
| step-helper | Credential entrypoint | Clients read Tokens through a private, SHA-256-addressed copy of `aigw`; creating it is part of the transaction.[](source:entrypoint)[](source:commit-order) | sync-flow | sync-helper | | sync-engine-to-sync-helper-1,sync-engine-to-sync-helper-2 |
| step-commit | Configuration store | The new `config.toml` is committed before any client file, and its exact postimage is kept.[](source:commit-order)[](source:store-commit) | sync-flow | sync-store | | sync-engine-to-sync-store-2 |
| step-restore | Client files | Every write captured its preimage first. On a failure, writes are undone in reverse, and only while each file still holds this write.[](source:transaction-boundary) | sync-flow | sync-files | | sync-engine-to-sync-files-2,sync-engine-to-sync-files-3 |

## What if another writer gets there first? {#p-race}

@sequence id=race-flow title="A newer edit survives the rollback"
| actor race-engine | Synchronizer | backend | source:restore |
| actor race-first | A client file | frontend |
| actor race-editor | Another writer | external |
| actor race-second | A later client file | frontend |
| actor race-operator | Operator | external |
| phase | Apply |
| race-engine | race-first | write the postimage | emphasis |
| race-editor | race-first | edit the same file |
| race-engine | race-second | write fails |
| phase | Restore |
| race-engine | race-first | compare with the postimage |
| race-first | race-engine | changed | return |
| race-engine | race-operator | keep the edit, report the file | return |

@steps id=race-steps
| step-write | A client file | AIGW writes its projection and remembers the exact bytes it wrote. | race-flow | race-first | | race-engine-to-race-first-1 |
| step-edit | Another writer | Someone edits the same file before the change has finished. | race-flow | race-editor | | race-editor-to-race-first-1 |
| step-refuse | Synchronizer | A later write fails, so AIGW restores in reverse. The file no longer holds its write, so it refuses: `postimage changed`, `refusing to overwrite newer state`.[](source:restore) | race-flow | race-engine | | race-engine-to-race-first-2,race-first-to-race-engine-1 |
| step-report | Operator | The failure names the file. The newer edit stays, and independent restores continue.[](source:transaction-boundary) | race-flow | race-operator | | race-engine-to-race-operator-1 |

@callout level=warning title="A guard, not a lock"
| These checks keep detected newer writes. They are best-effort file guards, not a cross-process compare-and-swap with an editor that ignores AIGW's mutation lock.[](source:transaction-boundary)[](source:store-lock) |

## Where does a client's Token come from? {#p-token}

A projection names the credential helper and a projection fingerprint, never the Token itself.[](source:helper-projection)[](source:token-storage)

@sequence id=token-flow title="A Token, read on demand"
| actor token-client | Native client | frontend |
| actor token-helper | Credential helper | backend | source:credential |
| actor token-store | Token store | security | source:token-store |
| actor token-endpoint | Provider endpoint | external |
| token-client | token-helper | client + projection fingerprint |
| token-helper | token-store | read the Account Token |
| token-store | token-helper | Token | return |
| token-helper | token-client | Token on standard output | return |
| token-client | token-endpoint | request with the Token | emphasis |
| token-endpoint | token-client | response | return |

@steps id=token-steps
| step-match | Credential helper | Validates the requested projection and writes only its Token to standard output. The fingerprint names a Client Binding; it does not authorize the caller.[](source:credential) | token-flow | token-helper | | token-client-to-token-helper-1,token-helper-to-token-client-1 |
| step-read | Token store | With the platform credential service, each read runs in a subprocess with a five-second deadline. An unavailable store fails closed, and no other store is tried.[](source:token-store) | token-flow | token-store | | token-helper-to-token-store-1,token-store-to-token-helper-1 |
| step-call | Provider endpoint | The client sends its own request; AIGW is not on the request path.[](source:boundary) | token-flow | token-endpoint | | token-client-to-token-endpoint-1,token-endpoint-to-token-client-1 |

## How much does each check prove? {#p-ready}

AIGW's output answers three questions: what is selected, whether it is ready, and the next safe action.[](source:experience-questions)

@steps id=ready-steps
| step-status | aigw status | Reports the selection and local projection readiness, without reading Tokens or running a client.[](source:experience-readiness) |
| step-endpoint | aigw check --endpoint-only | Checks each endpoint without inference.[](source:readme-check) |
| step-inference | aigw check | Sends one request with the Route's exact model per enabled client, which may use provider quota.[](source:readme-check)[](source:experience-readiness) |
| step-verify | aigw verify --for all | Runs a real session in each client; a full pass records the checkpoint that `aigw rollback` restores first.[](source:verify-checkpoint)[](source:rollback-checkpoint) |

| State             | Meaning                                                                                                   |
| ----------------- | --------------------------------------------------------------------------------------------------------- |
| configured        | Local prerequisites pass, without an endpoint observation.                                                |
| endpoint checked  | An endpoint diagnostic succeeded; model inference and real-client runs are not proven.                    |
| inference checked | A request with the Route's exact model succeeded; client behavior and future availability are not proven. |
| deferred          | A credential or projection was postponed on purpose.                                                      |
| degraded          | The Route stays configured but has a recoverable problem.                                                 |
| invalid           | Configuration or owned state is unsafe to use.                                                            |
| unavailable       | A required external capability is missing.                                                                |

Setup, synchronization, inspection and verification all report in these states.[](source:readiness)

## How does a provider's model become a Route? {#p-route}

Provider catalogs are observations, not configuration. A model reaches a client only through a reviewed Route.[](source:catalog-states)

@diagram lifecycle id=route-life source=route.lifecycle.json

@steps id=route-steps
| step-observed | Observed | One successful, protocol-scoped catalog response; membership proves no capability.[](source:catalog-states) | route-life | route-observed |
| step-candidate | Candidate | An observed upstream ID with no matching Route on that Account and protocol.[](source:catalog-states) | route-life | route-candidate |
| step-qualified | Qualified | Explicit protocol and real-client evidence for named capabilities. Chat Completions success does not qualify Responses.[](source:catalog-states)[](source:catalog-qualify) | route-life | route-qualified |
| step-admitted | Admitted | A reviewed Route in configuration, which clients can bind.[](source:catalog-states) | route-life | route-admitted |
| step-deprecated | Deprecated | Kept for an existing binding, but never recommended again.[](source:catalog-states) | route-life | route-deprecated |
| step-retired | Retired | Removed after no binding or recommendation needs it.[](source:catalog-states) | route-life | route-retired |

## Which parts keep the clients in step? {#p-parts}

`aigw setup`, `use`, `sync`, `rollback` and `uninstall` all reach the clients through one synchronization path.

@diagram architecture id=parts-map source=parts.architecture.json

@steps id=parts-steps
| step-synchronization | Synchronization | Plans every projection, commits the configuration, then applies the projections, as one transaction.[](source:preflight)[](source:commit-order) | parts-map | parts-sync |
| step-store | Configuration store | Owns `config.toml`, its lock and its rollback copies, and keeps the exact file it wrote, for a guarded rollback.[](source:store-owner)[](source:store-commit) | parts-map | parts-store |
| step-seam | Adapter seam | One contract for every client: discover, converge, plan, apply, inspect, verify and withdraw.[](source:seam) | parts-map | parts-seam |
| step-codex | Codex | A bounded region of `~/.codex/config.toml`, and its model catalog. | parts-map | parts-codex |
| step-claude-code | Claude Code | `~/.claude/settings.json`: endpoint, model preference and credential helper. | parts-map | parts-claude-code |
| step-claude-desktop | Claude Desktop | Its separate third-party inference library. | parts-map | parts-claude-desktop |
| step-hermes | Hermes | Its provider catalog, protocol and model. | parts-map | parts-hermes |

## Why one guarded transaction? {#p-decision}

One change may touch several clients. DR-0006 weighed three ways to write them.[](source:decision)[](source:rejected)

| Approach                      | What a failure leaves                                 | Decision                |
| ----------------------------- | ----------------------------------------------------- | ----------------------- |
| Sequential best-effort writes | Clients see part of the new state.                    | Rejected {bad:Rejected} |
| Unconditional rollback        | A newer writer's bytes can be overwritten.            | Rejected {bad:Rejected} |
| One guarded transaction       | Owned writes are restored only while they still hold. | Chosen {good:Chosen}    |

The decision record names one reason to revisit it: every client projection moving behind one stronger atomic store with the same protections.[](source:revisit)

## What does AIGW own, and what does it leave to others? {#p-owners}

AIGW answers one question of four, and leaves the others to the products built for them.[](source:research-responsibilities)[](source:research-restraint)

| Responsibility        | Its question                                       | Owner                         |
| --------------------- | -------------------------------------------------- | ----------------------------- |
| Configuration control | What should this client use?                       | AIGW {good:AIGW}              |
| Request execution     | How does a request reach a compatible service?     | Clients, gateways and proxies |
| Session continuity    | Does an ongoing task keep its meaning?             | Each client                   |
| Organizational access | Who may consume which resources, at whose expense? | Shared gateways               |

@facts
| Codex | Conversations, JSONL, SQLite and Desktop interface state[](source:owners) |
| Claude Code | Sessions and unrelated settings[](source:readme-boundaries) |
| Compatible endpoints | Their own operation; AIGW never installs, starts, stops or diagnoses them[](source:readme-boundaries) |
| New clients | Each needs its own Adapter admission; a provider's protocol support never admits a client[](source:adapter-admission) |

## How is AIGW installed, updated and rolled back? {#p-release}

@facts
| Install | A signed, notarized Homebrew cask, or portable archives for Darwin, Linux and Windows on AMD64 and ARM64.[](source:readme-install) |
| Update | A portable update checks `checksums.txt.sig` against the release key built into AIGW before hashing, extracting or running anything.[](source:readme-update-trust) |
| Peers | GitLab and GitHub are independent; a release is never assembled from both.[](source:readme-update-trust) |
| Roll back | The predecessor must read an isolated copy of the configuration first, or the program and configuration stay unchanged.[](source:readme-rollback) |
| Uninstall | Withdraws AIGW's client projections; Accounts, Routes, Bindings, Tokens and your own client state remain.[](source:readme-uninstall) |

## What is delivered, and what is still open? {#p-maturity}

Release support covers only clients with completed native evidence.[](source:readme-adapters)

| Area                          | State                                 | What that means                                                                                                                                                 |
| ----------------------------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Codex, Claude Code and Hermes | Accepted {good:Real clients}          | A release journey upgrades, rolls back and re-upgrades each real client against the published predecessor; a missing client fails.[](source:acceptance-journey) |
| Claude Desktop                | Separate {good:Own evidence}          | Desktop needs its own qualification; CLI evidence cannot replace it.[](source:acceptance-journey)                                                               |
| Hermes on Windows             | Not verified {caution:Pending}        | Verification refuses to start Hermes until its native launcher can be isolated.[](source:acceptance-windows)                                                    |
| File guards                   | Best effort {caution:Guard, not lock} | They keep detected newer writes, but are not a cross-process compare-and-swap.[](source:transaction-boundary)                                                   |
