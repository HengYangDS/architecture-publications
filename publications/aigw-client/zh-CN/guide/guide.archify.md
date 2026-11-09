# AIGW 怎样让团队的每个 AI 客户端，都和同一份审阅过的配置保持一致？ {#guide}

AIGW 是面向团队 AI 客户端的本地优先控制面。[](source:readme-what) 审阅过的账户、路由和客户端绑定，都放在一份加锁的配置里。[](source:store-owner) 写入时，它对每个受支持客户端只改写归自己管的那一块，全程是一次受保护的事务。[](source:transaction) 请求绝不经过 AIGW：每个客户端按需读取自己的令牌，自己调用端点。[](source:boundary)

- [它控制的是配置，不是流量](block:p-owners)：请求执行、会话连续性和团队访问，仍由客户端和网关负责。[](source:research-boundary)[](source:research-restraint)
- [同步失败时，只恢复它自己写过的文件](block:p-race)，其他写入者后来的修改不会丢失。[](source:restore)
- [客户端文件里没有令牌](block:p-token)：客户端请求时，由凭据助手从选定的那个存储读取令牌。[](source:helper-projection)
- [每一级检查多证明一件事](block:p-ready)，而文件已同步，不等于请求已得到应答。[](source:experience-readiness)

@answer scope="AIGW v0.6.1 · 提交 abf0585 · 源代码及自带文档"
@meta locale=zh-CN style=editorial
@source readme-what title="AIGW 是什么" path="README.md" lines=3:6
@source readme-install title="安装" path="README.md" lines=29:41
@source readme-team title="导入团队清单" path="README.md" lines=94:102
@source readme-connect title="连接一个账户" path="README.md" lines=101:108
@source readme-activate title="稍后激活" path="README.md" lines=118:125
@source readme-sync title="sync 改变什么" path="README.md" lines=136:142
@source readme-credentials title="凭据存储" path="README.md" lines=158:163
@source readme-model title="产品模型" path="README.md" lines=244:253
@source readme-adapters title="受支持的客户端" path="README.md" lines=255:261
@source readme-boundaries title="边界" path="README.md" lines=269:280
@source readme-rollback title="程序回滚" path="README.md" lines=308:311
@source readme-uninstall title="卸载" path="README.md" lines=339:343
@source readme-update-trust title="来自任一代码托管平台的已签名更新" path="README.md" lines=349:354
@source readme-check title="不做推理的检查" path="README.md" lines=24:25
@source concepts title="五个概念" path="docs/concepts/product-concepts.md" lines=11:14
@source account-concept title="账户" path="docs/concepts/product-concepts.md" lines=49:62
@source route-concept title="路由" path="docs/concepts/product-concepts.md" lines=71:84
@source binding-concept title="客户端绑定" path="docs/concepts/product-concepts.md" lines=93:105
@source projection-concept title="原生投影" path="docs/concepts/product-concepts.md" lines=107:119
@source catalog-states title="从观测到路由" path="docs/concepts/product-concepts.md" lines=147:162
@source catalog-qualify title="路由怎样才算通过鉴定" path="docs/concepts/product-concepts.md" lines=164:168
@source account-struct title="配置中的账户" path="internal/domain/model.go" lines=85:92
@source model-struct title="配置中的模型" path="internal/domain/model.go" lines=94:100
@source route-struct title="配置中的路由" path="internal/domain/model.go" lines=102:113
@source binding-struct title="配置中的客户端绑定" path="internal/domain/clients.go" lines=200:216
@source research-responsibilities title="四种职责" path="docs/research/provider-tooling-assessment.md" lines=48:57
@source research-boundary title="更窄的边界" path="docs/research/provider-tooling-assessment.md" lines=204:207
@source research-restraint title="不做又一个工作台" path="docs/research/provider-tooling-assessment.md" lines=211:219
@source research-value title="AIGW 的价值假设" path="docs/research/provider-tooling-assessment.md" lines=231:235
@source experience-questions title="三个问题" path="docs/experience/terminal-experience.md" lines=11:15
@source experience-readiness title="就绪状态，逐项分解" path="docs/experience/terminal-experience.md" lines=17:26
@source adapter-admission title="两种准入" path="docs/governance/adapter-admission.md" lines=13:23
@source acceptance-journey title="真实客户端的发布流程" path="docs/operations/real-client-acceptance.md" lines=69:79
@source acceptance-windows title="Windows 上的 Hermes" path="docs/operations/real-client-acceptance.md" lines=39:41
@source rollout-intro title="团队推行" path="docs/guides/team-rollout.md" lines=11:13
@source rollout-maintainer title="维护者的步骤" path="docs/guides/team-rollout.md" lines=15:29
@source boundary title="权威来源与投影边界" path="docs/architecture/authority-and-projection-boundary.md" lines=38:41
@source owners title="哪些状态归谁" path="docs/architecture/authority-and-projection-boundary.md" lines=48:59
@source transaction title="同步事务" path="internal/app/synchronization/transaction.go" lines=40:53
@source preflight title="预检" path="internal/app/synchronization/transaction.go" lines=55:70
@source commit-order title="先入口，再配置，最后写入客户端" path="internal/app/synchronization/transaction.go" lines=74:96
@source transaction-boundary title="事务边界" path="docs/architecture/security-model.md" lines=175:189
@source restore title="受保护的恢复" path="internal/platform/files.go" lines=166:180
@source store-commit title="提交配置" path="internal/store/store.go" lines=131:134
@source store-owner title="存储管什么" path="internal/store/store.go" lines=24:25
@source store-lock title="修改锁" path="internal/store/store.go" lines=407:423
@source seam title="适配器契约" path="internal/adapter/registry.go" lines=93:106
@source entrypoint title="凭据入口" path="docs/architecture/security-model.md" lines=72:80
@source credential title="凭据协议" path="docs/architecture/security-model.md" lines=119:128
@source token-storage title="令牌存放在哪里" path="docs/architecture/security-model.md" lines=13:16
@source token-store title="读取选定的存储" path="docs/architecture/security-model.md" lines=38:44
@source helper-projection title="写给 Claude Desktop 的配置" path="internal/adapter/claudedesktop/adapter.go" lines=252:266
@source verify-checkpoint title="完整验证的检查点" path="internal/cli/verify/verify.go" lines=119:124
@source rollback-checkpoint title="回滚恢复什么" path="internal/cli/rollback/rollback.go" lines=38:47
@source decision title="DR-0006：一次受保护的事务" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=15:30
@source rejected title="DR-0006：被否决的方案" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=32:37
@source revisit title="DR-0006：何时重新审视" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=45:48
@source readiness title="就绪状态" path="internal/app/readiness/state.go" lines=1:27

## 谁使用 AIGW，它又牵涉到什么？ {#p-context}

AIGW 的价值假设是：团队成员只要持有任一受支持提供商凭据，就能得到可用的客户端配置，看得懂，也能安全地撤回。[](source:research-value)

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-maintainer | 团队维护者 | 编订一份审阅过、不含令牌的清单，按标签或提交发布，不从会变动的分支发布。[](source:rollout-maintainer) | context-map | ctx-maintainer |
| step-ctx-member | 团队成员 | 导入这份清单，只连接自己持有令牌的那个账户。[](source:readme-team) | context-map | ctx-member |
| step-ctx-control | AIGW 控制面 | 管理账户、令牌、路由和客户端绑定；不转发请求，不运行网关，对话状态也不归它管。[](source:readme-what) | context-map | ctx-control |
| step-ctx-clients | 受支持的客户端 | Codex、Claude Code、Claude Desktop 和 Hermes，各有一块配置归 AIGW 管；要列入发布支持，必须先取得完整的原生证据。[](source:readme-adapters) | context-map | ctx-clients |
| step-ctx-store | 令牌存储 | 平台凭据服务、本地后备存储，或只读的环境变量；一旦显式选定，出错即拒绝。[](source:readme-credentials) | context-map | ctx-store |
| step-ctx-endpoints | 提供商端点 | 直连提供商，或独立运营的兼容服务；AIGW 保存这一选择，但绝不运营该服务。[](source:readme-boundaries) | context-map | ctx-endpoints |

## 团队如何起步？ {#p-team}

团队分发审阅过的公开配置，令牌由每位成员在本地提供。[](source:rollout-intro)

@diagram workflow id=rollout-flow source=rollout.workflow.json

@steps id=rollout-steps
| step-curate | 编订清单 | 只收录审阅过的账户端点和已准入的路由；令牌、个人路径、身份和发布凭据一概不收。[](source:rollout-maintainer) | rollout-flow | rollout-curate |
| step-publish | 按标签发布 | 从发布标签或不可变的提交发布，让每位成员拿到同一份文件。[](source:rollout-maintainer) | rollout-flow | rollout-publish |
| step-install | 安装 AIGW | 在 macOS 上用已签名、经公证的 Homebrew cask，或用适用于 macOS、Linux 和 Windows 的便携归档包。[](source:readme-install) | rollout-flow | rollout-install |
| step-import | 导入清单 | 导入时，既不需要备齐每个提供商的令牌，也不需要已装好客户端。[](source:readme-team) | rollout-flow | rollout-import |
| step-connect | 连接一个账户 | 只选择你持有的账户；其余账户仍然可用，但不会成为前提。[](source:readme-connect)[](source:readme-activate) | rollout-flow | rollout-connect |
| step-check | 同步并检查 | 凡是路由、认证和原生配置面都可用的已启用绑定，`aigw sync` 都会写入客户端，但绝不会创建缺失的客户端。[](source:readme-sync) | rollout-flow | rollout-check |

- [ ] 从团队标签保存审阅过的 `team.toml`，不要取自会变动的分支。[](source:rollout-maintainer)
- [ ] 为你持有令牌的账户运行 `aigw setup --from team.toml --account <account>`。[](source:readme-connect)
- [ ] 依次运行 `aigw check --endpoint-only`、`aigw check` 和 `aigw verify --for all`。[](source:experience-readiness)

## AIGW 的配置里有什么？ {#p-model}

客户端绑定选用一个路由；路由指定一个账户和一个模型；令牌另放在单独的存储里。[](source:concepts) 没有全局的模型选择：`aigw use --for <client> <route>` 只改变一个绑定。[](source:readme-model)

@diagram erd id=model-erd source=model.erd.json

@steps id=model-steps
| step-binding | 客户端绑定 | 一个客户端的路由、是否启用、协议和认证方式；没有全局默认值，不继承，也不跨客户端回退。[](source:binding-concept)[](source:binding-struct) | model-erd | erd-binding |
| step-route | 路由 | 一个账户和一个模型，附带确切的上游模型 ID，以及为这一组合鉴定过的协议。[](source:route-concept)[](source:route-struct) | model-erd | erd-route |
| step-model | 模型 | 一款规范的上游产品，不随账户、协议或客户端的选择而变。[](source:model-struct) | model-erd | erd-model |
| step-account | 账户 | 提供商的端点；认证需要时，再加一个令牌槽位。配置和清单绝不包含令牌。[](source:account-concept)[](source:account-struct) | model-erd | erd-account |
| step-token | 账户令牌 | 保存在选定的存储中，既不在配置里，也不在任何客户端文件里。[](source:token-storage) | model-erd | erd-token |

原生投影（Native Projection）指单个客户端配置中归 AIGW 管的那部分，依绑定写入；缺失的客户端保持原样。[](source:projection-concept)

## 一次同步中发生了什么？ {#p-sync}

@sequence id=sync-flow title="一次同步，就是一次受保护的事务"
| actor sync-operator | 操作者 | external |
| actor sync-engine | 同步器 | backend | source:transaction |
| actor sync-store | 配置存储 | database | source:store-commit |
| actor sync-helper | 凭据入口 | security | source:entrypoint |
| actor sync-files | 客户端文件 | frontend | source:restore |
| phase | 预检 |
| sync-operator | sync-engine | aigw sync |
| sync-engine | sync-store | 重新读取配置 |
| sync-store | sync-engine | 读取后未变 | return |
| sync-engine | sync-files | 规划每处写入 |
| phase | 提交 |
| sync-engine | sync-helper | 准备一份私有副本 |
| sync-engine | sync-store | 提交配置 |
| sync-engine | sync-files | 写入每个客户端 | emphasis |
| sync-engine | sync-helper | 确认副本 |
| phase | 失败时 |
| sync-engine | sync-files | 文件仍是本次写入时才恢复 |
| sync-engine | sync-store | 恢复配置 |
| phase | 报告 |
| sync-engine | sync-operator | 结果 | return |

@steps id=sync-steps
| step-preflight | 同步器 | 配置无效，或读取之后已经变化，就拒绝；否则规划每个客户端的写入。预检失败，什么都不会改变。[](source:transaction)[](source:preflight) | sync-flow | sync-engine | | sync-engine-to-sync-store-1,sync-store-to-sync-engine-1,sync-engine-to-sync-files-1 |
| step-helper | 凭据入口 | 客户端通过一份私有的 `aigw` 副本读取令牌，副本按 SHA-256 寻址。[](source:entrypoint) 创建这份副本也是事务的一部分。[](source:commit-order) | sync-flow | sync-helper | | sync-engine-to-sync-helper-1,sync-engine-to-sync-helper-2 |
| step-commit | 配置存储 | 新的 `config.toml` 先于所有客户端文件提交，它的确切后像也会保留下来。[](source:commit-order)[](source:store-commit) | sync-flow | sync-store | | sync-engine-to-sync-store-2 |
| step-restore | 客户端文件 | 每次写入都先记下前像。出错时按逆序撤销，而且只有文件内容仍是本次写入的，才会撤销。[](source:transaction-boundary) | sync-flow | sync-files | | sync-engine-to-sync-files-2,sync-engine-to-sync-files-3 |

## 如果另一个写入者抢先了呢？ {#p-race}

@sequence id=race-flow title="回滚时，较新的修改不会丢"
| actor race-engine | 同步器 | backend | source:restore |
| actor race-first | 一个客户端文件 | frontend |
| actor race-editor | 另一个写入者 | external |
| actor race-second | 后面的客户端文件 | frontend |
| actor race-operator | 操作者 | external |
| phase | 应用 |
| race-engine | race-first | 写入后像 | emphasis |
| race-editor | race-first | 修改同一文件 |
| race-engine | race-second | 写入失败 |
| phase | 恢复 |
| race-engine | race-first | 与后像比对 |
| race-first | race-engine | 已变化 | return |
| race-engine | race-operator | 保留修改，报告该文件 | return |

@steps id=race-steps
| step-write | 一个客户端文件 | AIGW 把配置写进去，并记下写入的确切字节。 | race-flow | race-first | | race-engine-to-race-first-1 |
| step-edit | 另一个写入者 | 在这次变更完成之前，有人修改了同一个文件。 | race-flow | race-editor | | race-editor-to-race-first-1 |
| step-refuse | 同步器 | 后面有一次写入失败，于是 AIGW 按逆序恢复。这个文件已不再是它写入的内容，所以拒绝恢复：`postimage changed`、`refusing to overwrite newer state`。[](source:restore) | race-flow | race-engine | | race-engine-to-race-first-2,race-first-to-race-engine-1 |
| step-report | 操作者 | 报错信息会指明这个文件。较新的修改保留下来，其他互不相关的恢复照常继续。[](source:transaction-boundary) | race-flow | race-operator | | race-engine-to-race-operator-1 |

@callout level=warning title="这是防护，不是锁"
| 这些检查能保住已检测到的较新写入，但只是尽力而为的文件防护。编辑器如果不理会 AIGW 的修改锁，这些检查就起不到跨进程 compare-and-swap 的作用。[](source:transaction-boundary)[](source:store-lock) |

## 客户端的令牌从哪里来？ {#p-token}

写给客户端的配置里，写明的是凭据助手和投影指纹，绝不是令牌本身。[](source:helper-projection)[](source:token-storage)

@sequence id=token-flow title="令牌按需读取"
| actor token-client | 原生客户端 | frontend |
| actor token-helper | 凭据助手 | backend | source:credential |
| actor token-store | 令牌存储 | security | source:token-store |
| actor token-endpoint | 提供商端点 | external |
| token-client | token-helper | 客户端 + 投影指纹 |
| token-helper | token-store | 读取账户令牌 |
| token-store | token-helper | 令牌 | return |
| token-helper | token-client | 经标准输出返回令牌 | return |
| token-client | token-endpoint | 携带令牌的请求 | emphasis |
| token-endpoint | token-client | 响应 | return |

@steps id=token-steps
| step-match | 凭据助手 | 校验所请求的投影，只把对应的令牌写到标准输出。指纹指明一个客户端绑定，并不授权调用方。[](source:credential) | token-flow | token-helper | | token-client-to-token-helper-1,token-helper-to-token-client-1 |
| step-read | 令牌存储 | 使用平台凭据服务时，每次读取都在子进程中运行，时限 5 秒。存储不可用时直接拒绝，不会改试其他存储。[](source:token-store) | token-flow | token-store | | token-helper-to-token-store-1,token-store-to-token-helper-1 |
| step-call | 提供商端点 | 客户端自行发送请求；AIGW 不在请求路径上。[](source:boundary) | token-flow | token-endpoint | | token-client-to-token-endpoint-1,token-endpoint-to-token-client-1 |

## 每一级检查能证明多少？ {#p-ready}

AIGW 的输出回答三个问题：选中了什么，是否就绪，下一步做什么才安全。[](source:experience-questions)

@steps id=ready-steps
| step-status | aigw status | 报告当前的选择，以及本地写入的配置是否就绪；不读取令牌，也不运行客户端。[](source:experience-readiness) |
| step-endpoint | aigw check --endpoint-only | 检查每个端点，不做推理。[](source:readme-check) |
| step-inference | aigw check | 为每个已启用的客户端发一次请求，用的是该路由的确切模型；可能消耗提供商配额。[](source:readme-check)[](source:experience-readiness) |
| step-verify | aigw verify --for all | 在每个客户端里真实运行一次会话；全部通过后记录检查点，`aigw rollback` 优先恢复的就是它。[](source:verify-checkpoint)[](source:rollback-checkpoint) |

| 状态       | 含义                                                                     |
| ---------- | ------------------------------------------------------------------------ |
| 已配置     | 本地前提条件满足，尚未观测端点。                                         |
| 端点已检查 | 一次端点诊断成功；模型推理和真实客户端运行都还没有证实。                 |
| 推理已检查 | 一次请求成功，用的是路由的确切模型；客户端行为和后续可用性都还没有证实。 |
| 已推迟     | 凭据或客户端配置有意推迟。                                               |
| 降级       | 路由仍在配置中，但有可恢复的问题。                                       |
| 无效       | 配置或自有状态不能安全使用。                                             |
| 不可用     | 缺少一项必需的外部能力。                                                 |

设置、同步、检视和验证，都用这些状态报告。[](source:readiness)

## 提供商的模型如何成为路由？ {#p-route}

提供商目录是观测结果，不是配置。模型只有走一条审阅过的路由，才能到达客户端。[](source:catalog-states)

@diagram lifecycle id=route-life source=route.lifecycle.json

@steps id=route-steps
| step-observed | 已观测 | 按协议查询目录，成功取得一次响应；出现在目录里，不证明具备任何能力。[](source:catalog-states) | route-life | route-observed |
| step-candidate | 候选 | 已观测到的上游 ID，在该账户和协议上没有匹配的路由。[](source:catalog-states) | route-life | route-candidate |
| step-qualified | 已鉴定 | 对指定能力，有明确的协议证据和真实客户端证据。Chat Completions 成功，并不能让 Responses 通过鉴定。[](source:catalog-states)[](source:catalog-qualify) | route-life | route-qualified |
| step-admitted | 已准入 | 配置里一条审阅过的路由，客户端可以绑定。[](source:catalog-states) | route-life | route-admitted |
| step-deprecated | 已弃用 | 为现有绑定保留，但不再推荐。[](source:catalog-states) | route-life | route-deprecated |
| step-retired | 已退役 | 等到不再有绑定或推荐需要它，才移除。[](source:catalog-states) | route-life | route-retired |

## 哪些部分让各客户端保持一致？ {#p-parts}

`aigw setup`、`use`、`sync`、`rollback` 和 `uninstall`，都走同一条同步路径到达客户端。

@diagram architecture id=parts-map source=parts.architecture.json

@steps id=parts-steps
| step-synchronization | 同步 | 规划每个客户端的写入，提交配置，再写入各客户端，整个过程是一次事务。[](source:preflight)[](source:commit-order) | parts-map | parts-sync |
| step-store | 配置存储 | 管理 `config.toml`、它的锁和回滚副本，并保留自己写入的确切文件，供受保护的回滚使用。[](source:store-owner)[](source:store-commit) | parts-map | parts-store |
| step-seam | 适配器接口 | 所有客户端共用一份契约：发现、收敛、规划、应用、检视、验证和撤回。[](source:seam) | parts-map | parts-seam |
| step-codex | Codex | `~/.codex/config.toml` 中归 AIGW 管的一块，以及模型目录。 | parts-map | parts-codex |
| step-claude-code | Claude Code | `~/.claude/settings.json`：端点、模型偏好和凭据助手。 | parts-map | parts-claude-code |
| step-claude-desktop | Claude Desktop | 单独的第三方推理库。 | parts-map | parts-claude-desktop |
| step-hermes | Hermes | Hermes 的提供商目录、协议和模型。 | parts-map | parts-hermes |

## 为什么要用一次受保护的事务？ {#p-decision}

一次变更可能涉及多个客户端。DR-0006 权衡了写入它们的三种方式。[](source:decision)[](source:rejected)

| 方案             | 失败后留下什么                 | 决定             |
| ---------------- | ------------------------------ | ---------------- |
| 逐个尽力写入     | 客户端看到一部分新状态。       | 否决 {bad:否决}  |
| 无条件回滚       | 后来者写入的字节可能被覆盖。   | 否决 {bad:否决}  |
| 一次受保护的事务 | 只有自己的写入仍在时，才恢复。 | 采用 {good:采用} |

决策记录写明了一种需要重新审视的情形：所有客户端写入都改由同一个更强的原子存储承载，并提供同等保护。[](source:revisit)

## AIGW 管什么，又把什么留给别人？ {#p-owners}

四个问题里，AIGW 只回答一个，其余交给专门解决这些问题的产品。[](source:research-responsibilities)[](source:research-restraint)

| 职责       | 要回答的问题                       | 归属               |
| ---------- | ---------------------------------- | ------------------ |
| 配置控制   | 这个客户端应该用什么？             | AIGW {good:AIGW}   |
| 请求执行   | 请求如何到达兼容的服务？           | 客户端、网关和代理 |
| 会话连续性 | 进行中的任务，含义能否保持不变？   | 各客户端           |
| 组织访问   | 谁可以使用哪些资源，费用由谁承担？ | 共享网关           |

@facts
| Codex | 对话、JSONL、SQLite 和 Desktop 图形界面状态[](source:owners) |
| Claude Code | 会话和无关的设置[](source:readme-boundaries) |
| 兼容端点 | 运营归它们自己；AIGW 绝不安装、启动、停止或诊断它们[](source:readme-boundaries) |
| 新客户端 | 每个都需要单独的适配器准入；提供商支持某个协议，并不等于准入了客户端[](source:adapter-admission) |

## AIGW 如何安装、更新和回滚？ {#p-release}

@facts
| 安装 | 已签名、经公证的 Homebrew cask，或面向 Darwin、Linux 和 Windows（AMD64 与 ARM64）的便携归档包。[](source:readme-install) |
| 更新 | 便携更新在计算哈希、解压或运行任何内容之前，先用 AIGW 内置的发布密钥验证 `checksums.txt.sig`。[](source:readme-update-trust) |
| 代码托管平台 | GitLab 和 GitHub 彼此独立；一个发布版本绝不由两者拼合而成。[](source:readme-update-trust) |
| 回滚 | 前一版本必须先读取一份隔离的配置副本，否则程序和配置都保持不变。[](source:readme-rollback) |
| 卸载 | 撤回 AIGW 写入客户端的配置；账户、路由、绑定、令牌和你自己的客户端状态都会保留。[](source:readme-uninstall) |

## 哪些已经交付，哪些仍待解决？ {#p-maturity}

发布支持只覆盖已取得完整原生证据的客户端。[](source:readme-adapters)

| 范围                         | 状态                              | 含义                                                                                                                        |
| ---------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Codex、Claude Code 和 Hermes | 已验收 {good:真实客户端}          | 发布流程以已发布的前一版本为基线，让每个真实客户端依次升级、回滚、再升级；缺少客户端即判失败。[](source:acceptance-journey) |
| Claude Desktop               | 单独 {good:自有证据}              | Desktop 需要单独鉴定；CLI 证据不能替代它。[](source:acceptance-journey)                                                     |
| Windows 上的 Hermes          | 未验证 {caution:待定}             | 在原生启动器可以隔离之前，验证流程拒绝启动 Hermes。[](source:acceptance-windows)                                            |
| 文件防护                     | 尽力而为 {caution:是防护，不是锁} | 能保住检测到的较新写入，但不是跨进程的 compare-and-swap。[](source:transaction-boundary)                                    |
