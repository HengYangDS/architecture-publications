# ETHOS 怎样让人和 AI Agent 只凭证据改动仓库？ {#guide}

ETHOS 准入改动只看证据：OpenSpec 正式变更说明意图，当场观察到的事实说明现状，计划判定为 `pass` 才放行。[](source:kernel)[](source:product-kernel)客户端的声明、聊天记录和先前的成功，都赋予不了决定权，因为每次改动都要重新核对。[](source:mcp-authority)[](source:non-authorizing)治理 ETHOS 自身和每个接入它的仓库，用的是同一个小内核。[](source:isomorphic)

- [它只负责一项判断](block:p-context)：一次改动能不能放行。Git、OpenSpec、CI 和你的其他工具，都仍按各自原生的方式工作。[](source:custom-code)[](source:native)
- [任何 Agent 都能接手一条通道](block:p-lane)，凭 Git、OpenSpec、当下的事实和核验记录就够了，不用旁人复述。[](source:recovery)[](source:resume)
- [每次改动都要经过编译和判定，当场放行，再用精确的 compare-and-swap 执行](block:p-plan)。[](source:invariants)
- [每种证据只证明自己那个层面](block:p-evidence)，所以本地证明不是防伪保证。[](source:planes)[](source:proof-boundary)

@answer scope="ETHOS v0.2.0-beta.8 · 提交 9bf5bdd · 它的源码和文档 · 证明耗时实测于 2026-11-08，所用版本为 v0.2.0-beta.6"
@meta locale=zh-CN style=editorial
@source kernel title="内核" path="README.md" lines=100:107
@source native title="哪些保持原生" path="README.md" lines=26:29
@source visibility title="看得到不等于有决定权" path="README.md" lines=91:93
@source isomorphic title="同构治理" path="README.md" lines=33:38
@source status title="范围有限的读取入口" path="README.md" lines=56:58
@source maturity-readme title="内核与完整的承诺" path="README.md" lines=18:24
@source product-kernel title="信任内核" path="docs/governance/product-design-contract.md" lines=25:30
@source promise title="承诺" path="docs/governance/product-design-contract.md" lines=32:36
@source root-constraint title="根本约束" path="docs/governance/product-design-contract.md" lines=44:51
@source custom-code title="ETHOS 在哪里自己写代码" path="docs/governance/product-design-contract.md" lines=56:63
@source carrier title="OpenSpec：唯一的意图载体" path="docs/governance/product-design-contract.md" lines=119:126
@source continuation title="唯一的下一步" path="docs/governance/product-design-contract.md" lines=185:191
@source reconcile title="所有通道共用一个协调器" path="docs/governance/product-design-contract.md" lines=273:277
@source new-entity title="新增实体前的三个问题" path="docs/governance/product-design-contract.md" lines=347:357
@source surfaces title="公开入口" path="docs/governance/product-design-contract.md" lines=368:378
@source experience title="体验是内核的属性" path="docs/governance/product-design-contract.md" lines=380:392
@source planes title="证据层面" path="docs/governance/product-design-contract.md" lines=498:502
@source independent title="何时采用独立检验" path="docs/governance/product-design-contract.md" lines=504:508
@source non-authorizing title="只是输入，不是决定权" path="docs/governance/product-design-contract.md" lines=532:537
@source invariants title="不变量" path="docs/governance/product-design-contract.md" lines=586:602
@source axioms title="工程公理" path="system/axioms.md" lines=15:31
@source service title="唯一的应用服务" path="docs/plans/terminal-governance-product-design.md" lines=402:405
@source recovery title="从仓库证据恢复" path="docs/plans/terminal-governance-product-design.md" lines=420:422
@source resume title="另一个 Agent 接手" path="docs/plans/terminal-governance-product-design.md" lines=170:174
@source route title="余下的路线" path="docs/plans/terminal-governance-product-design.md" lines=155:159
@source acceptance title="按任务验收" path="docs/plans/terminal-governance-product-design.md" lines=424:428
@source mcp-authority title="标签和先前的检查都不授权" path="docs/architecture/mcp-server.md" lines=28:31
@source mcp-open title="MCP 符合性仍待鉴定" path="docs/architecture/mcp-server.md" lines=33:40
@source standards title="外部标准经适配器接入" path="docs/architecture/protocol-contracts.md" lines=18:22
@source state-home title="状态存放在哪里" path="docs/architecture/local-state.md" lines=19:27
@source runtime-home title="公共目录中的运行时和钩子" path="docs/architecture/local-state.md" lines=29:34
@source host-store title="主机存储" path="docs/architecture/local-state.md" lines=53:57
@source lease-fields title="租约的四个字段" path="docs/architecture/local-state.md" lines=102:107
@source adopt-writes title="接入写入什么" path="docs/architecture/adoption-profiles.md" lines=18:33
@source adopt-keeps title="保留原生配置" path="docs/architecture/adoption-profiles.md" lines=35:42
@source adopt-preview title="先预览，再应用" path="docs/architecture/adoption-profiles.md" lines=44:53
@source first-change title="受版本管理的写入之前" path="docs/guides/quickstart.md" lines=117:124
@source plan-contract title="TransitionPlan 契约" path="docs/architecture/transition-plan.md" lines=39:50
@source plan-steps title="规划代数" path="docs/architecture/transition-plan.md" lines=24:32
@source authorization title="授权与预期的 HEAD" path="docs/architecture/runner-and-mutation.md" lines=22:25
@source write-boundary title="写入边界" path="docs/architecture/runner-and-mutation.md" lines=27:36
@source candidate-train title="候选分支" path="docs/architecture/runner-and-mutation.md" lines=38:43
@source stale title="候选分支基线过时" path="docs/architecture/runner-and-mutation.md" lines=43:46
@source coordination title="共用一个仓库的通道" path="docs/architecture/runner-and-mutation.md" lines=58:67
@source shared-proof title="所有工作区共用一份证明" path="docs/architecture/runner-and-mutation.md" lines=70:74
@source archive title="归档正式变更" path="docs/architecture/runner-and-mutation.md" lines=97:104
@source compensate title="补偿被拒的归档" path="docs/architecture/runner-and-mutation.md" lines=104:107
@source closeout title="已验收根目录的收尾" path="docs/architecture/runner-and-mutation.md" lines=129:131
@source retire title="让已落地的通道退役" path="docs/architecture/runner-and-mutation.md" lines=88:92
@source runtime title="唯一选定的运行时" path="docs/architecture/runner-and-mutation.md" lines=140:145
@source publish-preview title="平台发布预览" path="docs/architecture/runner-and-mutation.md" lines=197:200
@source publish title="发布到每个平台" path="docs/architecture/runner-and-mutation.md" lines=206:212
@source verdict title="判定只有三种取值" path="docs/architecture/runner-and-mutation.md" lines=233:233
@source proof-gates title="内置门禁与仓库自有门禁" path="docs/reference/command-plane.md" lines=438:442
@source load-limit title="先就绪，再看主机负载" path="docs/reference/command-plane.md" lines=449:449
@source standard-proof title="冻结源码上的完整证明" path="docs/reference/command-plane.md" lines=444:447
@source gates-floor title="内置的证明集" path="system/gates.toml" lines=5:7
@source preflight title="测试之前的就绪层" path="src/ethos/adapters/gates/runner.py" lines=295:327
@source ready-set title="数量有限且互相兼容的就绪集" path="src/ethos/adapters/gates/runner.py" lines=330:355
@source proof-boundary title="DR-0006：决定" path="docs/decisions/dr-0006-proof-trust-boundary.md" lines=37:47
@source proof-alternatives title="DR-0006：被否决的方案" path="docs/decisions/dr-0006-proof-trust-boundary.md" lines=49:56
@source paradigm-context title="DR-0012：发现的漂移" path="docs/decisions/dr-0012-repository-paradigm.md" lines=21:34
@source paradigm title="DR-0012：范式规定什么" path="docs/decisions/dr-0012-repository-paradigm.md" lines=45:58
@source paradigm-gap title="DR-0012：缺口阻止什么" path="docs/decisions/dr-0012-repository-paradigm.md" lines=69:69
@source commitment title="编译 Commitment" path="src/ethos/adapters/openspec/commitment.py" lines=46:58
@source commitment-class title="Commitment" path="src/ethos/contracts/semantic.py" lines=199:204
@source facts-class title="Facts" path="src/ethos/contracts/semantic.py" lines=400:409
@source attestation-class title="Attestation" path="src/ethos/contracts/semantic.py" lines=257:270
@source plan-class title="TransitionPlan" path="src/ethos/contracts/plan.py" lines=181:193
@source node-class title="PlanNode" path="src/ethos/contracts/plan.py" lines=46:54
@source plan-inputs title="PlanInputs" path="src/ethos/contracts/plan.py" lines=91:98
@source prewrite title="写前准入守卫" path="src/ethos/adapters/admission/prewrite.py" lines=117:149
@source lane title="开始一条工作通道" path="src/ethos/adapters/mutation/lane_lifecycle/start.py" lines=345:355
@source hook title="唯一的钩子入口" path="src/ethos/adapters/repo/hook/protocol.py" lines=21:34
@source proof title="一个 HEAD 的证明" path="src/ethos/adapters/mutation/proof.py" lines=417:422
@source landing title="落地到候选分支" path="src/ethos/adapters/mutation/landing.py" lines=57:70
@source push title="向一个平台精确推送" path="src/ethos/adapters/mutation/publication/execution.py" lines=45:56
@source peers title="声明的平台" path=".ethos/release.toml" lines=12:25
@source profile-declaration title="ETHOS 自己的配置档声明" path=".ethos/profile.toml" lines=1:7
@source python-range title="支持的 Python 版本" path="pyproject.toml" lines=1:6
@source branch-roles title="分支角色" path="src/ethos/contracts/paradigm/paradigm.toml" lines=50:57
@source parameters title="单个文件的上限与门禁时限" path="src/ethos/contracts/paradigm/paradigm.toml" lines=94:129
@source changelog-first title="第一条记录：0.1.0-alpha.1" path="CHANGELOG.md" lines=2129:2135
@source changelog-pinned title="本作品锁定的 0.2.0-beta.8" path="CHANGELOG.md" lines=15:21

## 谁在使用 ETHOS，它又负责什么？ {#p-context}

人、AI Agent 和程序各走自己的入口，用的是同一套操作。[](source:surfaces)ETHOS 承诺的是含义不丢、不确定的地方能接着处理、结果可以恢复，不是多加一层治理。[](source:promise)

@diagram architecture id=context-map source=context.architecture.json title="谁在调用 ETHOS，它又作用于什么"

@steps id=context-steps
| step-ctx-agents | AI Agent | MCP 和技能返回的结果与 CLI、Python SDK 相同；给人看的视图和 JSON 视图，判定也相同。[](source:surfaces)[](source:experience) | context-map | ctx-agents |
| step-ctx-service | 应用服务 | 所有入口共用一个带类型的服务，入口只负责适配传输和呈现。[](source:service) | context-map | ctx-service |
| step-ctx-kernel | 信任内核 | ETHOS 只为一件事自己写代码：把意图和当下的事实编译成改动。这些改动经过放行，内容精确，还能写下核验记录。[](source:custom-code)[](source:product-kernel) | context-map | ctx-kernel |
| step-ctx-spec | OpenSpec | 意图、设计、规格和任务，受版本管理的载体只有正式变更一处，ETHOS 不另存一份。[](source:carrier) | context-map | ctx-spec |
| step-ctx-git | Git | 改动只以精确的 compare-and-swap 进入 Git。你的领域模型、CI 服务商、助手宿主和问题跟踪系统，仍然归你所有。[](source:invariants)[](source:native) | context-map | ctx-git |
| step-ctx-ci | CI 与代码托管平台 | 原生 CI 语法调用同样的证明能力，每个证明层面都保留各自的身份。[](source:surfaces) | context-map | ctx-ci |
| step-ctx-standards | 标准与工具 | SLSA、in-toto、Sigstore、Dagger、Temporal 等可以扩展执行或投影，但都取代不了内核。[](source:standards) | context-map | ctx-standards |

## 接入 ETHOS，会改动你仓库里的哪些东西？ {#p-footprint}

接入只写入一份很小的声明；原生 OpenSpec 配置只在缺失时才写入。[](source:adopt-writes)[](source:adopt-keeps)其余的东西，要么放在所有工作区共用的 Git 公共目录里，要么放在主机存储中。[](source:state-home)[](source:host-store)

@facts
| 平台 | 必须支持 macOS 和 Linux；Windows 要在原生鉴定之后才声明支持。[](source:experience) |
| Python | `ethos` 包支持 Python 3.12 至 3.14。[](source:python-range) |
| 分支角色 | `main` 用于发布，`dev` 是已验收分支，`candidate/dev` 是候选分支；工作通道用 `work/` 前缀，提案用 `proposal/` 前缀[](source:branch-roles) |
| 单个文件的上限 | 每个代码文件 500 个有效行，每份文档 500 个非空行，最多放宽到 1,000[](source:parameters) |
| 门禁时限 | 门禁没有声明自己的时限时为 600 秒，最多 7,200 秒[](source:parameters) |

仓库可以收紧任何一项上限或时限；要放宽，就得写明理由，而且不能超过上界。[](source:parameters)ETHOS 自己的配置档声明 `.ethos/profile.toml` 只有 7 行。[](source:profile-declaration)

@code id=profile-declaration source=profile-declaration language=toml

@diagram tree id=footprint-tree source=footprint.tree.json

@steps id=footprint-steps
| step-fp-profile | 配置档声明 | `.ethos/profile.toml` 写明仓库和它的 OpenSpec 材料；已有的 OpenSpec 配置一个字节都不动。[](source:adopt-writes)[](source:adopt-keeps) | footprint-tree | fp-profile |
| step-fp-state | 状态数据库 | `ethos/state.sqlite` 存放租约，每份租约恰好四个字段：通道、持有者、代次和到期时间。[](source:lease-fields) | footprint-tree | fp-state |
| step-fp-runtime | 运行时与钩子 | 不可变的运行时和钩子启动器放在 `ethos/runtime` 下，每个链接工作区都会继承。[](source:runtime-home) | footprint-tree | fp-runtime |
| step-fp-attestations | 核验记录集 | `refs/ethos/attestations-set` 选定持久的核验记录；这里的其他状态都要重新观察，不能当作权威事实。[](source:state-home) | footprint-tree | fp-attestations |

- [ ] 在你的仓库里运行 `ethos status`，照它给出的唯一下一步去做。[](source:status)
- [ ] 先用 `ethos adopt --root <repo> --json` 预览，逐项审阅文件会有哪些改动。[](source:adopt-preview)
- [ ] 没有冲突之后，带上审阅过的 `--expect-plan-digest` 正式应用。[](source:adopt-preview)
- [ ] 开始一条通道；第一项正式变更要改的路径，编辑之前先通过准入。[](source:first-change)

## 一次改动会经历什么？ {#p-change}

每条命令都返回 `pass`、`block` 或 `unknown`，只有 `pass` 才允许它做改动。[](source:verdict)

@sequence id=change-flow title="一次改动：从通道到每个平台"
| actor seq-author | 作者 | external |
| actor seq-lane | 工作通道 | backend | source:write-boundary |
| actor seq-proof | 证明存储 | database | source:shared-proof |
| actor seq-candidate | 候选分支 | backend | source:candidate-train |
| actor seq-accepted | 已验收分支 | backend | source:closeout |
| actor seq-peers | GitLab 与 GitHub | cloud | source:peers |
| phase | 写入 |
| seq-author | seq-lane | 开始一条通道 |
| seq-author | seq-lane | 先过写前准入，再编辑 |
| seq-author | seq-lane | 经钩子提交 |
| seq-author | seq-lane | 归档正式变更 |
| phase | 证明 |
| seq-author | seq-proof | 证明归档后的头提交 | emphasis |
| phase | 落地 |
| seq-author | seq-candidate | 落地 |
| seq-author | seq-accepted | 收尾 | emphasis |
| phase | 发布 |
| seq-author | seq-peers | 发布到平台 |
| seq-peers | seq-author | 已应用、失败或待定 | return |

@steps id=change-steps
| step-start | 工作通道 | `ethos lane start` 从候选分支拉出自己的分支和工作区，并记下一份租约。每次写受版本管理的文件之前，`ethos lane prewrite` 都要精确放行这次要写的路径。[](source:write-boundary)[](source:candidate-train) | change-flow | seq-lane | | seq-author-to-seq-lane-1,seq-author-to-seq-lane-2 |
| step-commit | 提交 | 每个 Git 钩子都在选定的运行时下做一次准入，不用环境里的 `PATH`。[](source:hook)[](source:runtime) | change-flow | seq-lane | | seq-author-to-seq-lane-3 |
| step-prove | 证明存储 | `ethos lane archive-change` 归档正式变更，`ethos prove --full --execute` 在这个冻结的头提交上跑完所有门禁。证明留在 Git 公共目录里，每个工作区都从那里读取。[](source:archive)[](source:standard-proof)[](source:shared-proof) | change-flow | seq-proof | | seq-author-to-seq-lane-4,seq-author-to-seq-proof-1 |
| step-land | 候选分支 | `ethos land --apply` 需要授权、预期的 HEAD，还要有这个头提交的证明。[](source:authorization)[](source:archive) | change-flow | seq-candidate | | seq-author-to-seq-candidate-1 |
| step-closeout | 已验收分支 | `ethos land --closeout` 先审计候选分支；只有候选分支的头提交确实跑过证明，才快进已验收分支。[](source:closeout) | change-flow | seq-accepted | | seq-author-to-seq-accepted-1 |
| step-publish | GitLab 与 GitHub | `ethos publish` 用精确的 `--force-with-lease` 逐个推送到每个平台。如果靠后的平台失败，核验记录里的结果会写明哪些平台已应用、失败或待定。[](source:publish) | change-flow | seq-peers | | seq-author-to-seq-peers-1,seq-peers-to-seq-author-1 |

## 一条通道怎样走完全程，出了问题又怎样恢复？ {#p-lane}

有了通道，人和 Agent 可以同时改动同一个仓库。看得到别的通道，不等于可以往里写；最后由快进式落地裁决。[](source:visibility)[](source:coordination)

@diagram lifecycle id=lane-life source=lane.lifecycle.json title="工作通道：从开始到退役"

@steps id=lane-steps
| step-lane-start | 通道已开始 | `ethos lane start` 创建自己的分支和工作区，并记下租约。[](source:write-boundary) | lane-life | lane-started |
| step-lane-write | 写入中 | 只有租约持有者可以写入，而且要等写前准入放行了要写的路径。[](source:write-boundary)[](source:lease-fields) | lane-life | lane-writing |
| step-lane-proven | 头提交已证明 | 归档后的头提交只证明一次，落地要凭这份证明。[](source:archive) | lane-life | lane-proven |
| step-lane-accepted | 头提交已验收 | 落地推进候选分支，收尾凭头提交的证明推进已验收分支。随后，`ethos lane retire landed` 移除这条没有未提交改动的通道。[](source:candidate-train)[](source:closeout)[](source:retire) | lane-life | lane-accepted |
| step-lane-stale | 基线过时 | 如果候选分支已经前进，`ethos lane refresh-base` 会把通道重放到它上面。[](source:stale) | lane-life | lane-stale |
| step-lane-refused | 证明被拒 | 补偿把归档精确退回到归档前的头提交；作者修复、提交，再归档一次。[](source:compensate) | lane-life | lane-refused |
| step-lane-unowned | 通道无主 | 租约失效后，Git 内容仍然保留。由唯一的协调器来继续、转移、重新获取、保留或吸收这条通道，或者让它退役。[](source:reconcile) | lane-life | lane-unowned |

## 一项改动能不能执行，由什么决定？ {#p-plan}

@diagram workflow id=plan-flow source=plan.workflow.json

@steps id=plan-steps
| step-inputs | 正式变更、事实、核验记录 | 计划只读显式的值，不读环境里的文件、时钟、网络或进程。[](source:plan-contract) | plan-flow | plan-inputs |
| step-compile | 编译计划 | 先解析决定权和矛盾，再把检查、决策和改动排成一张无环图。[](source:plan-steps)[](source:plan-contract) | plan-flow | plan-compile |
| step-judge | 判定通过？ | 缺少事实、谓词未知或者存在矛盾，结果都是 `unknown` 或 `block`。[](source:plan-contract) | plan-flow | plan-judge |
| step-effect | 执行改动 | 每项改动都是一次 compare-and-swap，写明根目录、决定权、前置条件和预期状态。[](source:plan-contract) | plan-flow | plan-effect |
| step-attest | 观察并写下核验记录 | 适配器观察结果，返回不可变的核验记录。[](source:plan-steps)[](source:plan-contract) | plan-flow | plan-attest |

每个结果还会给出唯一的下一步：继续、等待用户、受阻或完成。[](source:continuation)

## 一次转换要绑定哪些东西？ {#p-kernel}

输入相同，计划就逐字节相同，计划的名字就是它的摘要。[](source:plan-contract)

@diagram class id=kernel-map source=kernel.class.json title="一次转换绑定了什么"

@steps id=kernel-steps
| step-commitment | Commitment | 一项确定的 OpenSpec 正式变更的验收条件，每次重新编译，不做存储。[](source:commitment-class)[](source:kernel) | kernel-map | kernel-commitment |
| step-facts | Facts | 为这次转换观察到的仓库、头提交和树，不会作为权威事实保存下来。[](source:facts-class) | kernel-map | kernel-facts |
| step-plan-record | TransitionPlan | 绑定各项输入的摘要，并为自己的节点排序。[](source:plan-inputs)[](source:plan-class) | kernel-map | kernel-plan |
| step-node | PlanNode | 一项检查、决策或改动，连同它所依赖的节点。[](source:node-class) | kernel-map | kernel-node |
| step-attestation | 核验记录 | 记下判定和判定依据的摘要，不会产生决定权。[](source:attestation-class) | kernel-map | kernel-attestation |

## 由哪些组件承载？ {#p-parts}

每个箭头都从调用方指向它调用的组件。

@diagram architecture id=parts-map source=parts.architecture.json

@steps id=parts-steps
| step-intent | OpenSpec 意图 | 把正式变更的验收条件编译成 `Commitment`，不另立一套 Schema。[](source:commitment)[](source:carrier) | parts-map | part-intent |
| step-plan | TransitionPlan | 为一次确定的转换排好检查、决策和改动的顺序。[](source:plan-class) | parts-map | part-plan |
| step-prewrite | 写前准入 | 写入受版本管理的文件时，如果来自受保护的根目录或自有通道之外，一律拒绝。[](source:prewrite)[](source:write-boundary) | parts-map | part-prewrite |
| step-lane | 工作通道 | 一个自己的分支和工作区，由它的租约指明谁可以写入。[](source:lane)[](source:write-boundary) | parts-map | part-lane |
| step-hooks | 钩子协议 | 每个原生 Git 钩子都在选定的运行时下做一次准入。[](source:hook)[](source:runtime) | parts-map | part-hooks |
| step-proof | 证明核验记录 | 绑定一个确定的 HEAD，每个工作区读取的都是同一份证明。[](source:proof)[](source:shared-proof) | parts-map | part-proof |
| step-landing | 落地与验收 | 先落地到候选分支，再由收尾把证明过的头提交提升为已验收。[](source:landing)[](source:closeout) | parts-map | part-landing |
| step-publication | 平台发布 | 先预览两个平台，再用精确的 `--force-with-lease` 逐个推送；绝不声称两个平台一起前进。[](source:publish-preview)[](source:push)[](source:peers)[](source:publish) | parts-map | part-publication |

## 一次完整证明要跑什么，时间花在哪里？ {#p-proof}

ETHOS 为每个仓库内置的门禁，和仓库自己声明的门禁放在同一张图里运行。[](source:proof-gates)[](source:gates-floor)

@diagram waterfall id=proof-run source=proof.waterfall.json title="一次完整证明，逐个门禁"

@steps id=proof-steps
| step-proof-ready | 就绪门禁 | 既不是测试门禁、也不是打包门禁的，都先运行，在容量限度内并行；其中一个失败，证明就在等待之前结束。[](source:preflight)[](source:ready-set) | proof-run | proof-ready |
| step-proof-wait | 等待主机负载 | 证明随后等了 75 秒，直到连续两个 1 分钟负载样本都不超过上限。[](source:load-limit) | proof-run | proof-wait |
| step-proof-tests | 测试与打包门禁 | 测试和打包最后运行；证明共用时 874 秒，其中一个行为门禁就占了 701 秒。[](source:preflight) | proof-run | proof-tests |

## 每种证据证明什么？ {#p-evidence}

ETHOS 把证据分成八个层面，彼此独立。[](source:planes)

@list id=evidence-planes
| 作者身份 |
| Git 对象签名 |
| 传输认证 |
| 平台侧检验 |
| 托管 CI |
| 发布资产 |
| 本地证明 |
| 已安装运行时的回读 |

@callout level=note title="一项声明，写明检验过的层面"
| 一项声明要写明刚刚检验过哪些层面；一个层面成功，推不出另一个也成功。[](source:planes)只有声明的风险确实需要，才采用独立检验。[](source:independent) |

## 为什么本地证明就够了，什么时候又不够？ {#p-decision}

这份决策记录比较了信任一份证明的四种办法。[](source:proof-alternatives)

| 方案                           | 意味着什么                                             | 决定             |
| ------------------------------ | ------------------------------------------------------ | ---------------- |
| 由同一个本地用户签名           | 这个用户仍然可以把证据和对证据的检查一起改掉。         | 否决 {bad:否决}  |
| 每份证明都交给托管检验         | 代码托管平台会变成隐性的决定权来源，离线工作也会中断。 | 否决 {bad:否决}  |
| 内置检验守护进程和密钥         | ETHOS 就得自己掌管运维基础设施。                       | 否决 {bad:否决}  |
| 本地证明，按需加上独立检验程序 | 眼下精确证明本地已就绪；风险需要时，再取得更强的保证。 | 采用 {good:采用} |

每份核验记录都写明检验程序的边界，本地核验记录绝不会改标为独立核验记录。[](source:proof-boundary)

## ETHOS 要求每个仓库守住什么？ {#p-paradigm}

2026 年 10 月，ETHOS 治理着 13 个仓库，它们共有的载体已经各自漂移。[](source:paradigm-context)

```mermaid title="13 个仓库中每种共有载体的变体数（2026-10-14，取自 DR-0012）"
xychart-beta horizontal
  x-axis [".ethos/ 文件集", "提交信息语法", "决策记录命名", "分支前缀", ".config/ 分类体系", "front matter 语法"]
  y-axis "变体数" 0 --> 8
  bar "发现的变体" [7, 5, 4, 3, 3, 2]
```

如今一套范式只规定所有仓库共有的部分，任何仓库都不能声明例外。[](source:paradigm)

@facts
| 所有仓库共有 | 根目录入口、按工具分组的配置、绑定、提交、分支与发布约定、文档元数据、格式化工具、工具链动词、编排、CI 和命名[](source:paradigm) |
| 各仓库自留 | 产品与领域结构、测试、文档主题和平台形态[](source:paradigm) |
| 某个仓库漂移时 | 缺口会阻止 prove、land 和 publish，写前准入也会拒绝该路径。[](source:paradigm-gap) |

## ETHOS 按哪些原则构建？ {#p-principles}

四行自撰的诗句约束着它的设计。[](source:root-constraint)它们要求：用最小模型保住含义，只在影响行动的地方做区分，让决定权与视图分开，机制的责任一结束就让它退役。

@facts
| 只留一种持久记录 | 只有核验记录会持久保存；Commitment、Facts 和计划都重新编译。[](source:axioms) |
| 命题要绑定清楚 | 授权命题要写明主体、谓词、范围、层面、绑定、有效期、检验程序和证据。[](source:axioms) |
| 存疑即阻止 | 事实未知、决定权不明、绑定过时、存在矛盾或模型有缺口，都会阻止依赖它们的一切。[](source:axioms) |
| 单向投影 | 视图可以精简呈现，但绝不能制造决定权，也不能隐藏缺失的原因。[](source:axioms) |
| 模型提升 | 无损保留冲突，提升最小的边界，重新编译、检验，再让残留退役。[](source:axioms) |
| 改动时以 Git 为准 | 重新核对精确的 Git 绑定，用 compare-and-swap 执行改动。[](source:axioms) |
| 配置只归一处 | 每项关注点只有一个原生归属方，声明都链接到它。[](source:axioms) |
| 配置档同构 | 配置档选择载体和证明深度，但决定不了内核。[](source:axioms) |

@callout level=note title="新增东西之前，先问三个问题"
| 三个问题的答案都是“是”，ETHOS 才新增载体、Schema、记录或状态。这项责任在 OpenSpec、Git 和内核里都不存在吗？删掉它，会让某个不变量无法证明吗？它有唯一的归属方和终点吗？[](source:new-entity) |

## ETHOS 怎样走到今天？ {#p-history}

变更日志第一条是 2026 年 6 月 30 日的 0.1.0-alpha.1；本作品锁定 0.2.0-beta.8，它发布于 11 月 12 日。[](source:changelog-first)[](source:changelog-pinned)下面列出其间十四个版本，图中按预发布名标注，它们改变了 ETHOS 为受治理的仓库所做的事。

@diagram timeline id=history source=history.timeline.json title="ETHOS 怎样走到今天"

## 哪些已经交付，哪些还没完成？ {#p-maturity}

单有内核，证明不了整个产品承诺已经兑现。[](source:maturity-readme)

| 领域                             | 状态                      | 含义                                                                                                                             |
| -------------------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| 内核、通道、证明、落地和平台发布 | 在用 {good:在用}          | 它们治理着 ETHOS 和接入它的仓库。[](source:isomorphic)[](source:paradigm-context)                                                |
| 面向 Agent 的 MCP                | 已交付 {caution:未经鉴定} | 真实客户端仍需跑符合性测试：发现、使用流程、拒绝、取消、隔离、升级和卸载。[](source:mcp-open)                                    |
| Windows                          | 未声明支持 {caution:待定} | 必须支持 macOS 和 Linux；Windows 要在原生鉴定之后才声明支持。[](source:experience)                                               |
| 独立检验                         | 可选 {good:按需}          | 由声明的风险决定是否采用，绝不会默认阻断。[](source:independent)                                                                 |
| 完整的产品路线                   | 未完成 {caution:P0 至 P7} | 从当前事实和质量，到实际使用中的收益和可互换的使用方。[](source:route)                                                           |
| 基于任务的验收                   | 目标 {caution:未完成}     | 一位新用户、一个 Agent 和一个 SDK 客户端，各自都能查看、接入、证明、恢复和卸载，不必了解 ETHOS 的内部机制。[](source:acceptance) |
