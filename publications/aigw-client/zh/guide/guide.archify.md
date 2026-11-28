# AIGW 怎样让团队的每个 AI 客户端，都和同一份审阅过的配置保持一致？ {#guide}

AIGW 是面向团队 AI 客户端的本地优先控制面。[](source:readme-what) 审阅过的提供商、模型，以及客户端的模型选择，都放在同一个加锁文件 `aigw.toml` 里。[](source:store-owner) 写入时，它对每个受支持客户端只改写自己的那部分设置，全程是一次带防护的事务。[](source:transaction) 请求绝不经过 AIGW：每个客户端按需读取自己的令牌，自己调用端点。[](source:boundary)

- [它控制的是配置，不是流量](block:p-owners)：请求执行、会话连续性和团队访问，仍由客户端和网关负责。[](source:research-boundary)[](source:research-restraint)
- [同步失败时，只恢复它自己写过的文件](block:p-race)，其他写入者后来的修改不会丢失。[](source:restore)
- [客户端文件里没有令牌](block:p-token)：客户端需要时，由凭据助手从选定的那个存储读取令牌。[](source:helper-projection)
- [每一级检查多证明一件事](block:p-ready)，而客户端文件已同步，不等于请求已得到应答。[](source:experience-readiness)

@answer scope="AIGW v0.12.0 · 提交 e228861 · 源代码及自带文档"
@meta locale=zh-CN style=editorial
@source readme-what title="AIGW 是什么" path="README.md" lines=3:6
@source readme-install title="安装" path="README.md" lines=30:43
@source readme-team title="应用团队文件" path="README.md" lines=122:135
@source readme-connect title="连接一个提供商" path="README.md" lines=135:142
@source readme-activate title="稍后激活" path="README.md" lines=152:159
@source readme-use title="use 添加什么" path="README.md" lines=117:118
@source readme-sync title="sync 改变什么" path="README.md" lines=170:176
@source readme-credentials title="凭据存储" path="README.md" lines=178:183
@source readme-depths title="check 的四级深度" path="README.md" lines=210:217
@source readme-model title="产品模型" path="README.md" lines=283:294
@source readme-adapters title="受支持的客户端" path="README.md" lines=296:302
@source readme-boundaries title="边界" path="README.md" lines=310:322
@source readme-rollback title="程序回滚" path="README.md" lines=350:357
@source readme-uninstall title="卸载" path="README.md" lines=381:386
@source readme-update-trust title="已签名的更新" path="README.md" lines=392:399
@source readme-check title="不做推理的检查" path="README.md" lines=24:26
@source concepts title="三个名词" path="docs/concepts/product-concepts.md" lines=11:14
@source provider-concept title="提供商" path="docs/concepts/product-concepts.md" lines=46:59
@source model-concept title="模型" path="docs/concepts/product-concepts.md" lines=63:82
@source family-concept title="模型家族" path="docs/concepts/product-concepts.md" lines=91:95
@source selection-concept title="客户端的模型选择" path="docs/concepts/product-concepts.md" lines=97:123
@source client-files-concept title="客户端文件" path="docs/concepts/product-concepts.md" lines=125:144
@source catalog-states title="提供商清单的生命周期" path="docs/concepts/product-concepts.md" lines=181:194
@source catalog-qualify title="鉴定与移除" path="docs/concepts/product-concepts.md" lines=196:202
@source provider-struct title="配置中的提供商" path="internal/domain/model.go" lines=79:86
@source family-struct title="配置中的模型家族" path="internal/domain/model.go" lines=88:93
@source model-struct title="配置中的模型" path="internal/domain/model.go" lines=95:109
@source selection-struct title="配置中某个客户端的模型选择" path="internal/domain/clients.go" lines=250:268
@source research-responsibilities title="四种职责" path="docs/research/provider-tooling-assessment.md" lines=48:57
@source research-boundary title="更窄的边界" path="docs/research/provider-tooling-assessment.md" lines=204:207
@source research-restraint title="不做又一个工作台" path="docs/research/provider-tooling-assessment.md" lines=211:219
@source research-value title="AIGW 的价值假设" path="docs/research/provider-tooling-assessment.md" lines=231:235
@source experience-questions title="三个问题" path="docs/experience/terminal-experience.md" lines=11:15
@source experience-readiness title="就绪状态，逐项分解" path="docs/experience/terminal-experience.md" lines=17:27
@source adapter-admission title="两种准入" path="docs/governance/adapter-admission.md" lines=13:23
@source acceptance-journey title="真实客户端的发布流程" path="docs/operations/real-client-acceptance.md" lines=66:76
@source rollout-intro title="团队推行" path="docs/guides/team-rollout.md" lines=11:13
@source rollout-maintainer title="维护者的步骤" path="docs/guides/team-rollout.md" lines=15:29
@source boundary title="权威来源与统一配置的边界" path="docs/architecture/authority-and-projection-boundary.md" lines=38:41
@source owners title="哪些状态归谁" path="docs/architecture/authority-and-projection-boundary.md" lines=48:59
@source transaction title="同步事务" path="internal/app/synchronization/transaction.go" lines=77:96
@source preflight title="预检" path="internal/app/synchronization/preview.go" lines=151:220
@source commit-order title="先入口，再配置，最后写入客户端文件" path="internal/app/synchronization/transaction.go" lines=113:138
@source transaction-boundary title="事务边界" path="docs/architecture/security-model.md" lines=196:210
@source restore title="带防护的恢复" path="internal/platform/files.go" lines=186:200
@source store-commit title="提交配置" path="internal/store/store.go" lines=79:82
@source store-owner title="存储管什么" path="internal/store/store.go" lines=1:3
@source store-lock title="修改锁" path="internal/store/store.go" lines=196:215
@source client-program title="客户端使用哪个程序" path="internal/adapter/program.go" lines=25:32
@source seam title="适配器契约" path="internal/adapter/registry.go" lines=118:131
@source entrypoint title="凭据入口" path="docs/architecture/security-model.md" lines=70:78
@source credential title="凭据协议" path="docs/architecture/security-model.md" lines=135:143
@source token-storage title="令牌存放在哪里" path="docs/architecture/security-model.md" lines=13:16
@source token-store title="读取选定的存储" path="docs/architecture/security-model.md" lines=37:43
@source helper-projection title="Claude Desktop 的客户端文件" path="internal/adapter/claudedesktop/adapter.go" lines=230:244
@source check-depths title="检查深度的阶梯" path="internal/cli/check/depth.go" lines=15:34
@source verify-snapshot title="检查何时写入已验证快照" path="internal/cli/check/snapshot.go" lines=20:32
@source rollback-snapshot title="config rollback 恢复什么" path="internal/cli/config/rollback.go" lines=159:169
@source decision title="DR-0006：一次带防护的事务" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=15:30
@source rejected title="DR-0006：被否决的方案" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=32:37
@source revisit title="DR-0006：何时重新审视" path="docs/decisions/dr-0006-transactional-client-projection.md" lines=45:48
@source readiness title="就绪状态" path="internal/app/readiness/state.go" lines=1:27
@source readme-for title="aigw 接受的客户端" path="README.md" lines=166:166
@source readme-environment title="环境变量中的令牌" path="README.md" lines=185:187
@source manifest-provider title="团队文件里的一个提供商" path="manifests/team.toml" lines=1:18
@source changelog-010 title="0.1.0 的发布" path="CHANGELOG.md" lines=1640:1648
@source changelog-0120 title="0.12.0 的发布" path="CHANGELOG.md" lines=14:106
@source setup-model-kept title="首次 setup 保留的模型偏好" path="CHANGELOG.md" lines=638:642
@source team-labels title="团队文件替换的 label" path="CHANGELOG.md" lines=643:645
@source check-parent-session title="在智能体会话里检查客户端" path="CHANGELOG.md" lines=646:650
@source check-client-report title="客户端自己报出的警告或错误" path="CHANGELOG.md" lines=600:611
@source check-codex-memory title="检查客户端时 Codex 的记忆任务" path="CHANGELOG.md" lines=612:613
@source redaction-forms title="脱敏涵盖的凭据形式" path="CHANGELOG.md" lines=614:618
@source check-schema title="aigw check 的 JSON 文档" path="CHANGELOG.md" lines=622:626
@source team-lines title="每条产品线的最新模型" path="CHANGELOG.md" lines=627:629
@source keychain-foreign title="另一个程序存入的钥匙串条目" path="CHANGELOG.md" lines=533:558
@source rollback-credentials title="程序回滚不移动凭据" path="CHANGELOG.md" lines=565:569
@source keychain-migration title="没有命令迁移钥匙串条目" path="CHANGELOG.md" lines=570:576
@source token-empty title="已存入但为空的令牌" path="CHANGELOG.md" lines=583:590
@source team-per-provider title="按提供商挑选模型" path="CHANGELOG.md" lines=459:463
@source team-selection title="应用团队文件时为谁选定模型" path="internal/cli/setup/team.go" lines=74:79
@source model-label title="为模型自动生成的 label" path="internal/domain/model.go" lines=598:637
@source label-shared title="同一提供商的两个模型 label 相同" path="internal/domain/model_validation.go" lines=87:100
@source label-refusal title="因 label 相同而拒绝时指出什么" path="internal/domain/model_errors.go" lines=135:146
@source team-label-refusal title="因 label 相同而拒绝团队文件" path="internal/cli/setup/team.go" lines=199:212
@source family-created title="model add 新建的模型家族" path="internal/cli/model/add.go" lines=210:224
@source family-edited title="model edit 新建的模型家族" path="internal/cli/model/edit.go" lines=108:111
@source model-name title="不带提供商的模型名称" path="internal/domain/model.go" lines=188:202
@source codex-alias title="Codex 模型清单里的别名" path="internal/adapter/codex/modelcatalog/document.go" lines=76:119
@source codex-alias-name title="Codex 的别名取哪个名称" path="internal/adapter/codex/catalog.go" lines=227:227
@source hermes-yaml title="YAML 库" path="go.mod" lines=21:21
@source hermes-encode title="Hermes 的配置怎样写出" path="internal/adapter/hermes/document.go" lines=115:120
@source hermes-blocks title="Hermes 配置里的字面块" path="CHANGELOG.md" lines=481:486
@source hermes-folded title="Hermes 配置里的折叠块标量" path="CHANGELOG.md" lines=503:505
@source team-apply title="不论令牌结果如何都应用团队文件" path="internal/cli/setup/team.go" lines=214:218
@source team-acquire title="setup 要求输入哪些令牌" path="internal/cli/setup/team_tokens.go" lines=14:21
@source team-choose title="询问你持有哪些提供商的令牌" path="internal/cli/setup/team_tokens.go" lines=60:62
@source team-askable title="询问时列出哪些提供商" path="internal/cli/setup/team_tokens.go" lines=89:92
@source team-token-read title="提供商被跳过或令牌不被接受时" path="internal/cli/setup/team_tokens.go" lines=157:165
@source prompt-cancelled title="在提示处取消" path="internal/cli/invocation/failure.go" lines=78:84
@source exit-failure title="命令失败时的退出码" path="cmd/aigw/main.go" lines=37:40
@source team-schema title="aigw setup --from 的 JSON 文档" path="internal/cli/setup/team.go" lines=25:29
@source team-token-states title="应用团队文件后提供商令牌的状态" path="internal/cli/setup/team.go" lines=31:45
@source team-token-item title="文档里令牌的状态和原因" path="internal/cli/setup/team_report.go" lines=137:145
@source token-refusal title="提供商拒绝令牌" path="CHANGELOG.md" lines=425:428
@source token-validate title="setup 怎样校验令牌" path="internal/cli/setup/team.go" lines=411:417
@source token-catalog-request title="向提供商清单发出的请求" path="internal/domain/probe.go" lines=34:36
@source token-limit title="令牌校验的已知局限" path="CHANGELOG.md" lines=440:448
@source team-suheai title="团队文件里的 Suhe.AI" path="manifests/team.toml" lines=473:476
@source team-recommendations title="团队文件里的推荐" path="manifests/team.toml" lines=731:761
@source team-export-arrays title="导出的团队文件里的宽数组" path="internal/store/file.go" lines=343:362
@source team-prune title="导入保留哪些本地配置" path="internal/domain/team_merge.go" lines=96:103
@source team-keep-local title="--keep-local 选项" path="internal/cli/setup/setup.go" lines=84:84
@source follow-working title="每条命令所依据的配置" path="internal/app/synchronization/follow.go" lines=72:78
@source follow-codex title="Codex 自选的模型" path="internal/adapter/codex/adapter_selection.go" lines=11:17
@source follow-hermes title="Hermes 自选的模型" path="internal/adapter/hermes/adapter.go" lines=231:238
@source claude-overrides title="Claude Code 的 modelOverrides" path="internal/adapter/claude/model_overrides.go" lines=12:17
@source desktop-behaves title="Claude Desktop 模型条目中的 behavesAs" path="internal/adapter/claudedesktop/adapter.go" lines=257:260
@source token-deadline title="凭据操作到时限时进行到哪一步" path="CHANGELOG.md" lines=393:396
@source token-unobserved title="凭据存储说不清令牌在不在" path="internal/app/activation/activation.go" lines=70:73
@source token-unobserved-action title="凭据存储说不清时的下一步" path="internal/app/activation/activation.go" lines=140:149
@source waiting-checked title="等待令牌的客户端的文件" path="internal/app/synchronization/record.go" lines=62:68
@source check-schema-version title="aigw check 的 JSON 文档版本" path="internal/cli/check/report.go" lines=14:19

## 谁使用 AIGW，它又牵涉到什么？ {#p-context}

AIGW 有一条价值假设：团队成员只要持有任一受支持提供商的凭据，就能得到可用的客户端配置，看得懂，也能安全撤回。[](source:research-value)

@facts
| 客户端 | `<client>` 可取 `claude`、`claude-desktop`、`codex` 和 `hermes` |
| 凭据存储 | 平台凭据服务可用时就用它，否则用唯一的本地后备存储；用 `AIGW_SECRET_BACKEND` 显式选定 `keyring`、`file` 或 `env` 时，出错即拒绝 |
| 环境变量中的令牌 | 只读，取自 `AIGW_TOKEN_<PROVIDER>`；客户端进程必须继承同一环境 |

这些取值由 AIGW 固定。[](source:readme-for)[](source:readme-credentials)[](source:readme-environment)团队编订一份团队文件，只收录审阅过的提供商端点和通过鉴定的模型，不含令牌。[](source:rollout-maintainer)

AIGW 自带一份团队文件，其中每个提供商在 Claude、GPT 和 Gemini 各条产品线上，都保留它已列出、也在它那里通过鉴定的最新模型。[](source:team-lines)[](source:team-per-provider)这份文件收录四个提供商：DMXAPI、UCloud、AIHubMix 和 Suhe.AI，并为每个客户端在每个提供商上各推荐一个模型。[](source:team-suheai)[](source:team-recommendations)下面是仓库自带 `manifests/team.toml` 的开头：文件版本，以及一个提供商和它的两个模型。[](source:manifest-provider)

@code id=provider source=manifest-provider language=toml

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-maintainer | 团队维护者 | 编订一份审阅过、不含令牌的团队文件，按标签或提交发布，不从会变动的分支发布。[](source:rollout-maintainer) | context-map | ctx-maintainer |
| step-ctx-member | 团队成员 | 应用这份团队文件，只连接自己持有令牌的提供商。[](source:readme-team) | context-map | ctx-member |
| step-ctx-control | AIGW 控制面 | 保管提供商、它们的令牌和模型，让每个客户端指向一个模型；不转发请求，不运行网关，对话状态也不归它管。[](source:readme-what) | context-map | ctx-control |
| step-ctx-clients | 受支持的客户端 | Codex、Claude Code、Claude Desktop 和 Hermes；AIGW 只把自己的设置写进它们的文件。发布版本要支持某个客户端，必须先取得完整的原生证据。[](source:readme-what)[](source:readme-adapters) | context-map | ctx-clients |
| step-ctx-store | 凭据存储 | 平台凭据服务、本地后备存储，或只读的环境变量；一旦显式选定，出错即拒绝。[](source:readme-credentials) | context-map | ctx-store |
| step-ctx-endpoints | 提供商端点 | 直连的 URL，或独立运营的兼容端点；AIGW 保存这一选择，但绝不运营该服务。[](source:readme-boundaries) | context-map | ctx-endpoints |

## 团队如何起步？ {#p-team}

团队分发一份审阅过的公开团队文件，令牌由每位成员在本地提供。[](source:rollout-intro)

@diagram workflow id=rollout-flow source=rollout.workflow.json

@steps id=rollout-steps
| step-curate | 编订团队文件 | 只收录审阅过的提供商端点和通过鉴定的模型；令牌、个人路径、身份和发布凭据一概不收。[](source:rollout-maintainer) | rollout-flow | rollout-curate |
| step-publish | 按标签发布 | 从发布标签或不可变的提交发布，让每位成员拿到同一份文件。[](source:rollout-maintainer) | rollout-flow | rollout-publish |
| step-install | 安装 AIGW | 在 macOS 上用已签名、经公证的 Homebrew cask，或用便携归档包（macOS 只有 ARM64 版，Linux 有 AMD64 和 ARM64 版），由 `aigw self install` 安装。[](source:readme-install) | rollout-flow | rollout-install |
| step-import | 应用团队文件 | 应用时，既不需要备齐每个提供商的令牌，也不需要先装好客户端。[](source:readme-team)AIGW 只为还没有选定模型的客户端按推荐选定一个模型；客户端已有的模型选择保持不变。[](source:team-selection)预览、结果和 `--json` 都会列出文件替换的每个 `label`，涵盖提供商、模型家族和模型，新旧取值并列。[](source:team-labels) | rollout-flow | rollout-import |
| step-connect | 连接一个提供商 | 只指定你持有令牌的提供商；其余提供商仍然可用，但不会成为前提。[](source:readme-connect)[](source:readme-activate) | rollout-flow | rollout-connect |
| step-check | 同步并检查 | 凡是模型、认证和客户端文件都可用的已启用客户端，`aigw sync` 都会更新，但绝不会创建缺失的客户端。[](source:readme-sync) | rollout-flow | rollout-check |

`aigw setup --from` 不论各个令牌结果如何，都会应用团队文件。[](source:team-apply)在终端里，命令没有指定提供商时，它先问你持有哪些提供商的令牌。[](source:team-acquire)[](source:team-choose)它只列出文件里那些还没有存入令牌的提供商，你可以一个都不选。[](source:team-askable)[](source:team-choose)随后它只要求输入所选提供商的令牌，直接按回车就跳过当前提供商。[](source:team-acquire)[](source:team-token-read)

提供商不接受某个令牌时，你可以重新输入，也可以跳过这个提供商。[](source:team-token-read)命令会报告这个提供商，附上原因和修复办法；团队文件、已被接受的令牌和客户端文件仍在一次事务里写入。[](source:team-apply)

你在某个提示处取消时，命令在写入任何内容之前就结束。[](source:prompt-cancelled)经标准输入传入的令牌如果不被提供商接受，并不阻止写入，命令以退出码 1 结束。[](source:team-apply)[](source:exit-failure)

导入会移除没有客户端选用、也没有推荐指向的本地独有模型。随后，不再有模型使用的本地独有模型家族也会移除。[](source:team-prune)加上 `--keep-local`，所有本地独有的条目都会保留。[](source:team-keep-local)客户端的模型选择都不变。[](source:team-prune)

`aigw setup --from --json` 输出的文档 `schema_version` 为 6，第 6 版新增了 `changed_windows`。[](source:team-schema)其中令牌的 `state` 可以是 `rejected`（提供商拒绝了它）或 `unverified`（校验没有得出结论），两者都附带 `reason`。[](source:team-token-states)[](source:team-token-item)提供商拒绝令牌时，报告写明是哪个提供商，并附上 HTTP 状态码。[](source:token-refusal)

`aigw setup --from` 校验令牌时，只向提供商清单发一次请求。[](source:token-validate)[](source:token-catalog-request)清单对任何令牌都应答的提供商，在这次请求里拒绝不了错误的令牌，命令因此把这类令牌报告为已接受。[](source:token-limit)`aigw check` 会为每个客户端选定的模型发一次推理请求。一旦有客户端选用该提供商的模型，这项检查就会查出令牌有误。[](source:token-limit)

- [ ] 从团队标签保存审阅过的 `team.toml`，不要取自会变动的分支。[](source:rollout-maintainer)
- [ ] 为你持有令牌的提供商运行 `aigw setup --from team.toml --provider <provider>`。[](source:readme-connect)
- [ ] 依次运行 `aigw check --depth endpoint`、`aigw check` 和 `aigw check --depth client`。[](source:experience-readiness)

## AIGW 的配置里有什么？ {#p-model}

客户端选用一个模型，名为 `provider/model`。端点和令牌归提供商，令牌另放在单独的存储里。[](source:concepts) 没有全局的模型选择：`aigw use <client> <provider/model>` 只改变一个客户端。[](source:readme-model)

@diagram erd id=model-erd source=model.erd.json

@steps id=model-steps
| step-selection | 客户端的模型选择 | 一个客户端的模型、是否启用、协议和程序声明；没有全局默认值，不继承，也不跨客户端回退。[](source:selection-concept)[](source:selection-struct) | model-erd | erd-selection |
| step-model | 模型 | 某个提供商提供的模型，名为 `provider/model`；`/` 之后是提供商自己的模型 ID，逐字节照录。模型还声明 AIGW 可以在哪些协议上使用它。模型可以声明上下文窗口，AIGW 把它交给 Codex 和 Hermes；不声明时为 1,000,000 个 token。[](source:model-concept)[](source:model-struct) | model-erd | erd-model |
| step-family | 模型家族 | 可选：说明提供商的某个模型是哪个规范模型，便于比较不同变体和不同提供商。[](source:family-concept)[](source:family-struct)`aigw model add --family` 或 `aigw model edit --family` 新建的模型家族，`label` 就是它自己的 ID。[](source:family-created)[](source:family-edited) | model-erd | erd-family |
| step-provider | 提供商 | 你持有其令牌的服务：每个协议一个端点；认证需要时，再加一个令牌槽位。配置和团队文件绝不包含令牌。[](source:provider-concept)[](source:provider-struct) | model-erd | erd-provider |
| step-token | 令牌 | 保存在选定的存储中，既不在配置里，也不在任何客户端文件里。[](source:token-storage) | model-erd | erd-token |

模型没有自己的 `label` 时，AIGW 用提供商和模型家族的 `label` 生成一个。如果模型 ID 以模型家族 ID 开头或结尾，此外还有内容，生成的 `label` 就再带上多出的那部分。[](source:model-label)同一提供商的两个模型 `label` 相同，AIGW 就拒绝其所在的配置或团队文件；比较不分大小写，`label` 是显式写明还是自动生成都一样。[](source:label-shared)[](source:team-label-refusal)拒绝时会指出这两个模型和这个 `label`。[](source:label-refusal)

客户端文件指单个客户端自身配置中归 AIGW 管的那部分。AIGW 只在其中写入和撤回自己的设置。客户端如果缺失，或还没有选定模型，就保持原样。[](source:client-files-concept)

客户端用 `program` 写明程序的绝对路径，或用 `extensions` 写明编辑器的扩展目录，以此声明自己的程序。两者都不声明时，客户端接管在 `PATH` 上或固定应用路径下找到的程序，并记为 `program`；这一步只做一次。[](source:selection-concept)AIGW 从不替换已声明的程序：程序不见了，计划就让这个客户端停下。[](source:client-program)

每条命令都从存储的配置出发；Codex 或 Hermes 在自身文件里选定了模型，就把它当作这个客户端的模型选择。[](source:follow-working)[](source:follow-codex)[](source:follow-hermes)命令自身的改动叠加在上面，所以命令指定的模型选择优先。不论提供商有没有令牌，AIGW 都跟随客户端自选的模型。[](source:follow-working)

## 一次同步中发生了什么？ {#p-sync}

@sequence id=sync-flow title="一次同步，就是一次带防护的事务"
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
| sync-engine | sync-files | 写入每个客户端的文件 | emphasis |
| sync-engine | sync-helper | 确认副本 |
| phase | 失败时 |
| sync-engine | sync-files | 文件内容仍是本次写入的才恢复 |
| sync-engine | sync-store | 恢复配置 |
| phase | 报告 |
| sync-engine | sync-operator | 结果 | return |

@steps id=sync-steps
| step-preflight | 同步器 | 配置无效，或读取之后已经变化，就拒绝；否则规划每个客户端文件的写入。预检失败，什么都不会改变。[](source:transaction)[](source:preflight)已停下的客户端，除了撤回这次变更去掉的文件，什么都不规划；其余客户端照常规划。[](source:preflight) | sync-flow | sync-engine | | sync-engine-to-sync-store-1,sync-store-to-sync-engine-1,sync-engine-to-sync-files-1 |
| step-helper | 凭据入口 | 客户端通过一份私有的 `aigw` 副本读取令牌，副本按 SHA-256 寻址。[](source:entrypoint) 创建这份副本也是事务的一部分。[](source:commit-order) | sync-flow | sync-helper | | sync-engine-to-sync-helper-1,sync-engine-to-sync-helper-2 |
| step-commit | 配置存储 | 新的 `aigw.toml` 先于所有客户端文件提交，它的确切后像也会保留下来。[](source:commit-order)[](source:store-commit) | sync-flow | sync-store | | sync-engine-to-sync-store-2 |
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
| step-write | 一个客户端文件 | AIGW 把自己的设置写进去，并记下写入的确切字节。 | race-flow | race-first | | race-engine-to-race-first-1 |
| step-edit | 另一个写入者 | 在这次变更完成之前，有人修改了同一个文件。 | race-flow | race-editor | | race-editor-to-race-first-1 |
| step-refuse | 同步器 | 后面有一次写入失败，于是 AIGW 按逆序恢复。这个文件已不再是它写入的内容，所以拒绝恢复：`postimage changed`、`refusing to overwrite newer state`。[](source:restore) | race-flow | race-engine | | race-engine-to-race-first-2,race-first-to-race-engine-1 |
| step-report | 操作者 | 报错信息会指明这个文件。较新的修改保留下来，其他互不相关的恢复照常继续。[](source:transaction-boundary) | race-flow | race-operator | | race-engine-to-race-operator-1 |

@callout level=warning title="这是防护，不是锁"
| 这些检查能保住已检测到的较新写入，但只是尽力而为的文件防护。编辑器如果不理会 AIGW 的修改锁，这些检查就起不到跨进程 compare-and-swap 的作用。[](source:transaction-boundary)[](source:store-lock) |

## 客户端的令牌从哪里来？ {#p-token}

客户端文件里写明的是凭据助手和一个指纹，指纹对应客户端、提供商和端点；写明的绝不是令牌本身。[](source:helper-projection)[](source:credential)[](source:token-storage)

@sequence id=token-flow title="令牌按需读取"
| actor token-client | 原生客户端 | frontend |
| actor token-helper | 凭据助手 | backend | source:credential |
| actor token-store | 凭据存储 | security | source:token-store |
| actor token-endpoint | 提供商端点 | external |
| token-client | token-helper | 客户端 + 指纹 |
| token-helper | token-store | 读取提供商的令牌 |
| token-store | token-helper | 令牌 | return |
| token-helper | token-client | 经标准输出返回令牌 | return |
| token-client | token-endpoint | 携带令牌的请求 | emphasis |
| token-endpoint | token-client | 响应 | return |

@steps id=token-steps
| step-match | 凭据助手 | 校验这次请求，只把对应的令牌写到标准输出。指纹指明一个客户端、提供商和端点，并不授权调用方。[](source:credential) | token-flow | token-helper | | token-client-to-token-helper-1,token-helper-to-token-client-1 |
| step-read | 凭据存储 | 使用平台凭据服务时，每次读取都在子进程中运行，时限 5 秒。存储不可用时直接拒绝，不会改试其他存储。[](source:token-store)操作到了时限，会指出错过的是哪一步：创建子进程、启动子进程，还是等它应答。[](source:token-deadline) | token-flow | token-store | | token-helper-to-token-store-1,token-store-to-token-helper-1 |
| step-call | 提供商端点 | 客户端自行发送请求；AIGW 不在请求路径上。[](source:boundary) | token-flow | token-endpoint | | token-client-to-token-endpoint-1,token-endpoint-to-token-client-1 |

在 macOS 上，0.3.5 及更早版本存入的钥匙串条目，AIGW 不接管，也没有命令会迁移这类条目。[](source:keychain-foreign)[](source:keychain-migration)macOS 不让 AIGW 读取这类条目；读不了的条目，AIGW 也不替换。需要这份凭据的命令，例如 `aigw use` 或 `aigw client enable`，就此结束。它会说明条目是另一个程序存入的，并给出修复办法：先备好凭据，删除该条目，再重新存入。[](source:keychain-foreign)

`aigw sync` 和 `aigw config rollback` 照常完成，除非这类客户端有文件通不过下面所说的检查。[](source:keychain-foreign)[](source:waiting-checked)`aigw setup --from` 没有指定这个提供商时，也照常完成。这类提供商的客户端继续等待，文件保持不变，和缺少令牌时一样。[](source:keychain-foreign)

`aigw check --depth local` 和 `aigw status` 会报告这类条目，不把它算作已存入的令牌。[](source:keychain-foreign)写入客户端文件时，已存入但为空的令牌也按缺少令牌处理。[](source:token-empty)

命令指定了等待中的客户端时，仍检查其文件。文件或记录缺失、在 AIGW 之外被改动、几个文件选定的模型不同，都会被拒绝。[](source:waiting-checked)

凭据存储说不清提供商的令牌在不在时，使用这个令牌的已启用客户端照样等待，和缺少令牌时一样。[](source:token-unobserved)下一步是状态为不可用的客户端自己给出的修复办法，否则做一次 `local` 深度检查。[](source:token-unobserved-action)

## 每一级检查能证明多少？ {#p-ready}

AIGW 的输出回答三个问题：选中了什么，是否就绪，下一步做什么才安全。[](source:experience-questions)

@steps id=ready-steps
| step-status | aigw status | 报告每个客户端的模型，以及它的客户端文件是否就绪；不读取令牌，也不运行客户端。[](source:experience-readiness) |
| step-endpoint | aigw check --depth endpoint | 检查每个端点，只发一次不指定模型的请求。[](source:readme-check)[](source:readme-depths) |
| step-inference | aigw check | 默认深度：为每个受检查的客户端发一次有时限的推理请求，可能消耗提供商配额。[](source:readme-check)[](source:experience-readiness) |
| step-session | aigw check --depth client | 在每个已启用的客户端里真实运行一次会话，启动客户端时不带父级智能体会话的环境变量。[](source:readme-depths)[](source:check-parent-session)不指定客户端且全部通过时，写入已验证快照，`aigw config rollback` 优先恢复的就是它。[](source:verify-snapshot)[](source:rollback-snapshot)在 `client` 深度检查 Codex 时，不启动 Codex 的记忆任务；这项任务会向受检查模型以外的另一个模型发请求。[](source:check-codex-memory) |

| 深度或状态 | 含义                                                                                                                                                                                                          |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `local`    | 配置、客户端文件和运行环境都通过检查，令牌也已存入，不发请求。已存入但为空的令牌按缺少令牌处理。[](source:token-empty)另一个程序存入的钥匙串条目会被报告出来，不算作已存入的令牌。[](source:keychain-foreign) |
| `endpoint` | 提供商应答了一次带认证、不指定模型的请求。                                                                                                                                                                    |
| `model`    | 所选模型应答了一次有时限的推理请求。这是默认深度。                                                                                                                                                            |
| `client`   | 一次真实的客户端会话顺利完成。                                                                                                                                                                                |
| 已配置     | 本地前提条件满足，不论检查在此之外证明了多少。                                                                                                                                                                |
| 已推迟     | 凭据或客户端文件是有意推迟的。                                                                                                                                                                                |
| 降级       | 客户端仍算已配置，但有可恢复的问题。                                                                                                                                                                          |
| 无效       | 配置或自有状态不能安全使用。                                                                                                                                                                                  |
| 不可用     | 缺少一项必需的外部能力。                                                                                                                                                                                      |

检查到哪一级，都会先跑完它之前的每一级。[](source:check-depths) 设置、同步、检视和验证，都用这些状态报告；证明了多少，看的是检查深度，而不是状态。[](source:readiness)

Codex 或 Claude Code 自己报出警告或错误时，`aigw check <client> --depth client` 会说明该怎么办。它会指出客户端称为已弃用的配置键，例如 `[features].multi_agent`，给出的修复办法就是删掉这个键。[](source:check-client-report)

对其他报告，加上 `--verbose` 后，AIGW 的输出之后会附上客户端自己的输出，最多四行。这些行里没有提供商令牌，也没有已知形式的凭据。客户端自行认证或经外部凭据助手认证时，不显示这些行，修复办法是直接运行客户端本身。[](source:check-client-report)

AIGW 的脱敏涵盖从 `Authorization` 头到行尾这一段、cookie 头，以及 URL 里的用户名，带不带密码都一样。它还涵盖名为 `key`、`sig` 或 `signature` 的查询参数，以及 `sk-` 之后至少还有 20 个字符的裸密钥。[](source:redaction-forms)

`aigw check` 的 JSON 文档 `schema_version` 为 6。第 6 版去掉了各客户端的认证方式，客户端一律使用提供商令牌。[](source:check-schema-version)第 4 版新增了 `clients[].failure.client_report`：会话失败时客户端自己的输出，只在加 `--verbose` 时出现。这类失败的下一步是 `next_detail` 里的一段文字，没有 `next_action`。[](source:check-schema)

## 提供商的模型会经历哪些状态？ {#p-catalog}

提供商清单是观测结果，不是配置。`aigw model search` 读取这些清单；模型出现在清单里，既不证明能推理，也不证明具备任何能力。[](source:catalog-states)

@diagram lifecycle id=catalog-life source=catalog.lifecycle.json

@steps id=catalog-steps
| step-available | 可添加 | 提供商列出了这个模型，但还没有添加。[](source:catalog-states) | catalog-life | cat-available |
| step-added | 已添加 | 模型在配置里，提供商也列出了它。`aigw use` 会添加清单里列出的模型；加上 `--unlisted`，也能添加未列出的模型。[](source:catalog-states)[](source:readme-use) | catalog-life | cat-added |
| step-missing | 缺失 | 模型在配置里，但提供商已不再列出它。AIGW 报告它需要重新鉴定，但绝不会自行重命名、弃用或移除它。[](source:catalog-states)[](source:catalog-qualify) | catalog-life | cat-missing |
| step-deprecated | 已弃用 | 团队文件把模型标为弃用。已有的选择照旧保留，但不再推荐这个模型。[](source:catalog-states) | catalog-life | cat-deprecated |

鉴定是另一项证据：对指定能力，要有明确的协议证据和真实客户端证据。Chat Completions 成功，并不能让 Responses 通过鉴定。等到没有客户端选用某个模型，才能用 `aigw model remove` 移除它。[](source:catalog-qualify)

## 哪些部分让各客户端保持一致？ {#p-parts}

`aigw setup`、`use`、`sync`、`config rollback` 和 `self uninstall`，都走同一条同步路径到达客户端。

@diagram architecture id=parts-map source=parts.architecture.json

@steps id=parts-steps
| step-synchronization | 同步 | 规划每个客户端文件的写入，提交配置，再写入客户端文件，整个过程是一次事务。[](source:preflight)[](source:commit-order) | parts-map | parts-sync |
| step-store | 配置存储 | 管理 `aigw.toml`、它的锁、备份和已验证快照，并保留自己写入的确切文件，供带防护的回滚使用。[](source:store-owner)[](source:store-commit)`aigw config export` 导出团队文件时，宽度超过 100 列的数组每行只写一个元素。[](source:team-export-arrays) | parts-map | parts-store |
| step-seam | 适配器接口 | 所有客户端共用一份契约：发现、收敛、规划、应用、检视、验证和撤回。[](source:seam) | parts-map | parts-seam |
| step-codex | Codex | `~/.codex/config.toml` 中归 AIGW 管的一块，以及模型清单。在模型清单里，AIGW 为模型添加的别名显示模型的 `label`，但不带提供商。[](source:model-name)[](source:codex-alias-name)[](source:codex-alias)清单里已有条目显示同一名称时，名称后面再用括号附上模型 ID。[](source:codex-alias)清单里代表所选模型的那一条，不论是模型本身还是别名，都写入它声明的上下文窗口。[](source:codex-alias) | parts-map | parts-codex |
| step-claude-code | Claude Code | `~/.claude/settings.json`：端点、模型偏好、凭据助手和 `modelOverrides`。`modelOverrides` 把每个 Anthropic 模型 ID 映射到所选提供商提供它时用的 ID。[](source:claude-overrides)从 0.6.1 升级后首次运行 `aigw setup` 时，即使你改过或删掉了 0.6.1 写入的 `model`，它也接受这份设置。只要提供商和端点没有变，你的选择就会保留。[](source:setup-model-kept) | parts-map | parts-claude-code |
| step-claude-desktop | Claude Desktop | 单独的第三方推理配置库。其中的模型条目用 `behavesAs` 指明，提供商自己的 ID 对应哪个 Anthropic 模型。[](source:desktop-behaves) | parts-map | parts-claude-desktop |
| step-hermes | Hermes | Hermes 的提供商清单（每个模型带上它声明的上下文窗口）、协议和模型。[](source:client-files-concept)AIGW 通过 `go.yaml.in/yaml/v4` 读写 Hermes 的配置。[](source:hermes-yaml)[](source:hermes-encode)带行尾空格的文本仍写成字面块，折叠块标量的值保持不变。[](source:hermes-blocks)[](source:hermes-folded) | parts-map | parts-hermes |

## 为什么要用一次带防护的事务？ {#p-decision}

一次变更可能涉及多个客户端。DR-0006 权衡了写入它们的三种方式。[](source:decision)[](source:rejected)

| 方案             | 失败后留下什么                 | 决定             |
| ---------------- | ------------------------------ | ---------------- |
| 逐个尽力写入     | 客户端看到一部分新状态。       | 否决 {bad:否决}  |
| 无条件回滚       | 后来者写入的字节可能被覆盖。   | 否决 {bad:否决}  |
| 一次带防护的事务 | 只有自己的写入仍在时，才恢复。 | 采用 {good:采用} |

决策记录写明了一种需要重新审视的情形：所有客户端文件都改由同一个更强的原子存储承载，并提供同等保护。[](source:revisit)

## AIGW 管什么，又把什么留给别人？ {#p-owners}

四个问题里，AIGW 只回答一个，其余交给专门解决这些问题的产品。[](source:research-responsibilities)[](source:research-restraint)

| 职责       | 要回答的问题                       | 归属               |
| ---------- | ---------------------------------- | ------------------ |
| 配置控制   | 这个客户端应该用什么？             | AIGW {good:AIGW}   |
| 请求执行   | 请求如何到达兼容的服务？           | 客户端、网关和代理 |
| 会话连续性 | 进行中的任务，含义能否保持不变？   | 各客户端           |
| 组织访问   | 谁可以使用哪些资源，费用由谁承担？ | 共享网关           |

@facts
| Codex | 对话、JSONL、SQLite、模型元数据和 Desktop 图形界面状态[](source:owners) |
| Claude Code | 会话，以及与 AIGW 无关的设置[](source:readme-boundaries) |
| 兼容端点 | 运营归它们自己；AIGW 绝不安装、启动、停止或诊断它们[](source:readme-boundaries) |
| 新客户端 | 每个都需要单独的适配器准入；提供商支持某个协议，并不等于客户端获得准入[](source:adapter-admission) |

## AIGW 如何安装、更新和回滚？ {#p-release}

@facts
| 安装 | 已签名、经公证的 Homebrew cask，或便携归档包（macOS 只有 ARM64 版，Linux 有 AMD64 和 ARM64 版），由 `aigw self install` 安装。[](source:readme-install) |
| 更新 | 便携程序更新时，在计算哈希、解压或运行任何内容之前，先用 AIGW 内置的发布密钥验证 `checksums.txt.sig`。[](source:readme-update-trust) |
| 代码托管平台 | 更新读取 GitHub 上的发布版本；要有两个环境变量指明 GitLab，它才加入。一个发布版本绝不由两者拼合而成。[](source:readme-update-trust) |
| 回滚 | `aigw self rollback` 先把一份配置副本交给保留的前一版本；它读不了，就什么都不改变。0.7.0 之前的版本都读不了 `aigw.toml`；0.12.0 之前的版本只读第 8 版配置，要先恢复升到第 9 版之前备份的副本。[](source:readme-rollback)回滚不移动任何凭据：在 macOS 上，一个已签名的发布版本能读取另一个已签名版本存入的钥匙串条目。对用 Homebrew 安装的 AIGW，这条命令和其他程序命令一样被拒绝，较早的版本由 Homebrew 安装。[](source:rollback-credentials) |
| 卸载 | `aigw self uninstall` 从客户端文件中移除 AIGW 的设置；提供商、模型、客户端的模型选择、令牌，还有你自己那份客户端状态，都会保留。[](source:readme-uninstall) |

## AIGW 怎样走到今天？ {#p-history}

AIGW 于 2026 年 9 月 19 日发布 v0.1.0。本页所述的 v0.12.0，`CHANGELOG.md` 记的日期是 11 月 28 日。[](source:changelog-010)[](source:changelog-0120)下图选出二十三个版本，每个都改变了 AIGW 为用户做的事；仍待解决的事项列在本页最后。

@diagram timeline id=history source=history.timeline.json title="AIGW 怎样走到今天"

## 哪些已经交付，哪些仍待解决？ {#p-maturity}

发布版本只支持已取得完整原生证据的客户端。[](source:readme-adapters)

| 范围                         | 状态                              | 含义                                                                                                                        |
| ---------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Codex、Claude Code 和 Hermes | 已验收 {good:真实客户端}          | 发布流程以已发布的前一版本为基线，让每个真实客户端依次升级、回滚、再升级；缺少客户端即判失败。[](source:acceptance-journey) |
| Claude Desktop               | 单独鉴定 {good:自己的证据}        | Desktop 需要单独鉴定；CLI 证据不能替代它。[](source:acceptance-journey)                                                     |
| 文件防护                     | 尽力而为 {caution:是防护，不是锁} | 能保住检测到的较新写入，但不是跨进程的 compare-and-swap。[](source:transaction-boundary)                                    |
