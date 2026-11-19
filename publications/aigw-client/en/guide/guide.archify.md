# How does AIGW keep every AI client of a team in step with one reviewed configuration? {#guide}

AIGW is a local-first control plane for a team's AI clients.[](source:readme-what) It keeps reviewed providers, models and client selections in one locked file, `aigw.toml`, and writes only its own settings into each client it supports, as one guarded transaction.[](source:store-owner)[](source:transaction) It never carries a request: each client reads its Token on demand and calls its endpoint itself.[](source:boundary)

- [It controls configuration, not traffic](block:p-owners): request execution, session continuity and team access stay with clients and gateways.[](source:research-boundary)[](source:research-restraint)
- [A failed sync restores only what it wrote](block:p-race), so a newer edit by another writer survives.[](source:restore)
- [No client file holds a Token](block:p-token): a helper reads it from one selected store when the client asks.[](source:helper-projection)
- [Each check proves one more thing](block:p-ready), and synchronized client files are not an answered request.[](source:experience-readiness)

@answer scope="AIGW v0.8.3 · commit fbec6f9 · its source and its own documents"
@meta locale=en style=editorial
@source readme-what title="What AIGW is" path="README.md" lines=3:6
@source readme-install title="Install" path="README.md" lines=30:42
@source readme-team title="Applying a team file" path="README.md" lines=125:138
@source readme-connect title="Connecting one provider" path="README.md" lines=138:145
@source readme-activate title="Activating later" path="README.md" lines=155:162
@source readme-use title="What use adds" path="README.md" lines=120:121
@source readme-sync title="What sync changes" path="README.md" lines=173:179
@source readme-credentials title="Credential storage" path="README.md" lines=181:186
@source readme-depths title="The four check depths" path="README.md" lines=213:220
@source readme-model title="The product model" path="README.md" lines=261:272
@source readme-adapters title="Supported clients" path="README.md" lines=274:280
@source readme-boundaries title="Boundaries" path="README.md" lines=288:300
@source readme-rollback title="Program rollback" path="README.md" lines=328:333
@source readme-uninstall title="Uninstall" path="README.md" lines=357:362
@source readme-update-trust title="Signed updates" path="README.md" lines=368:375
@source readme-check title="Checking without inference" path="README.md" lines=24:26
@source concepts title="Three nouns" path="docs/concepts/product-concepts.md" lines=11:14
@source provider-concept title="Provider" path="docs/concepts/product-concepts.md" lines=46:61
@source model-concept title="Model" path="docs/concepts/product-concepts.md" lines=63:80
@source family-concept title="Family" path="docs/concepts/product-concepts.md" lines=82:86
@source selection-concept title="Client selection" path="docs/concepts/product-concepts.md" lines=88:107
@source client-files-concept title="Client files" path="docs/concepts/product-concepts.md" lines=109:121
@source catalog-states title="The provider catalog lifecycle" path="docs/concepts/product-concepts.md" lines=149:162
@source catalog-qualify title="Qualification and removal" path="docs/concepts/product-concepts.md" lines=164:170
@source provider-struct title="Provider in configuration" path="internal/domain/model.go" lines=78:85
@source family-struct title="Family in configuration" path="internal/domain/model.go" lines=87:92
@source model-struct title="Model in configuration" path="internal/domain/model.go" lines=94:105
@source selection-struct title="A client's selection in configuration" path="internal/domain/clients.go" lines=236:254
@source research-responsibilities title="Four responsibilities" path="docs/research/provider-tooling-assessment.md" lines=48:57
@source research-boundary title="A narrower boundary" path="docs/research/provider-tooling-assessment.md" lines=204:207
@source research-restraint title="Not another workbench" path="docs/research/provider-tooling-assessment.md" lines=211:219
@source research-value title="AIGW's value hypothesis" path="docs/research/provider-tooling-assessment.md" lines=231:235
@source experience-questions title="Three questions" path="docs/experience/terminal-experience.md" lines=11:15
@source experience-readiness title="Readiness, decomposed" path="docs/experience/terminal-experience.md" lines=17:27
@source adapter-admission title="Two admissions" path="docs/governance/adapter-admission.md" lines=13:23
@source acceptance-journey title="Real-client release journey" path="docs/operations/real-client-acceptance.md" lines=69:79
@source acceptance-windows title="Hermes on Windows" path="docs/operations/real-client-acceptance.md" lines=39:41
@source rollout-intro title="Team rollout" path="docs/guides/team-rollout.md" lines=11:13
@source rollout-maintainer title="The maintainer's steps" path="docs/guides/team-rollout.md" lines=15:29
@source boundary title="Authority and projection boundary" path="docs/architecture/authority-and-projection-boundary.md" lines=38:41
@source owners title="Who owns which state" path="docs/architecture/authority-and-projection-boundary.md" lines=48:59
@source transaction title="The synchronization transaction" path="internal/app/synchronization/transaction.go" lines=41:54
@source preflight title="The preflight" path="internal/app/synchronization/transaction.go" lines=56:71
@source commit-order title="Entry point, configuration, then client files" path="internal/app/synchronization/transaction.go" lines=75:97
@source transaction-boundary title="The transaction boundary" path="docs/architecture/security-model.md" lines=198:212
@source restore title="The guarded restore" path="internal/platform/files.go" lines=197:211
@source store-commit title="Committing the configuration" path="internal/store/store.go" lines=79:82
@source store-owner title="What the store owns" path="internal/store/store.go" lines=1:3
@source store-lock title="The mutation lock" path="internal/store/store.go" lines=181:200
@source seam title="The adapter contract" path="internal/adapter/registry.go" lines=93:106
@source entrypoint title="The credential entrypoint" path="docs/architecture/security-model.md" lines=72:80
@source credential title="The credential protocol" path="docs/architecture/security-model.md" lines=137:145
@source token-storage title="Where Tokens live" path="docs/architecture/security-model.md" lines=13:16
@source token-store title="Reading the selected store" path="docs/architecture/security-model.md" lines=38:44
@source helper-projection title="Claude Desktop's client files" path="internal/adapter/claudedesktop/adapter.go" lines=231:245
@source check-depths title="The ladder of check depths" path="internal/cli/check/depth.go" lines=15:34
@source verify-snapshot title="When a check writes the verified snapshot" path="internal/cli/check/snapshot.go" lines=20:32
@source rollback-snapshot title="What config rollback restores" path="internal/cli/config/rollback.go" lines=101:111
@source decision title="DR-0006: one guarded transaction" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=15:30
@source rejected title="DR-0006: rejected alternatives" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=32:37
@source revisit title="DR-0006: when to revisit" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=45:48
@source readiness title="The readiness states" path="internal/app/readiness/state.go" lines=1:27
@source readme-for title="The clients aigw takes" path="README.md" lines=169:169
@source readme-environment title="Environment Tokens" path="README.md" lines=188:190
@source manifest-provider title="A provider in the team file" path="manifests/team.toml" lines=1:18
@source changelog-010 title="The 0.1.0 release" path="CHANGELOG.md" lines=1252:1260
@source changelog-083 title="The 0.8.3 release" path="CHANGELOG.md" lines=14:60
@source setup-model-kept title="A model preference kept at the first setup" path="CHANGELOG.md" lines=250:254
@source team-labels title="The labels a team file replaces" path="CHANGELOG.md" lines=255:257
@source check-parent-session title="A client check inside an agent session" path="CHANGELOG.md" lines=258:262
@source check-names title="Environment variable names on Windows" path="CHANGELOG.md" lines=264:266
@source check-client-report title="A client's own warning or error" path="CHANGELOG.md" lines=212:223
@source check-codex-memory title="Codex's memory work in a client check" path="CHANGELOG.md" lines=224:225
@source redaction-forms title="The credential forms that redaction covers" path="CHANGELOG.md" lines=226:230
@source check-schema title="The JSON document of aigw check" path="CHANGELOG.md" lines=234:238
@source team-lines title="The newest model of every line" path="CHANGELOG.md" lines=239:241
@source keychain-foreign title="A Keychain item that another program stored" path="CHANGELOG.md" lines=145:170
@source rollback-credentials title="A program rollback moves no credential" path="CHANGELOG.md" lines=177:181
@source keychain-migration title="No command migrates a Keychain item" path="CHANGELOG.md" lines=182:188
@source token-empty title="A stored Token that is empty" path="CHANGELOG.md" lines=195:202
@source team-per-provider title="Models chosen per provider" path="CHANGELOG.md" lines=71:75
@source team-selection title="What applying a team file selects" path="internal/cli/setup/team.go" lines=72:77
@source model-label title="The label a model derives" path="internal/domain/model.go" lines=532:571
@source label-shared title="Two models of one provider with one label" path="internal/domain/model_validation.go" lines=87:100
@source label-refusal title="What the refusal of a shared label names" path="internal/domain/model_errors.go" lines=69:80
@source team-label-refusal title="A team file refused for a shared label" path="internal/cli/setup/team.go" lines=192:205
@source family-created title="A family that model add creates" path="internal/cli/model/add.go" lines=204:218
@source family-edited title="A family that model edit creates" path="internal/cli/model/edit.go" lines=101:104
@source model-name title="A model's name without its provider" path="internal/domain/model.go" lines=145:159
@source codex-alias title="The alias in Codex's model catalog" path="internal/adapter/codex/modelcatalog/document.go" lines=66:100
@source codex-alias-name title="The name that Codex's alias is given" path="internal/adapter/codex/reconcile.go" lines=307:307
@source hermes-yaml title="The YAML library" path="go.mod" lines=22:22
@source hermes-encode title="How Hermes's configuration is written" path="internal/adapter/hermes/document.go" lines=115:120
@source hermes-blocks title="Literal blocks in Hermes's configuration" path="CHANGELOG.md" lines=93:98
@source hermes-folded title="Folded block scalars in Hermes's configuration" path="CHANGELOG.md" lines=115:117
@source team-apply title="Applying a team file whatever becomes of each Token" path="internal/cli/setup/team.go" lines=207:211
@source team-acquire title="The Tokens that setup asks for" path="internal/cli/setup/team_tokens.go" lines=14:21
@source team-choose title="The question of which providers' Tokens you hold" path="internal/cli/setup/team_tokens.go" lines=60:62
@source team-askable title="The providers that the question offers" path="internal/cli/setup/team_tokens.go" lines=89:92
@source team-token-read title="A provider that is skipped or a Token that is not accepted" path="internal/cli/setup/team_tokens.go" lines=157:165
@source prompt-cancelled title="A cancelled prompt" path="internal/cli/invocation/failure.go" lines=78:84
@source exit-failure title="The exit status of a failed command" path="cmd/aigw/main.go" lines=37:40
@source team-schema title="The JSON document of aigw setup --from" path="internal/cli/setup/team.go" lines=23:27
@source team-token-states title="The states of a provider's Token after team setup" path="internal/cli/setup/team.go" lines=29:43
@source team-token-item title="A Token's state and reason in the document" path="internal/cli/setup/team_report.go" lines=125:133
@source token-refusal title="A provider's refusal of a Token" path="CHANGELOG.md" lines=37:40
@source token-validate title="How setup validates a Token" path="internal/cli/setup/team.go" lines=403:409
@source token-catalog-request title="The provider catalog request" path="internal/domain/probe.go" lines=34:36
@source token-limit title="The known limit of Token validation" path="CHANGELOG.md" lines=52:60
@source team-suheai title="Suhe.AI in the team file" path="manifests/team.toml" lines=421:424
@source team-recommendations title="The team file's recommendations" path="manifests/team.toml" lines=670:700
@source team-export-arrays title="Wide arrays in an exported team file" path="internal/store/file.go" lines=313:332

## Who uses AIGW, and what does it touch? {#p-context}

AIGW's value hypothesis: a team member with any one supported provider credential reaches a usable client configuration, understands it and safely withdraws it.[](source:research-value)

@facts
| Clients | `claude`, `claude-desktop`, `codex` and `hermes`, the values `<client>` takes |
| Token store | The platform credential service when available, else one local fallback; an explicit `AIGW_SECRET_BACKEND` of `keyring`, `file` or `env` fails closed |
| Environment Tokens | Read-only, from `AIGW_TOKEN_<PROVIDER>`; the client process must inherit the same environment |

AIGW fixes these values.[](source:readme-for)[](source:readme-credentials)[](source:readme-environment) A team curates a team file of only reviewed provider endpoints and qualified models, without Tokens.[](source:rollout-maintainer)

AIGW ships its own team file, where each provider keeps, for every Claude, GPT and Gemini line, the newest model that it lists and that qualifies there.[](source:team-lines)[](source:team-per-provider) It names four providers, DMXAPI, UCloud, AIHubMix and Suhe.AI, and recommends for each client a model on each of them.[](source:team-suheai)[](source:team-recommendations) Below is the start of the shipped `manifests/team.toml`: its version and one provider with two of its models.[](source:manifest-provider)

@code id=provider source=manifest-provider language=toml

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-maintainer | Team maintainer | Curates a reviewed, token-free team file and publishes it from a tag or commit, not a moving branch.[](source:rollout-maintainer) | context-map | ctx-maintainer |
| step-ctx-member | Team member | Applies that team file and connects only the providers whose Tokens they hold.[](source:readme-team) | context-map | ctx-member |
| step-ctx-control | AIGW control plane | Keeps providers, their Tokens and their models, and points each client at one model; it relays no requests, runs no gateway and owns no conversation state.[](source:readme-what) | context-map | ctx-control |
| step-ctx-clients | Supported clients | Codex, Claude Code, Claude Desktop and Hermes; AIGW writes only its own settings into their files. Release support needs completed native evidence.[](source:readme-what)[](source:readme-adapters) | context-map | ctx-clients |
| step-ctx-store | Token store | The platform credential service, a local fallback or a read-only environment; an explicit choice fails closed.[](source:readme-credentials) | context-map | ctx-store |
| step-ctx-endpoints | Provider endpoints | A direct URL or an independently operated compatible endpoint; AIGW stores the choice and never operates the service.[](source:readme-boundaries) | context-map | ctx-endpoints |

## How does a team get started? {#p-team}

A team distributes a reviewed public team file, and each member supplies Tokens locally.[](source:rollout-intro)

@diagram workflow id=rollout-flow source=rollout.workflow.json

@steps id=rollout-steps
| step-curate | Curate the team file | Only reviewed provider endpoints and qualified models; no Tokens, personal paths, identities or release credentials.[](source:rollout-maintainer) | rollout-flow | rollout-curate |
| step-publish | Publish at a tag | From a release tag or immutable commit, so every member receives the same file.[](source:rollout-maintainer) | rollout-flow | rollout-publish |
| step-install | Install AIGW | A signed, notarized Homebrew cask on macOS, or a portable archive for macOS, Linux and Windows that `aigw self install` installs.[](source:readme-install) | rollout-flow | rollout-install |
| step-import | Apply the team file | Applying it needs neither every provider Token nor an installed client.[](source:readme-team) From the recommendations, it selects a model only for a client that has none, so a client's existing selection stays.[](source:team-selection) Its preview, its result and `--json` list every label that the file replaces, for providers, families and models, with the old and the new value.[](source:team-labels) | rollout-flow | rollout-import |
| step-connect | Connect one provider | Name only the provider you hold; the others stay available without becoming prerequisites.[](source:readme-connect)[](source:readme-activate) | rollout-flow | rollout-connect |
| step-check | Sync and check | `aigw sync` updates every enabled client whose model, authentication and client files are available, and never creates a missing client.[](source:readme-sync) | rollout-flow | rollout-check |

`aigw setup --from` applies the team file whatever becomes of each Token.[](source:team-apply) In a terminal, a command that names no provider first asks which providers' Tokens you hold.[](source:team-acquire)[](source:team-choose) It offers the file's providers without a stored Token, and you may choose none.[](source:team-askable)[](source:team-choose) It then asks only for those Tokens, and Enter alone skips a provider.[](source:team-acquire)[](source:team-token-read)

A Token that its provider does not accept can be entered again, or its provider skipped.[](source:team-token-read) The command reports that provider with its reason and fix, and still writes the team file, the accepted Tokens and the client files in one transaction.[](source:team-apply)

A prompt that you cancel ends the command before any write.[](source:prompt-cancelled) A piped Token that its provider does not accept does not prevent the write, and the command exits 1.[](source:team-apply)[](source:exit-failure)

`aigw setup --from --json` writes a document with `schema_version` 4.[](source:team-schema) A Token's `state` there may be `rejected`, when its provider refused it, or `unverified`, when its validation got no verdict, each with a `reason`.[](source:team-token-states)[](source:team-token-item) When a provider refuses a Token, the report names that provider and the HTTP status.[](source:token-refusal)

`aigw setup --from` validates a Token with one request to the provider's catalog.[](source:token-validate)[](source:token-catalog-request) A provider whose catalog answers every Token cannot refuse a wrong one in that request, so the command reports such a Token as accepted.[](source:token-limit) `aigw check` sends an inference request for each client's selected model. It shows a wrong Token once a client selects a model of that provider.[](source:token-limit)

- [ ] Save the reviewed `team.toml` from your team's tag, not a moving branch.[](source:rollout-maintainer)
- [ ] Run `aigw setup --from team.toml --provider <provider>` for the provider whose Token you hold.[](source:readme-connect)
- [ ] Run `aigw check --depth endpoint`, then `aigw check`, then `aigw check --depth client`.[](source:experience-readiness)

## What does AIGW's configuration hold? {#p-model}

A client selects one model, named `provider/model`. The provider holds the endpoints and the Token, and the Token stays in a separate store.[](source:concepts) There is no global model choice: `aigw use <client> <provider/model>` changes exactly one client.[](source:readme-model)

@diagram erd id=model-erd source=model.erd.json

@steps id=model-steps
| step-selection | Client selection | One client's model, enabled intent, protocol and authentication; no global default, inheritance or fallback across clients.[](source:selection-concept)[](source:selection-struct) | model-erd | erd-selection |
| step-model | Model | What one provider serves, named `provider/model`: the provider's own model ID, byte for byte, and the protocols on which AIGW may use it.[](source:model-concept)[](source:model-struct) | model-erd | erd-model |
| step-family | Family | Optional: the canonical model that a provider's model is, so that variants and providers can be compared.[](source:family-concept)[](source:family-struct) A family that `aigw model add --family` or `aigw model edit --family` creates is labelled with its own ID.[](source:family-created)[](source:family-edited) | model-erd | erd-family |
| step-provider | Provider | A service you hold a Token for: its endpoints, one per protocol, and a Token slot when authentication needs one. Configuration and team files never contain the Token.[](source:provider-concept)[](source:provider-struct) | model-erd | erd-provider |
| step-token | Token | Kept in the selected store, outside the configuration and every client file.[](source:token-storage) | model-erd | erd-token |

A model with no `label` of its own derives one from its provider's label and its family's. For a model whose ID begins or ends with its family's ID and adds more, that label also carries the rest of the ID.[](source:model-label) AIGW refuses a configuration or a team file in which two models of one provider have one label, derived or explicit, ignoring case.[](source:label-shared)[](source:team-label-refusal) The refusal names both models and the label.[](source:label-refusal)

Client files are the part of one client's own configuration that AIGW owns. AIGW writes and withdraws only its settings there, and missing and unselected clients stay untouched.[](source:client-files-concept)

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
| sync-engine | sync-files | plan every client's files |
| phase | Commit |
| sync-engine | sync-helper | stage a private copy |
| sync-engine | sync-store | commit the configuration |
| sync-engine | sync-files | write every client's files | emphasis |
| sync-engine | sync-helper | confirm the copy |
| phase | On a failure |
| sync-engine | sync-files | restore while each file holds this write |
| sync-engine | sync-store | restore the configuration |
| phase | Report |
| sync-engine | sync-operator | result | return |

@steps id=sync-steps
| step-preflight | Synchronizer | Refuses an invalid configuration, or one changed since it was read, and plans the writes to every client's files. A failed preflight changes nothing.[](source:transaction)[](source:preflight) | sync-flow | sync-engine | | sync-engine-to-sync-store-1,sync-store-to-sync-engine-1,sync-engine-to-sync-files-1 |
| step-helper | Credential entrypoint | Clients read Tokens through a private, SHA-256-addressed copy of `aigw`; creating it is part of the transaction.[](source:entrypoint)[](source:commit-order) | sync-flow | sync-helper | | sync-engine-to-sync-helper-1,sync-engine-to-sync-helper-2 |
| step-commit | Configuration store | The new `aigw.toml` is committed before any client file, and its exact postimage is kept.[](source:commit-order)[](source:store-commit) | sync-flow | sync-store | | sync-engine-to-sync-store-2 |
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
| step-write | A client file | AIGW writes its settings and remembers the exact bytes it wrote. | race-flow | race-first | | race-engine-to-race-first-1 |
| step-edit | Another writer | Someone edits the same file before the change has finished. | race-flow | race-editor | | race-editor-to-race-first-1 |
| step-refuse | Synchronizer | A later write fails, so AIGW restores in reverse. The file no longer holds its write, so it refuses: `postimage changed`, `refusing to overwrite newer state`.[](source:restore) | race-flow | race-engine | | race-engine-to-race-first-2,race-first-to-race-engine-1 |
| step-report | Operator | The failure names the file. The newer edit stays, and independent restores continue.[](source:transaction-boundary) | race-flow | race-operator | | race-engine-to-race-operator-1 |

@callout level=warning title="A guard, not a lock"
| These checks keep detected newer writes. They are best-effort file guards, not a cross-process compare-and-swap with an editor that ignores AIGW's mutation lock.[](source:transaction-boundary)[](source:store-lock) |

## Where does a client's Token come from? {#p-token}

A client's files name the credential helper and a fingerprint of the client, provider and endpoint, never the Token itself.[](source:helper-projection)[](source:credential)[](source:token-storage)

@sequence id=token-flow title="A Token, read on demand"
| actor token-client | Native client | frontend |
| actor token-helper | Credential helper | backend | source:credential |
| actor token-store | Token store | security | source:token-store |
| actor token-endpoint | Provider endpoint | external |
| token-client | token-helper | client + fingerprint |
| token-helper | token-store | read the provider's Token |
| token-store | token-helper | Token | return |
| token-helper | token-client | Token on standard output | return |
| token-client | token-endpoint | request with the Token | emphasis |
| token-endpoint | token-client | response | return |

@steps id=token-steps
| step-match | Credential helper | Checks the request and writes only its Token to standard output. The fingerprint names a client, provider and endpoint; it does not authorize the caller.[](source:credential) | token-flow | token-helper | | token-client-to-token-helper-1,token-helper-to-token-client-1 |
| step-read | Token store | With the platform credential service, each read runs in a subprocess with a five-second deadline. An unavailable store fails closed, and no other store is tried.[](source:token-store) | token-flow | token-store | | token-helper-to-token-store-1,token-store-to-token-helper-1 |
| step-call | Provider endpoint | The client sends its own request; AIGW is not on the request path.[](source:boundary) | token-flow | token-endpoint | | token-client-to-token-endpoint-1,token-endpoint-to-token-client-1 |

On macOS, AIGW does not take over a Keychain item that 0.3.5 or earlier stored, and no command migrates one.[](source:keychain-foreign)[](source:keychain-migration) macOS refuses AIGW the read of such an item, and AIGW does not replace an item that it cannot read. A command that needs the credential, such as `aigw use` or `aigw client enable`, ends there. It says that another program stored the item and names the fix: have the credential at hand, delete the item, then store it again.[](source:keychain-foreign)

`aigw sync` and `aigw config rollback` complete, and so does `aigw setup --from` for a provider that it does not name. They leave the client of such a provider waiting, with its files unchanged, as they do for a missing Token. `aigw check --depth local` and `aigw status` report such an item instead of counting it as a stored Token.[](source:keychain-foreign) A stored Token that is empty also counts as a missing Token where a client's files are written.[](source:token-empty)

## How much does each check prove? {#p-ready}

AIGW's output answers three questions: what is selected, whether it is ready, and the next safe action.[](source:experience-questions)

@steps id=ready-steps
| step-status | aigw status | Reports each client's model and whether its client files are ready, without reading Tokens or running a client.[](source:experience-readiness) |
| step-endpoint | aigw check --depth endpoint | Checks each endpoint with one request that names no model.[](source:readme-check)[](source:readme-depths) |
| step-inference | aigw check | The default depth sends one bounded inference request per checked client, which may use provider quota.[](source:readme-check)[](source:experience-readiness) |
| step-session | aigw check --depth client | Runs a real session in each enabled client, started without the variables of a parent agent session.[](source:readme-depths)[](source:check-parent-session) When it names no client and every client passes, it writes the verified snapshot that `aigw config rollback` restores first.[](source:verify-snapshot)[](source:rollback-snapshot) A client-depth check of Codex does not start Codex's memory work, which sends requests for another model than the one being checked.[](source:check-codex-memory) |

| Depth or state | Meaning                                                                                                                                                                                                                                                                                                     |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `local`        | The configuration, the Token's presence, the client files and the environment pass, without a request. A stored Token that is empty counts as missing.[](source:token-empty) A Keychain item that another program stored is reported instead of being counted as a stored Token.[](source:keychain-foreign) |
| `endpoint`     | The provider answers one authenticated request that names no model.                                                                                                                                                                                                                                         |
| `model`        | The selected model answers one bounded inference request. This is the default depth.                                                                                                                                                                                                                        |
| `client`       | A real client session completes.                                                                                                                                                                                                                                                                            |
| configured     | Local prerequisites pass, whatever a check proved beyond them.                                                                                                                                                                                                                                              |
| deferred       | A credential or client files were postponed on purpose.                                                                                                                                                                                                                                                     |
| degraded       | The client stays configured but has a recoverable problem.                                                                                                                                                                                                                                                  |
| invalid        | Configuration or owned state is unsafe to use.                                                                                                                                                                                                                                                              |
| unavailable    | A required external capability is missing.                                                                                                                                                                                                                                                                  |

A check to one depth runs every depth before it.[](source:check-depths) On Windows, `aigw check` compares environment variable names without regard to letter case, so a lower-case `anthropic_auth_token` neither reaches a checked client nor escapes the `local` depth.[](source:check-names) Setup, synchronization, inspection and verification all report in these states, and the depth, not a state, says how much a check proved.[](source:readiness)

When Codex or Claude Code itself reports a warning or an error, `aigw check <client> --depth client` says what to do. It names a configuration key that the client calls deprecated, such as `[features].multi_agent`, and the fix it gives is to remove that key.[](source:check-client-report)

For another report, `--verbose` adds at most four of the client's own lines after AIGW's, without the provider's Token and the known credential forms. A client that authenticates itself, or through an external credential helper, shows no such lines, and the fix is to run the client itself.[](source:check-client-report)

AIGW's redaction covers an `Authorization` header to the end of its line, a cookie header, and a URL's user with or without a password. It also covers a `key`, `sig` or `signature` query parameter and a bare `sk-` key of at least 20 further characters.[](source:redaction-forms) The JSON document of `aigw check` has `schema_version` 4, which adds `clients[].failure.client_report`: the client's own lines behind a failed session, present only with `--verbose`. For such a failure the next step is prose in `next_detail`, and `next_action` is absent.[](source:check-schema)

## What happens to a provider's models over time? {#p-catalog}

Provider catalogs are observations, not configuration. `aigw model search` reads them, and a listed model proves neither inference nor any capability.[](source:catalog-states)

@diagram lifecycle id=catalog-life source=catalog.lifecycle.json

@steps id=catalog-steps
| step-available | available | The provider lists the model, and it is not added.[](source:catalog-states) | catalog-life | cat-available |
| step-added | added | The model is in the configuration, and the provider lists it. `aigw use` adds a listed model, or an unlisted one with `--unlisted`.[](source:catalog-states)[](source:readme-use) | catalog-life | cat-added |
| step-missing | missing | The model is in the configuration, and the provider no longer lists it. AIGW reports it for qualification again; it never renames, deprecates or removes it on its own.[](source:catalog-states)[](source:catalog-qualify) | catalog-life | cat-missing |
| step-deprecated | deprecated | A team file marks the model deprecated. It keeps an existing selection but is not recommended.[](source:catalog-states) | catalog-life | cat-deprecated |

Qualification is separate evidence: explicit protocol and real-client evidence for named capabilities. Chat Completions success does not qualify Responses. `aigw model remove` removes a model once no client selects it.[](source:catalog-qualify)

## Which parts keep the clients in step? {#p-parts}

`aigw setup`, `use`, `sync`, `config rollback` and `self uninstall` all reach the clients through one synchronization path.

@diagram architecture id=parts-map source=parts.architecture.json

@steps id=parts-steps
| step-synchronization | Synchronization | Plans every client's files, commits the configuration, then writes the client files, as one transaction.[](source:preflight)[](source:commit-order) | parts-map | parts-sync |
| step-store | Configuration store | Owns `aigw.toml`, its lock, its backup and its verified snapshot, and keeps the exact file it wrote, for a guarded rollback.[](source:store-owner)[](source:store-commit) `aigw config export` writes each array of a team file that is wider than 100 columns with one element on each line.[](source:team-export-arrays) | parts-map | parts-store |
| step-seam | Adapter seam | One contract for every client: discover, converge, plan, apply, inspect, verify and withdraw.[](source:seam) | parts-map | parts-seam |
| step-codex | Codex | A bounded region of `~/.codex/config.toml`, and its model catalog. In that catalog, the alias that AIGW adds for a model shows the model's label without its provider.[](source:model-name)[](source:codex-alias-name)[](source:codex-alias) Where another entry already shows that name, the model's ID follows it in parentheses.[](source:codex-alias) | parts-map | parts-codex |
| step-claude-code | Claude Code | `~/.claude/settings.json`: endpoint, model preference and credential helper. The first `aigw setup` after an upgrade from 0.6.1 accepts settings in which you changed or removed the `model` that 0.6.1 wrote. It keeps your choice while the provider and endpoint stay the same.[](source:setup-model-kept) | parts-map | parts-claude-code |
| step-claude-desktop | Claude Desktop | Its separate third-party inference library. | parts-map | parts-claude-desktop |
| step-hermes | Hermes | Its provider catalog, protocol and model. AIGW reads and writes Hermes's configuration through `go.yaml.in/yaml/v4`.[](source:hermes-yaml)[](source:hermes-encode) It keeps a literal block for text with trailing spaces and leaves the value of a folded block scalar unchanged.[](source:hermes-blocks)[](source:hermes-folded) | parts-map | parts-hermes |

## Why one guarded transaction? {#p-decision}

One change may touch several clients. DR-0006 weighed three ways to write them.[](source:decision)[](source:rejected)

| Approach                      | What a failure leaves                                 | Decision                |
| ----------------------------- | ----------------------------------------------------- | ----------------------- |
| Sequential best-effort writes | Clients see part of the new state.                    | Rejected {bad:Rejected} |
| Unconditional rollback        | A newer writer's bytes can be overwritten.            | Rejected {bad:Rejected} |
| One guarded transaction       | Owned writes are restored only while they still hold. | Chosen {good:Chosen}    |

The decision record names one reason to revisit it: every client's files moving behind one stronger atomic store with the same protections.[](source:revisit)

## What does AIGW own, and what does it leave to others? {#p-owners}

AIGW answers one question of four, and leaves the others to the products built for them.[](source:research-responsibilities)[](source:research-restraint)

| Responsibility        | Its question                                       | Owner                         |
| --------------------- | -------------------------------------------------- | ----------------------------- |
| Configuration control | What should this client use?                       | AIGW {good:AIGW}              |
| Request execution     | How does a request reach a compatible service?     | Clients, gateways and proxies |
| Session continuity    | Does an ongoing task keep its meaning?             | Each client                   |
| Organizational access | Who may consume which resources, at whose expense? | Shared gateways               |

@facts
| Codex | Conversations, JSONL, SQLite, model metadata and Desktop interface state[](source:owners) |
| Claude Code | Sessions and unrelated settings[](source:readme-boundaries) |
| Compatible endpoints | Their own operation; AIGW never installs, starts, stops or diagnoses them[](source:readme-boundaries) |
| New clients | Each needs its own Adapter admission; a provider's protocol support never admits a client[](source:adapter-admission) |

## How is AIGW installed, updated and rolled back? {#p-release}

@facts
| Install | A signed, notarized Homebrew cask, or portable archives for Darwin, Linux and Windows on AMD64 and ARM64, which `aigw self install` installs.[](source:readme-install) |
| Update | A portable update checks `checksums.txt.sig` against the release key built into AIGW before hashing, extracting or running anything.[](source:readme-update-trust) |
| Peers | Updates read the GitHub release, and GitLab joins only when two environment variables name it. A release is never assembled from both.[](source:readme-update-trust) |
| Roll back | `aigw self rollback` first gives the kept program a copy of the configuration, and changes nothing if that program cannot read it. No release before 0.7.0 reads `aigw.toml`.[](source:readme-rollback) A rollback moves no credential: on macOS, a signed release reads the Keychain items of another signed release. On a Homebrew installation the command is refused like the other program commands, and Homebrew installs the earlier release.[](source:rollback-credentials) |
| Uninstall | `aigw self uninstall` removes AIGW's settings from the client files; providers, models, client selections, Tokens and your own client state remain.[](source:readme-uninstall) |

## How did AIGW get here? {#p-history}

AIGW released v0.1.0 on 19 September 2026 and v0.8.3, the version this page describes, on 19 November 2026.[](source:changelog-010)[](source:changelog-083) The timeline shows nineteen releases that changed what AIGW does for its users, and the last panel lists what is still open.

@diagram timeline id=history source=history.timeline.json title="How AIGW got here"

## What is delivered, and what is still open? {#p-maturity}

Release support covers only clients with completed native evidence.[](source:readme-adapters)

| Area                          | State                                 | What that means                                                                                                                                                 |
| ----------------------------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Codex, Claude Code and Hermes | Accepted {good:Real clients}          | A release journey upgrades, rolls back and re-upgrades each real client against the published predecessor; a missing client fails.[](source:acceptance-journey) |
| Claude Desktop                | Separate {good:Own evidence}          | Desktop needs its own qualification; CLI evidence cannot replace it.[](source:acceptance-journey)                                                               |
| Hermes on Windows             | Not verified {caution:Pending}        | Verification refuses to start Hermes until its native launcher can be isolated.[](source:acceptance-windows)                                                    |
| File guards                   | Best effort {caution:Guard, not lock} | They keep detected newer writes, but are not a cross-process compare-and-swap.[](source:transaction-boundary)                                                   |
