# How does ETHOS let people and AI agents change a repository on evidence alone? {#ethos-guide}

ETHOS admits a change only on evidence: an official OpenSpec Change states the intent, fresh facts state the present, and only a passing plan admits an effect.[](source:kernel)[](source:product-kernel) A client's claim, a chat transcript or an earlier success never grants authority, because each effect rechecks it.[](source:mcp-authority)[](source:non-authorizing) The same small kernel governs ETHOS itself and every repository that adopts it.[](source:isomorphic)

- [It owns one judgment](block:p-context): whether a change may be admitted. Git, OpenSpec, CI and your other tools stay native.[](source:custom-code)[](source:native)
- [Any agent can resume a lane](block:p-lane) from Git, OpenSpec, fresh facts and Attestations, without a retelling.[](source:recovery)[](source:resume)
- [Every effect is compiled, judged, freshly admitted and applied by exact compare-and-swap](block:p-plan).[](source:invariants)
- [Each kind of evidence proves only its own plane](block:p-evidence), so local proof is not anti-forgery assurance.[](source:planes)[](source:proof-boundary)

@answer scope="ETHOS v0.2.0-alpha.28 · commit 424d325 · its source and its own documents · proof timings measured on 2026-11-03"
@meta locale=en style=editorial repo_url="https://github.com/HengYangDS/ethos.git" repo_revision=424d325386784633839b1abf52a4ac394e412a76
@source kernel title="The kernel" path="README.md" lines=100:107
@source native title="What stays native" path="README.md" lines=26:29
@source visibility title="Visibility is not authority" path="README.md" lines=91:93
@source isomorphic title="Isomorphic governance" path="README.md" lines=33:38
@source status title="The bounded reader" path="README.md" lines=56:58
@source maturity-readme title="The kernel and the complete promise" path="README.md" lines=18:24
@source product-kernel title="The trust kernel" path="docs/governance/product-design-contract.md" lines=25:30
@source promise title="The promise" path="docs/governance/product-design-contract.md" lines=32:36
@source root-constraint title="Root constraint" path="docs/governance/product-design-contract.md" lines=44:51
@source custom-code title="Where ETHOS writes its own code" path="docs/governance/product-design-contract.md" lines=56:63
@source carrier title="OpenSpec, the only intent carrier" path="docs/governance/product-design-contract.md" lines=119:126
@source continuation title="One next action" path="docs/governance/product-design-contract.md" lines=185:191
@source reconcile title="One reconciler for every lane" path="docs/governance/product-design-contract.md" lines=273:277
@source new-entity title="Three questions before a new entity" path="docs/governance/product-design-contract.md" lines=347:357
@source surfaces title="The public surfaces" path="docs/governance/product-design-contract.md" lines=368:378
@source experience title="Experience as a kernel property" path="docs/governance/product-design-contract.md" lines=380:392
@source planes title="Evidence planes" path="docs/governance/product-design-contract.md" lines=498:502
@source independent title="When independent verification applies" path="docs/governance/product-design-contract.md" lines=504:508
@source non-authorizing title="Inputs, not authority" path="docs/governance/product-design-contract.md" lines=532:537
@source invariants title="Invariants" path="docs/governance/product-design-contract.md" lines=586:602
@source axioms title="Engineering axioms" path="system/axioms.md" lines=15:31
@source service title="One application service" path="docs/plans/terminal-governance-product-design.md" lines=394:397
@source recovery title="Recovery from repository evidence" path="docs/plans/terminal-governance-product-design.md" lines=412:414
@source resume title="Another agent resumes" path="docs/plans/terminal-governance-product-design.md" lines=162:166
@source route title="The remaining route" path="docs/plans/terminal-governance-product-design.md" lines=147:151
@source acceptance title="Task-based acceptance" path="docs/plans/terminal-governance-product-design.md" lines=416:420
@source mcp-authority title="Labels and earlier checks grant nothing" path="docs/architecture/mcp-server.md" lines=28:31
@source mcp-open title="MCP conformance still open" path="docs/architecture/mcp-server.md" lines=33:40
@source standards title="Standards enter by adapter" path="docs/architecture/protocol-contracts.md" lines=18:22
@source state-home title="Where state lives" path="docs/architecture/local-state.md" lines=19:27
@source runtime-home title="Runtime and hooks in the common directory" path="docs/architecture/local-state.md" lines=29:34
@source host-store title="The host store" path="docs/architecture/local-state.md" lines=53:57
@source lease-fields title="A Lease's four fields" path="docs/architecture/local-state.md" lines=86:91
@source adopt-writes title="What adoption writes" path="docs/architecture/adoption-profiles.md" lines=18:33
@source adopt-keeps title="Native configuration kept" path="docs/architecture/adoption-profiles.md" lines=35:42
@source adopt-preview title="Preview, then apply" path="docs/architecture/adoption-profiles.md" lines=44:53
@source first-change title="Before a tracked write" path="docs/guides/quickstart.md" lines=115:122
@source plan-contract title="The TransitionPlan contract" path="docs/architecture/transition-plan.md" lines=39:50
@source plan-steps title="The planning algebra" path="docs/architecture/transition-plan.md" lines=24:32
@source authorization title="Authorization and the expected HEAD" path="docs/architecture/runner-and-mutation.md" lines=22:25
@source write-boundary title="The write boundary" path="docs/architecture/runner-and-mutation.md" lines=27:36
@source candidate-train title="The candidate train" path="docs/architecture/runner-and-mutation.md" lines=38:43
@source stale title="A stale candidate base" path="docs/architecture/runner-and-mutation.md" lines=43:46
@source coordination title="Lanes that share a repository" path="docs/architecture/runner-and-mutation.md" lines=58:67
@source shared-proof title="One proof for every worktree" path="docs/architecture/runner-and-mutation.md" lines=70:74
@source archive title="Archiving the Change" path="docs/architecture/runner-and-mutation.md" lines=97:104
@source compensate title="Compensating a refused archive" path="docs/architecture/runner-and-mutation.md" lines=104:107
@source closeout title="Accepted-root closeout" path="docs/architecture/runner-and-mutation.md" lines=129:131
@source retire title="Retiring a landed lane" path="docs/architecture/runner-and-mutation.md" lines=88:92
@source runtime title="One selected runtime" path="docs/architecture/runner-and-mutation.md" lines=140:145
@source publish-preview title="The publication preview" path="docs/architecture/runner-and-mutation.md" lines=197:200
@source publish title="Publication to each peer" path="docs/architecture/runner-and-mutation.md" lines=206:212
@source verdict title="The closed verdict" path="docs/architecture/runner-and-mutation.md" lines=233:233
@source proof-gates title="Packaged gates and a repository's own" path="docs/reference/command-plane.md" lines=357:361
@source load-limit title="The host load limit" path="docs/reference/command-plane.md" lines=368:368
@source standard-proof title="Standard exact-source proof" path="docs/reference/command-plane.md" lines=433:442
@source gates-floor title="The packaged proof sets" path="system/gates.toml" lines=5:7
@source preflight title="Static gates before execution" path="src/ethos/adapters/gates/runner.py" lines=359:379
@source ready-set title="A bounded compatible ready set" path="src/ethos/adapters/gates/runner.py" lines=382:407
@source proof-boundary title="DR-0006: the decision" path="docs/decisions/dr-0006-proof-trust-boundary.md" lines=37:47
@source proof-alternatives title="DR-0006: rejected alternatives" path="docs/decisions/dr-0006-proof-trust-boundary.md" lines=49:56
@source paradigm-context title="DR-0012: the drift that was found" path="docs/decisions/dr-0012-repository-paradigm.md" lines=21:34
@source paradigm title="DR-0012: what the paradigm fixes" path="docs/decisions/dr-0012-repository-paradigm.md" lines=45:58
@source paradigm-gap title="DR-0012: what a gap blocks" path="docs/decisions/dr-0012-repository-paradigm.md" lines=69:69
@source commitment title="Compiling the Commitment" path="src/ethos/adapters/openspec/commitment.py" lines=44:56
@source commitment-class title="Commitment" path="src/ethos/contracts/semantic.py" lines=186:191
@source facts-class title="Facts" path="src/ethos/contracts/semantic.py" lines=387:396
@source attestation-class title="Attestation" path="src/ethos/contracts/semantic.py" lines=244:257
@source plan-class title="TransitionPlan" path="src/ethos/contracts/plan.py" lines=180:192
@source node-class title="PlanNode" path="src/ethos/contracts/plan.py" lines=45:53
@source plan-inputs title="PlanInputs" path="src/ethos/contracts/plan.py" lines=90:97
@source prewrite title="The prewrite guard" path="src/ethos/adapters/admission/prewrite.py" lines=60:72
@source lane title="Starting a Work Lane" path="src/ethos/adapters/mutation/lane_lifecycle/start.py" lines=343:353
@source hook title="One hook entry point" path="src/ethos/adapters/repo/hook/protocol.py" lines=20:33
@source proof title="The proof of one HEAD" path="src/ethos/adapters/mutation/proof.py" lines=406:411
@source landing title="Landing on the candidate" path="src/ethos/adapters/mutation/landing.py" lines=45:58
@source push title="An exact push to one peer" path="src/ethos/adapters/mutation/publication/execution.py" lines=44:55
@source peers title="The declared peers" path=".ethos/release.toml" lines=16:29

## Who uses ETHOS, and what does it own? {#p-context}

People, AI agents and programs reach the same operations, each through its own surface.[](source:surfaces) ETHOS promises preserved meaning, actionable uncertainty and recoverable results, not more governance.[](source:promise)

@diagram architecture id=context-map source=context.architecture.json title="Who reaches ETHOS, and what it touches"

@steps id=context-steps
| step-ctx-agents | AI agents | MCP and Skills carry the same result as the CLI and the Python SDK, with the same verdict in human and JSON views.[](source:surfaces)[](source:experience) | context-map | ctx-agents |
| step-ctx-service | Application service | One typed service serves every surface; a surface adapts only transport and presentation.[](source:service) | context-map | ctx-service |
| step-ctx-kernel | Trust kernel | ETHOS writes its own code only to compile intent and fresh facts into admitted, exact, attestable effects.[](source:custom-code)[](source:product-kernel) | context-map | ctx-kernel |
| step-ctx-openspec | OpenSpec | The official Change is the sole tracked carrier of intent, design, specs and tasks; ETHOS keeps no second copy.[](source:carrier) | context-map | ctx-openspec |
| step-ctx-git | Git | Effects reach Git only as exact compare-and-swap. Your domain model, CI provider, assistant host and issue tracker stay yours.[](source:invariants)[](source:native) | context-map | ctx-git |
| step-ctx-ci | CI and forges | Native CI syntax invokes the same proof capabilities and keeps each proof plane's identity.[](source:surfaces) | context-map | ctx-ci |
| step-ctx-standards | Standards and tools | SLSA, in-toto, Sigstore, Dagger, Temporal and others extend execution or projection; none replaces the kernel.[](source:standards) | context-map | ctx-standards |

## What does adopting ETHOS change in your repository? {#p-footprint}

Adoption writes one small declaration and, only where it is absent, the native OpenSpec configuration.[](source:adopt-writes)[](source:adopt-keeps) Everything else lives in the Git common directory, shared by every worktree, or in the host store.[](source:state-home)[](source:host-store)

@tree id=footprint-tree title="What adoption writes, and where ETHOS keeps its state"
| fp-root | Where ETHOS lives | - |
| fp-checkout | Your checkout, tracked | fp-root |
| fp-profile | .ethos/profile.toml | fp-checkout |
| fp-openspec | openspec/, official | fp-checkout |
| fp-common | Git common directory | fp-root |
| fp-state | ethos/state.sqlite | fp-common |
| fp-receipts | ethos/requests and receipts | fp-common |
| fp-runtime | ethos/runtime and hooks | fp-common |
| fp-attestations | refs/ethos/attestations-set | fp-common |
| fp-host | Host store | fp-root |
| fp-installations | ethos/installations | fp-host |

@steps id=footprint-steps
| step-fp-profile | .ethos/profile.toml | The minimal declaration names the repository and its OpenSpec material; an existing OpenSpec configuration is kept byte for byte.[](source:adopt-writes)[](source:adopt-keeps) | footprint-tree | fp-profile |
| step-fp-state | ethos/state.sqlite | Holds Leases, each with exactly four fields: lane, holder, generation and expiry.[](source:lease-fields) | footprint-tree | fp-state |
| step-fp-runtime | ethos/runtime and hooks | Immutable runtimes and hook launchers, which every linked worktree inherits.[](source:runtime-home) | footprint-tree | fp-runtime |
| step-fp-attestations | refs/ethos/attestations-set | Selects the durable Attestations; the other state here is re-observed, never truth.[](source:state-home) | footprint-tree | fp-attestations |

- [ ] Run `ethos status` in your repository and follow its one next action.[](source:status)
- [ ] Preview `ethos adopt --root <repo> --json` and review the exact file effects.[](source:adopt-preview)
- [ ] Apply with the reviewed `--expect-plan-digest` once no conflict remains.[](source:adopt-preview)
- [ ] Start a lane, then admit the paths of your first official Change before you edit them.[](source:first-change)

## What happens to one change? {#p-change}

Each command returns `pass`, `block` or `unknown`, and only `pass` lets it change anything.[](source:verdict)

@sequence id=change-flow title="One change, from a lane to every peer"
| actor seq-author | Change author | external |
| actor seq-lane | Work Lane | backend | source:write-boundary |
| actor seq-proof | Proof store | database | source:shared-proof |
| actor seq-candidate | Candidate branch | backend | source:candidate-train |
| actor seq-accepted | Accepted branch | backend | source:closeout |
| actor seq-peers | GitLab and GitHub | cloud | source:peers |
| phase | Write |
| seq-author | seq-lane | ethos lane start |
| seq-author | seq-lane | ethos lane prewrite, then edit |
| seq-author | seq-lane | commit through the hooks |
| seq-author | seq-lane | ethos lane archive-change |
| phase | Prove |
| seq-author | seq-proof | ethos prove --full --execute | emphasis |
| phase | Land |
| seq-author | seq-candidate | ethos land |
| seq-author | seq-accepted | ethos land --closeout | emphasis |
| phase | Publish |
| seq-author | seq-peers | ethos publish --ref |
| seq-peers | seq-author | applied, failed or pending | return |

@steps id=change-steps
| step-start | Work Lane | `ethos lane start` creates an owned branch and worktree from the candidate and records a Lease. Before each tracked write, `ethos lane prewrite` admits the exact paths.[](source:write-boundary)[](source:candidate-train) | change-flow | seq-lane | | seq-author-to-seq-lane-1,seq-author-to-seq-lane-2 |
| step-commit | Commits | Each Git hook runs one admission under the selected runtime, never the ambient `PATH`.[](source:hook)[](source:runtime) | change-flow | seq-lane | | seq-author-to-seq-lane-3 |
| step-prove | Proof store | Every gate runs on the archived, frozen head. The proof stays in the Git common directory, where every worktree reads it.[](source:standard-proof)[](source:shared-proof) | change-flow | seq-proof | | seq-author-to-seq-lane-4,seq-author-to-seq-proof-1 |
| step-land | Candidate branch | `ethos land --apply` needs authorization, the expected HEAD and proof of that head.[](source:authorization)[](source:archive) | change-flow | seq-candidate | | seq-author-to-seq-candidate-1 |
| step-closeout | Accepted branch | Closeout audits the candidate first, then fast-forwards only with executed proof of its head.[](source:closeout) | change-flow | seq-accepted | | seq-author-to-seq-accepted-1 |
| step-publish | GitLab and GitHub | Each peer is pushed with exact leases. If a later peer fails, the attested outcome names which peers applied, failed or are pending.[](source:publish) | change-flow | seq-peers | | seq-author-to-seq-peers-1,seq-peers-to-seq-author-1 |

## How does a lane live, and how does it recover? {#p-lane}

Lanes let people and agents change one repository at once. Seeing another lane grants no write, and a fast-forward land is the final arbiter.[](source:visibility)[](source:coordination)

@diagram lifecycle id=lane-life source=lane.lifecycle.json title="A Work Lane, from start to retirement"

@steps id=lane-steps
| step-lane-start | Lane started | `ethos lane start` creates an owned branch and worktree and records the Lease.[](source:write-boundary) | lane-life | lane-started |
| step-lane-write | Writing | Only the Lease holder writes, and only after prewrite admits the exact paths.[](source:write-boundary)[](source:lease-fields) | lane-life | lane-writing |
| step-lane-proven | Head proven | The archived head is proved once, and landing requires that proof.[](source:archive) | lane-life | lane-proven |
| step-lane-accepted | Head accepted | Land moves the candidate, and closeout moves the accepted branch with proof of its head. `ethos lane retire landed` then removes the clean lane.[](source:candidate-train)[](source:closeout)[](source:retire) | lane-life | lane-accepted |
| step-lane-stale | Stale base | If the candidate moved on, `ethos lane refresh-base` replays the lane onto it.[](source:stale) | lane-life | lane-stale |
| step-lane-refused | Proof refused | Compensation returns the archive to its exact pre-archive head; the author fixes, commits and archives again.[](source:compensate) | lane-life | lane-refused |
| step-lane-unowned | Lane unowned | A lapsed Lease keeps the Git content. One reconciler continues, transfers, reacquires, preserves, absorbs or retires the lane.[](source:reconcile) | lane-life | lane-unowned |

## What decides whether an effect runs? {#p-plan}

@diagram workflow id=plan-flow source=plan.workflow.json

@steps id=plan-steps
| step-inputs | Change, facts, Attestations | The plan reads only explicit values: no ambient files, clocks, network or processes.[](source:plan-contract) | plan-flow | plan-inputs |
| step-compile | Compile the plan | Resolves authority and contradictions, then orders checks, decisions and effects as a graph without cycles.[](source:plan-steps)[](source:plan-contract) | plan-flow | plan-compile |
| step-judge | Pass? | A missing fact, an unknown predicate or a contradiction ends in `unknown` or `block`.[](source:plan-contract) | plan-flow | plan-judge |
| step-effect | Run the effects | Each effect is one compare-and-swap that names its root, authority, precondition and expected state.[](source:plan-contract) | plan-flow | plan-effect |
| step-attest | Observe and attest | The adapter observes the result and returns immutable Attestations.[](source:plan-steps)[](source:plan-contract) | plan-flow | plan-attest |

Every result also names one next action: continue, await the user, blocked or done.[](source:continuation)

## What does one transition bind? {#p-kernel}

Equal inputs give a byte-identical plan, and its digest names it.[](source:plan-contract)

@diagram class id=kernel-map source=kernel.class.json title="What one transition binds"

@steps id=kernel-steps
| step-commitment | Commitment | The acceptance of one exact OpenSpec Change, compiled afresh and never stored.[](source:commitment-class)[](source:kernel) | kernel-map | kernel-commitment |
| step-facts | Facts | The repository, head and tree observed for this transition, never persisted as truth.[](source:facts-class) | kernel-map | kernel-facts |
| step-plan-record | TransitionPlan | Binds the digests of its inputs and orders its nodes.[](source:plan-inputs)[](source:plan-class) | kernel-map | kernel-plan |
| step-node | PlanNode | One check, decision or effect, with the nodes it depends on.[](source:node-class) | kernel-map | kernel-node |
| step-attestation | Attestation | Records the verdict and the digests it was judged on, and never mints authority.[](source:attestation-class) | kernel-map | kernel-attestation |

## Which parts carry it? {#p-parts}

Each arrow points from a part to a part it calls.

@diagram architecture id=parts-map source=parts.architecture.json

@steps id=parts-steps
| step-intent | OpenSpec intent | Compiles the Change's acceptance into a `Commitment`, never into a second schema.[](source:commitment)[](source:carrier) | parts-map | part-intent |
| step-plan | TransitionPlan | Orders checks, decisions and effects for one exact transition.[](source:plan-class) | parts-map | part-plan |
| step-prewrite | Prewrite admission | Refuses a tracked write from a protected root or from outside the owned lane.[](source:prewrite)[](source:write-boundary) | parts-map | part-prewrite |
| step-lane | Work Lane | An owned branch and worktree whose Lease names who may write.[](source:lane)[](source:write-boundary) | parts-map | part-lane |
| step-hooks | Hook protocol | Each native Git hook runs one admission under the selected runtime.[](source:hook)[](source:runtime) | parts-map | part-hooks |
| step-proof | Proof Attestation | Binds one exact HEAD, and every worktree reads the same proof.[](source:proof)[](source:shared-proof) | parts-map | part-proof |
| step-landing | Landing and acceptance | Lands on the candidate, then closeout promotes the proven head to accepted.[](source:landing)[](source:closeout) | parts-map | part-landing |
| step-publication | Peer publication | Previews both peers, then pushes each with exact leases; it never claims the two move together.[](source:publish-preview)[](source:push)[](source:peers)[](source:publish) | parts-map | part-publication |

## What does a full proof run, and where does its time go? {#p-proof}

The gates ETHOS packages for every repository run beside the gates a repository declares, all in one graph.[](source:proof-gates)[](source:gates-floor)

@diagram waterfall id=proof-run source=proof.waterfall.json title="One full proof, gate by gate"

@steps id=proof-steps
| step-proof-wait | Waiting for host load | Admission waited 391 seconds until the host's load fell below the limit.[](source:load-limit) | proof-run | proof-wait |
| step-proof-floor | ETHOS gates | Static gates ran first, in parallel, within capacity and without a conflicting gate.[](source:preflight)[](source:ready-set) | proof-run | proof-floor |
| step-proof-own | Repository gates | Tests and packaging began only after every static gate passed; one behavior gate took 733 of the 821 seconds the gates ran.[](source:preflight) | proof-run | proof-own |

## What does each kind of evidence prove? {#p-evidence}

ETHOS keeps eight evidence planes apart.[](source:planes)

@list id=evidence-planes
| Author identity |
| Git object signature |
| Transport authentication |
| Forge-side verification |
| Hosted CI |
| Release assets |
| Local proof |
| Installed runtime readback |

@callout level=note title="One claim, its own planes"
| A claim names exactly which planes were freshly verified; success in one never implies another.[](source:planes) Independent verification applies only where the asserted risk calls for it.[](source:independent) |

## Why is local proof enough, and when is it not? {#p-decision}

The decision record weighed four ways to trust a proof.[](source:proof-alternatives)

| Approach                                           | What it would mean                                                    | Decision                |
| -------------------------------------------------- | --------------------------------------------------------------------- | ----------------------- |
| A signature by the same local user                 | That user could still alter both the evidence and its check.          | Rejected {bad:Rejected} |
| Hosted verification of every proof                 | A forge becomes an implicit authority, and offline work stops.        | Rejected {bad:Rejected} |
| A bundled verifier daemon and key                  | ETHOS would own operator infrastructure.                              | Rejected {bad:Rejected} |
| Local proof, and an independent verifier on demand | Exact local readiness now, stronger assurance when the risk needs it. | Chosen {good:Chosen}    |

All Attestations name their verifier boundary, and a local one is never relabeled as independent.[](source:proof-boundary)

## What does ETHOS hold every repository to? {#p-paradigm}

In October 2026, ETHOS governed thirteen repositories, and the carriers they share had drifted apart.[](source:paradigm-context)

```mermaid title="Variants of each shared carrier across 13 repositories on 2026-10-14, from DR-0012"
xychart-beta horizontal
  x-axis [".ethos/ file sets", "commit grammars", "decision-record names", "branch prefixes", ".config/ taxonomies", "front-matter syntaxes"]
  y-axis "variants" 0 --> 8
  bar "Variants found" [7, 5, 4, 3, 3, 2]
```

One paradigm now fixes only what every repository shares, and no repository can declare an exception.[](source:paradigm)

@facts
| Shared by every repository | Root entries, configuration by tool, bindings, commit, branch and release conventions, document metadata, formatters, toolchain verbs, orchestration, CI and names[](source:paradigm) |
| Kept by each repository | Product and domain structure, tests, documentation subjects and provider shape[](source:paradigm) |
| When a repository drifts | The gap blocks prove, land and publish, and prewrite refuses the path.[](source:paradigm-gap) |

## Which principles decide how ETHOS is built? {#p-principles}

Four authored verses constrain its design.[](source:root-constraint) They ask to preserve meaning with the smallest model, distinguish only what changes action, keep authority apart from views, and retire a mechanism once its obligation disappears.

@facts
| Keep persistence singular | Only Attestation persists; Commitment, Facts and the plan are compiled anew.[](source:axioms) |
| Bind propositions | An authorizing proposition names its subject, predicate, scope, plane, bindings, validity, verifier and evidence.[](source:axioms) |
| Fail closed | Unknown facts, ambiguous authority, stale bindings, contradictions and model gaps block what depends on them.[](source:axioms) |
| Project one way | A view may reduce presentation, but never create authority or hide an absence reason.[](source:axioms) |
| Promote the model | Preserve a conflict losslessly, promote the smallest boundary, recompile, verify, then retire the residue.[](source:axioms) |
| Use Git at effect time | Recheck the exact Git binding and apply effects by compare-and-swap.[](source:axioms) |
| Keep configuration singular | Each concern has one native owner, and declarations link to it.[](source:axioms) |
| Keep profiles isomorphic | Profiles choose carriers and proof depth, never the kernel.[](source:axioms) |

@callout level=note title="Three questions before anything new"
| ETHOS adds a carrier, schema, record or state only when all three answers are yes. Is the obligation missing from OpenSpec, Git and the kernel? Would deleting it make an invariant unprovable? Does it have one owner and an end?[](source:new-entity) |

## What is delivered, and what is still open? {#p-maturity}

The kernel alone does not prove that the whole product promise is delivered.[](source:maturity-readme)

| Area                                          | State                           | What that means                                                                                                                                  |
| --------------------------------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Kernel, lanes, proof, landing and publication | In use {good:In use}            | They govern ETHOS and the repositories that adopted it.[](source:isomorphic)[](source:paradigm-context)                                          |
| MCP for agents                                | Delivered {caution:Unqualified} | Real clients still need conformance runs: discovery, journeys, denials, cancellation, isolation, upgrade and uninstall.[](source:mcp-open)       |
| Windows                                       | Not claimed {caution:Pending}   | macOS and Linux are required; Windows is claimed only after native qualification.[](source:experience)                                           |
| Independent verification                      | Optional {good:On demand}       | Selected by the asserted risk, never a default blocker.[](source:independent)                                                                    |
| The complete product route                    | Open {caution:P0 to P7}         | From current facts and quality to real-use benefit and interchangeable consumers.[](source:route)                                                |
| Task-based acceptance                         | Target {caution:Open}           | A new human, an agent and an SDK client each inspect, adopt, prove, recover and uninstall without learning ETHOS internals.[](source:acceptance) |
