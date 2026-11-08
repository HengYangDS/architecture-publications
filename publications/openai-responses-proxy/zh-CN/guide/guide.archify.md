# OpenAI Responses Proxy 如何让 Codex 流量可跨提供商移植，又如何让自己持续运行？ {#guide}

OpenAI Responses Proxy 是一个回环监听器，位于 Codex 等 Responses 客户端与第三方 Responses 提供商之间。[](source:readme-what) 它用一套封闭、可跨提供商移植的语法重建每个请求，从不编辑客户端的会话存储。[](source:readme-portable)[](source:dr2-decision) 它安装为不可变的一代，在看门狗之下运行；看门狗则由原生服务管理器保持存活。[](source:readme-generations)[](source:readme-macos)

- [它修改请求，从不修改会话](block:p-portable)：store=false，不带提供商绑定，工具调用与其输出保持配对。[](source:readme-compat)
- [提供商已完整收到的请求绝不再发](block:p-resend)；客户端收到 `502 upstream_outcome_unknown`，自行决定。[](source:dr6-resend)
- [升级期间照常准入轮次](block:p-handoff)：新进程继承监听套接字，旧进程完成它已接受的轮次。[](source:readme-handoff)
- [每个安装步骤都记入事务日志](block:p-install)，因此 `recover` 能完成或撤销中断的安装。[](source:arch-completion)

@answer scope="OpenAI Responses Proxy v5.1.9 · 提交 a5cfd8c · 其源代码与自有文档"
@meta locale=zh-CN style=editorial
@source readme-what title="代理是什么" path="README.md" lines=3:7
@source readme-portable title="不编辑会话存储" path="README.md" lines=12:13
@source readme-boundary title="产品边界" path="README.md" lines=25:37
@source readme-linux title="Linux 上的监管" path="README.md" lines=50:60
@source readme-macos title="macOS 上的看门狗" path="README.md" lines=62:70
@source readme-install title="安装已签名的资产" path="README.md" lines=84:87
@source readme-install-tx title="安装即事务" path="README.md" lines=99:107
@source readme-routes title="提供商路由" path="README.md" lines=120:130
@source readme-upstream title="一个显式指定的上游" path="README.md" lines=132:144
@source readme-status title="status 报告什么" path="README.md" lines=214:230
@source readme-purge title="清除确切的文件" path="README.md" lines=246:252
@source readme-generations title="各代与选择器" path="README.md" lines=254:261
@source readme-handoff title="保持准入开放的交接" path="README.md" lines=266:273
@source readme-compat title="兼容行为" path="README.md" lines=281:300
@source readme-deadline title="一个交互时限" path="README.md" lines=302:321
@source readme-ucloud title="UCloud 上的明文委派" path="README.md" lines=323:331
@source readme-request title="请求边界" path="README.md" lines=335:360
@source readme-body title="请求体准入" path="README.md" lines=362:369
@source readme-evidence title="运行时证据" path="README.md" lines=393:402
@source arch-authority title="谁掌管哪些状态" path="docs/architecture/authority-and-runtime-boundary.md" lines=40:50
@source arch-projection title="投影去除什么" path="docs/architecture/authority-and-runtime-boundary.md" lines=227:240
@source arch-agent title="加密的 Agent 消息" path="docs/architecture/authority-and-runtime-boundary.md" lines=249:258
@source arch-live title="实时响应的边界" path="docs/architecture/authority-and-runtime-boundary.md" lines=260:264
@source arch-recovery title="恢复的归属" path="docs/architecture/authority-and-runtime-boundary.md" lines=288:305
@source arch-commit title="提交、预热、交接、重新绑定" path="docs/architecture/authority-and-runtime-boundary.md" lines=329:343
@source arch-selector title="一个选择器" path="docs/architecture/authority-and-runtime-boundary.md" lines=345:358
@source arch-completion title="完成与恢复" path="docs/architecture/authority-and-runtime-boundary.md" lines=360:367
@source arch-deletion title="按确切文件删除" path="docs/architecture/authority-and-runtime-boundary.md" lines=369:379
@source threat-assets title="资产与客户端凭据" path="docs/architecture/threat-model.md" lines=18:30
@source threat-boundaries title="信任边界" path="docs/architecture/threat-model.md" lines=32:44
@source threat-residual title="残余风险" path="docs/architecture/threat-model.md" lines=72:85
@source dr1-decision title="DR-0001：两个产品，两个掌管方" path="docs/decisions/dr-0001-control-plane-data-plane-boundary.md" lines=23:29
@source dr2-decision title="DR-0002：无状态、可移植的重放" path="docs/decisions/dr-0002-provider-portable-stateless-replay.md" lines=23:57
@source dr2-consequence title="DR-0002：连续性来自重放的对话" path="docs/decisions/dr-0002-provider-portable-stateless-replay.md" lines=68:77
@source dr3-decision title="DR-0003：以提供商为界的恢复" path="docs/decisions/dr-0003-provider-scoped-recovery-and-backpressure.md" lines=22:35
@source dr6-resend title="DR-0006：已发出的请求不再发送" path="docs/decisions/dr-0006-semantic-fit-before-framework-adoption.md" lines=200:228
@source code-route title="路由分派" path="src/openai_responses_proxy/serving/server.py" lines=132:146
@source code-body title="读取一个定界的请求体" path="src/openai_responses_proxy/relay/responses.py" lines=144:162
@source code-project title="投影与委派" path="src/openai_responses_proxy/relay/responses.py" lines=257:296
@source code-gate title="先冷却，再准入" path="src/openai_responses_proxy/relay/responses.py" lines=321:338
@source code-cooldown title="提供商冷却" path="src/openai_responses_proxy/relay/responses.py" lines=56:104
@source code-deadline title="一次交互，一个时限" path="src/openai_responses_proxy/relay/exchange.py" lines=116:146
@source code-http-error title="已归类的上游错误" path="src/openai_responses_proxy/relay/exchange.py" lines=424:479
@source code-transport-error title="传输失败" path="src/openai_responses_proxy/relay/exchange.py" lines=482:523
@source code-outcome title="完整发出之后的失败" path="src/openai_responses_proxy/relay/upstream.py" lines=388:401
@source code-reused title="复用连接上的发送失败" path="src/openai_responses_proxy/relay/upstream.py" lines=341:366
@source code-reopen title="只重开内容之前的失败" path="src/openai_responses_proxy/relay/sse.py" lines=261:268
@source code-hold title="内容之前暂存的事件" path="src/openai_responses_proxy/relay/sse.py" lines=122:162
@source code-disposition title="哪些状态码会重试" path="src/openai_responses_proxy/protocol/recovery/execution.py" lines=50:77
@source code-compact title="不拆配对的压缩" path="src/openai_responses_proxy/protocol/recovery/execution.py" lines=90:141
@source code-input-variant title="input 变体的契约" path="src/openai_responses_proxy/protocol/recovery/input.py" lines=86:96
@source code-dmx title="DMXAPI empty_response" path="src/openai_responses_proxy/providers/policies/dmxapi.py" lines=15:33
@source code-manifest title="提供商清单" path="src/openai_responses_proxy/providers/manifest.toml" lines=1:12
@source code-plaintext title="选用明文委派" path="src/openai_responses_proxy/protocol/agent_delivery.py" lines=111:129
@source code-signature title="验证签名" path="src/openai_responses_proxy/lifecycle/artifact.py" lines=304:344
@source code-artifact title="准入归档包" path="src/openai_responses_proxy/lifecycle/artifact.py" lines=232:301
@source code-begin title="开始一个事务" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=377:454
@source code-downgrade title="拒绝降级与重放" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=400:405
@source code-materialize title="物化候选" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=133:199
@source code-activate title="激活候选" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=201:236
@source code-finalize title="完结安装" path="src/openai_responses_proxy/lifecycle/transaction/completion.py" lines=40:61
@source code-rollback title="回滚" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=255:271
@source code-recover title="依据事务日志恢复" path="src/openai_responses_proxy/lifecycle/transaction/recovery.py" lines=22:106
@source code-close title="关闭未写入的事务" path="src/openai_responses_proxy/lifecycle/transaction/recovery.py" lines=109:116
@source code-strategy title="交接或替换" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=122:128
@source code-lease title="旧监听器的租约" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=156:162
@source code-request title="请求交接" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=373:433
@source code-finalized title="证明后继进程已完结" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=505:518
@source code-disk-match title="只认选定的载荷" path="src/openai_responses_proxy/serving/control.py" lines=110:123
@source code-spawn title="传递套接字" path="src/openai_responses_proxy/serving/handoff/protocol.py" lines=245:300
@source code-prepare title="准备后继进程" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=249:303
@source code-commit title="越过 COMMIT" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=314:349
@source code-old-finishes title="旧监听器收尾" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=378:409
@source code-child title="后继进程一侧" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=433:502
@source code-local title="只接受本地控制者" path="src/openai_responses_proxy/relay/admission.py" lines=163:173
@source code-selector title="读取选择器" path="src/openai_responses_proxy/serving/identity.py" lines=105:128
@source code-journal-paths title="数据根目录旁的事务日志" path="src/openai_responses_proxy/lifecycle/records.py" lines=25:37
@source code-command-path title="命令路径" path="src/openai_responses_proxy/lifecycle/command.py" lines=34:48
@source code-plist title="launchd 代理" path="src/openai_responses_proxy/lifecycle/supervision/macos.py" lines=123:136
@source code-domains title="GUI 登录域或 Background 域" path="src/openai_responses_proxy/lifecycle/supervision/macos.py" lines=66:86
@source code-unit title="systemd 用户单元" path="src/openai_responses_proxy/lifecycle/supervision/linux.py" lines=16:30
@source code-task title="计划任务" path="src/openai_responses_proxy/lifecycle/supervision/windows.py" lines=41:81
@source code-roots title="数据根目录与状态根目录" path="src/openai_responses_proxy/runtime/config.py" lines=155:184
@source code-watchdog title="看门狗循环" path="src/openai_responses_proxy/lifecycle/supervision/watchdog.py" lines=102:137
@source code-activate-carrier title="每个角色加载自己的配置载体" path="src/openai_responses_proxy/lifecycle/runtime_spec.py" lines=152:159
@source code-status-next title="每种状态一条下一步命令" path="src/openai_responses_proxy/cli/outcome.py" lines=37:43
@source code-lock title="唯一的生命周期写入者" path="src/openai_responses_proxy/cli/application.py" lines=96:115

## 谁经由代理发送流量，代理又把哪些事留给他方？ {#p-context}

代理掌管 Responses 规范化、重放可移植性、有界恢复和自身的服务生命周期。它不配置任何客户端，也不读取客户端配置。[](source:readme-boundary)[](source:dr1-decision)

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-client | Responses 客户端 | Codex、Hermes 或某个 Responses SDK；只有其请求、重放、流式传输、错误和已安装客户端这几类旅程都通过，才获准入。[](source:readme-boundary) | context-map | ctx-client |
| step-ctx-control | 客户端控制面 | 掌管凭据、提供商选择和客户端配置。它把客户端指向回环 URL，每个提供商一个。[](source:readme-boundary)[](source:readme-routes) | context-map | ctx-control |
| step-ctx-proxy | OpenAI Responses Proxy | 只在 127.0.0.1 上监听，自身不持有任何凭据；客户端的 Authorization 请求头随单个请求发往上游。[](source:threat-boundaries)[](source:threat-assets) | context-map | ctx-proxy |
| step-ctx-providers | 提供商端点 | 清单列出 DMXAPI、UCloud 和 AIHubMix；安装时还可另加一个显式指定的上游。[](source:code-manifest)[](source:readme-upstream) | context-map | ctx-providers |
| step-ctx-operator | 运维者 | 安装已签名的发布资产，所用信任锚经另一条可信渠道提供。[](source:readme-install) | context-map | ctx-operator |
| step-ctx-service | 原生服务管理器 | 让看门狗保持运行：macOS 上是 launchd，Linux 上是 systemd 用户管理器，Windows 上是任务计划程序。[](source:readme-macos)[](source:readme-linux) | context-map | ctx-service |

| 掌管方       | 权威状态                                              |
| ------------ | ----------------------------------------------------- |
| 客户端       | 会话、工具状态、JSONL、SQLite、已存储条目、模型元数据 |
| 客户端控制面 | 凭据、提供商选择、客户端端点配置                      |
| 已安装的代理 | 清单掌管的载荷和原生服务投影                          |
| 提供商       | 模型执行、配额和上游可用性                            |

每类状态只有一个掌管方，代理只写入自己掌管的状态。[](source:arch-authority)

## 一个轮次会经历什么？ {#p-turn}

只准入 `POST /<provider>/v1/responses` 和 `GET /<provider>/v1/models`。请求头、请求体和查询参数都不能选择别的主机。[](source:readme-request)

@sequence id=turn-flow title="经过代理的一个 Responses 轮次"
| actor turn-client | Responses 客户端 | frontend |
| actor turn-listener | 回环监听器 | backend | source:code-route |
| actor turn-relay | Responses 转发 | backend | source:code-gate |
| actor turn-projection | 重放投影 | security | source:code-project |
| actor turn-exchange | 上游交互 | backend | source:code-deadline |
| actor turn-delivery | 响应投递 | backend | source:code-hold |
| actor turn-provider | 提供商端点 | external |
| phase | 准入 |
| turn-client | turn-listener | POST /dmxapi/v1/responses |
| turn-listener | turn-relay | 路由和请求体 |
| turn-relay | turn-projection | 投影请求体 |
| turn-projection | turn-relay | 可移植的字节 | return |
| phase | 发送 |
| turn-relay | turn-exchange | 在时限内发起交互 |
| turn-exchange | turn-provider | store=false 请求 | emphasis |
| turn-provider | turn-exchange | 事件流 | return |
| turn-exchange | turn-relay | 已接受的响应 | return |
| phase | 投递 |
| turn-relay | turn-delivery | 转发事件流 |
| turn-delivery | turn-client | 已校验的事件 | return |

@steps id=turn-steps
| step-turn-route | 回环监听器 | 从路径解析出提供商；在任何上游 I/O 之前，拒绝经过编码、含点段或无关的路径。[](source:readme-request)[](source:code-route) | turn-flow | turn-listener | | turn-client-to-turn-listener-1,turn-listener-to-turn-relay-1 |
| step-turn-body | Responses 转发 | 读取一个 ASCII Content-Length 请求体，用时不超过 30 秒、大小不超过 64 MiB；更慢或更大的请求体得到 408 或 413。[](source:readme-body)[](source:code-body) | turn-flow | turn-relay | | turn-listener-to-turn-relay-1 |
| step-turn-project | 重放投影 | 先按可移植语法重建请求体；路由要求时，再选用明文委派。[](source:code-project) | turn-flow | turn-projection | | turn-relay-to-turn-projection-1,turn-projection-to-turn-relay-1 |
| step-turn-gate | Responses 转发 | 冷却中的提供商以 429 或 503 加 Retry-After 应答；正在排空的监听器应答 503。否则，该轮次占用一个准入名额。[](source:code-cooldown)[](source:code-gate) | turn-flow | turn-relay | | turn-relay-to-turn-exchange-1 |
| step-turn-send | 上游交互 | 一个时限（默认 900 秒）约束请求头、重试、读取，以及向客户端的每一次写入。[](source:readme-deadline)[](source:code-deadline) | turn-flow | turn-exchange | | turn-exchange-to-turn-provider-1,turn-provider-to-turn-exchange-1,turn-exchange-to-turn-relay-1 |
| step-turn-deliver | 响应投递 | 每个事件先校验再写出；出现在任何内容之前的事件则暂存。[](source:code-hold)[](source:arch-live) | turn-flow | turn-delivery | | turn-relay-to-turn-delivery-1,turn-delivery-to-turn-client-1 |

## 一个请求离开时保留什么？ {#p-portable}

连续性来自客户端重放的对话，而非提供商的存储。因此，可移植的会话无需服务端状态，就能在已准入的提供商之间迁移。[](source:dr2-consequence)

@diagram tree id=projection-tree source=projection.tree.json

@steps id=projection-steps
| step-pr-bindings | 提供商绑定 | response、conversation、缓存和已存储条目这几类绑定，在不同提供商之间没有共同含义，因此将其去除。[](source:arch-projection) | projection-tree | pr-bindings |
| step-pr-pairs | 工具调用及其输出 | 调用保留其标识，输出与调用保持配对。后到且带有自身标识的结果，就地改为注明归属的消息。[](source:arch-projection) | projection-tree | pr-pairs |
| step-pr-agent | 加密的 Agent 消息 | 原生控制数据保留其信封和密文；代理不解密，也不承诺其他提供商能够解密。[](source:arch-agent) | projection-tree | pr-agent |
| step-pr-controls | 本轮控制项 | 空的 additional_tools 列表保持为空，原生压缩期间也是如此。[](source:dr2-decision) | projection-tree | pr-controls |
| step-pr-refused | 在上游 I/O 之前拒绝 | 未知或未经证明的结构在本地以 400 失败，既不猜测，也不悄悄丢弃。[](source:dr2-decision)[](source:arch-projection) | projection-tree | pr-refused |

@callout level=note title="UCloud 上的可读委派"
| UCloud 路由在生成之前给 collaboration 命名空间设别名，可读参数到达后再还原。它绝不把密文改标为明文。[](source:readme-ucloud)[](source:code-plaintext) |

## 请求何时可以再发一次？ {#p-resend}

收到完整请求的提供商，可能已在处理它。再发一次，可能让提供商的工作和计费都重复一遍。[](source:dr6-resend)

@diagram lifecycle id=exchange-life source=exchange.lifecycle.json

@steps id=exchange-steps
| step-ex-sending | 发送中 | 请求发完之前出现的连接、DNS 和 TLS 失败会重试，带退避，至多尝试四次。在复用的空闲连接上发送失败时，改在新连接上重发一次。[](source:code-transport-error)[](source:code-reused) | exchange-life | ex-sending |
| step-ex-sent | 已完整发出 | 从这一刻起，连接中断或回复格式错误都意味着结果未知，因为提供商可能已接受该请求。[](source:code-outcome) | exchange-life | ex-sent |
| step-ex-held | 内容之前 | 只有内容之前的 response.failed 才会重开；只是结束的流则不会。[](source:code-reopen) | exchange-life | ex-held |
| step-ex-unknown | 结果未知 | 客户端收到一个 `502 upstream_outcome_unknown`，并自行决定是否重试该轮次。[](source:dr6-resend) | exchange-life | ex-unknown |
| step-ex-expired | 时限已到 | 提交之前，客户端得到 `504 upstream_deadline_exceeded`；提交之后，流直接关闭，不带终止符。[](source:readme-deadline) | exchange-life | ex-expired |

每种上游错误都有一个有界的应对；冷却只限制引起错误的那个提供商。[](source:dr3-decision)[](source:arch-recovery)

| 上游应答                    | 代理的做法                                                                              |
| --------------------------- | --------------------------------------------------------------------------------------- |
| `429`                       | 转发一次，然后按其 Retry-After 冷却该提供商，至多 300 秒[](source:code-http-error)      |
| 有界重试后的 `503`          | 转发原始错误，然后短暂冷却该提供商[](source:code-disposition)[](source:code-http-error) |
| DMXAPI `477 empty_response` | 把同样的已投影字节再发一次[](source:code-dmx)                                           |
| `response_failed`           | 严格缩小、不拆配对的重试，之后至多一次仅含对话的尝试[](source:code-compact)             |
| 无效的 `input` 联合类型     | 改用更小的当前对话尝试一次，然后停止[](source:code-input-variant)                       |
| `invalid_encrypted_content` | 转发该拒绝，不替换任务[](source:arch-agent)                                             |

## 已签名的发布版本如何成为正在服务的一代？ {#p-install}

安装从不下载依赖，也不读取提供商凭据。[](source:readme-install-tx) 首先，ssh-keygen 必须为 SHA256SUMS.sig 恰好找到一个主体，归档包及其平台清单也必须与已签名的校验和相符。[](source:code-signature)[](source:code-artifact) 此后事务才提交这个包，并在完成之前证明监听器。[](source:arch-commit)

@diagram lifecycle id=tx-life source=transaction.lifecycle.json

@steps id=tx-steps
| step-tx-prepared | 已准备 | 写入之前，事务日志记下每个候选文件及其摘要。拒绝降级，也拒绝重放已安装的发布版本。[](source:code-begin)[](source:code-downgrade) | tx-life | tx-prepared |
| step-tx-materialized | 已物化 | 候选成为新的不可变代，按其清单验证，并预热其确切的可执行文件。[](source:code-materialize) | tx-life | tx-materialized |
| step-tx-activated | 已激活 | 一个原子选择器把候选定为活动代，把原来的一代定为其前代；命令链接随之移动。[](source:code-activate)[](source:readme-generations) | tx-life | tx-activated |
| step-tx-finalized | 已完结 | 只有监听器报告候选的身份，事务才完结。更早的各代随后按其已记录的字节移除。[](source:code-finalize)[](source:arch-selector) | tx-life | tx-finalized |
| step-tx-recovery | 需要恢复 | 事务日志保留；`recover` 读取运行中监听器的身份，据此完成或还原。[](source:code-recover)[](source:arch-completion) | tx-life | tx-recovery |
| step-tx-rolled-back | 已回滚 | 先前的选择和命令链接回到原处，只删除候选已记录的文件。[](source:code-rollback)[](source:arch-deletion) | tx-life | tx-rolled-back |
| step-tx-closed | 已关闭 | 未写入任何内容的事务直接关闭，不产生其他影响。[](source:code-close) | tx-life | tx-closed |

## 升级如何替换监听器，而不丢一个轮次？ {#p-handoff}

升级和重载走同一套交接。运行中的监听器把监听套接字交给后继进程，因此新轮次始终得到准入。[](source:readme-handoff)

@sequence id=handoff-flow title="把套接字交给后继进程"
| actor ho-deploy | 部署 | backend | source:code-request |
| actor ho-old | 运行中的监听器 | backend | source:code-commit |
| actor ho-new | 后继进程 | backend | source:code-child |
| actor ho-client | Responses 客户端 | frontend |
| phase | 准备 |
| ho-deploy | ho-old | POST /control/handoff |
| ho-old | ho-new | 启动并传递套接字 |
| ho-new | ho-old | READY，回显身份 | return |
| ho-old | ho-deploy | 202 ready | return |
| phase | 提交 |
| ho-old | ho-new | COMMIT | emphasis |
| ho-new | ho-old | SERVING，健康已证明 | return |
| ho-old | ho-new | FINALIZE |
| ho-new | ho-old | FINALIZED | return |
| phase | 服务 |
| ho-client | ho-new | 新轮次 | emphasis |
| ho-old | ho-client | 已接受的轮次完成 | return |
| phase | 证明 |
| ho-deploy | ho-new | 读取 /healthz |
| ho-new | ho-deploy | 已完结的身份 | return |

@steps id=handoff-steps
| step-ho-request | 部署 | 以 POST 发送确切的发布版本和各项摘要。请求若与磁盘上选定的载荷不符，监听器即拒绝。[](source:code-disk-match)[](source:code-local) | handoff-flow | ho-deploy | | ho-deploy-to-ho-old-1,ho-old-to-ho-deploy-1 |
| step-ho-prepare | 后继进程 | 从选定的一代启动，继承套接字，并在服务之前回显身份。[](source:code-spawn)[](source:code-prepare) | handoff-flow | ho-new | | ho-old-to-ho-new-1,ho-new-to-ho-old-1 |
| step-ho-commit | 运行中的监听器 | 到 COMMIT 时，它停止接受连接；后继进程开始服务，并在 FINALIZE 之前用 /healthz 证明其身份。[](source:code-commit)[](source:code-child) | handoff-flow | ho-old | | ho-old-to-ho-new-2,ho-new-to-ho-old-2,ho-old-to-ho-new-3,ho-new-to-ho-old-3 |
| step-ho-finish | 运行中的监听器 | 已接受的轮次留在旧进程上完成，直到结束或达到上游超时，至多 900 秒。[](source:code-old-finishes)[](source:code-lease) | handoff-flow | ho-old | | ho-client-to-ho-new-1,ho-old-to-ho-client-1 |
| step-ho-prove | 部署 | 只有旧进程已退出，且后继进程报告已完结的身份，部署才完结。[](source:code-finalized)[](source:code-request) | handoff-flow | ho-deploy | | ho-deploy-to-ho-new-1,ho-new-to-ho-deploy-1 |

@callout level=warning title="较旧的运行时改为排空"
| 不具备“保持准入开放”能力的运行时，先排空再替换。后继进程开始服务之前，新轮次会得到可重试的 503。[](source:code-strategy)[](source:readme-handoff) |

## 一次安装写入什么，写在哪里？ {#p-disk}

以下是 macOS 的默认位置；Linux 遵循 XDG 目录，Windows 使用 LOCALAPPDATA。[](source:code-roots)

@diagram tree id=disk-tree source=disk.tree.json

@steps id=disk-steps
| step-dk-selector | payload-selection.json | 活动代及其唯一前代只以它为准；监听器和生命周期命令都读取它。[](source:code-selector) | disk-tree | dk-selector |
| step-dk-generations | generations/ | 每次安装写入一个新目录；升级成功后，恰好保留一个前代。[](source:readme-generations) | disk-tree | dk-generations |
| step-dk-transaction | 事务日志 | 只在事务未结时存在，位于数据根目录旁，处在它可能删除的文件之外。[](source:code-journal-paths) | disk-tree | dk-transaction |
| step-dk-command | 命令链接 | 指向选中的最新发布版本的符号链接（Windows 上为启动器），因此服务回滚不会让命令降级。[](source:code-command-path)[](source:readme-generations) | disk-tree | dk-command |
| step-dk-agent | launchd 代理 | 以看门狗角色运行可执行文件，并设置 RunAtLoad 和 KeepAlive。[](source:code-plist) | disk-tree | dk-agent |

`uninstall --purge` 先记下每个载荷文件的路径和摘要，再只删除这些确切的文件。未知内容保留，并会报告。[](source:readme-purge)

## 谁让监听器持续运行，status 又报告什么？ {#p-running}

端口关闭时，看门狗启动监听器；有事务未结且尚未激活时，它就等待。[](source:code-watchdog)

@diagram architecture id=running-map source=running.architecture.json

@steps id=running-steps
| step-run-manager | 原生服务管理器 | 加载时启动看门狗，并让它保持存活。[](source:code-plist)[](source:code-unit)[](source:code-task) | running-map | run-manager |
| step-run-watchdog | 看门狗 | 每 15 秒检查一次监听端口；启动接连失败时退避，最长 120 秒。[](source:code-watchdog) | running-map | run-watchdog |
| step-run-carrier | runtime-config.json | 监听器、看门狗和交接子进程各自加载自身可执行文件旁的配置载体，而非 shell 的环境。[](source:code-activate-carrier) | running-map | run-carrier |
| step-run-cli | 命令行 | 同一时刻只有一个生命周期写入者；`status` 读取 /healthz 和载荷，不改动任何东西。[](source:code-lock)[](source:readme-evidence) | running-map | run-cli |

@facts
| macOS | 有 GUI 登录时，launchd 代理位于该登录的域中，重启后仍会回来；在 Background 域中则不会。[](source:readme-macos)[](source:code-domains) |
| Linux | 需要可达的 systemd 用户管理器；注销后是否继续运行，取决于主机管理员掌管的 lingering 策略。[](source:readme-linux) |
| Windows | 一个当前用户的计划任务，在登录时和每分钟触发；第二个实例会被忽略。[](source:code-task) |

| 状态                | 含义                                               | 下一步命令       |
| ------------------- | -------------------------------------------------- | ---------------- |
| `running`           | 载荷已验证，监管者已绑定，监听器以已安装的身份服务 | 无               |
| `stopped`           | 监管者已声明，但它和监听器都未运行                 | `reload`         |
| `degraded`          | 已安装，存在一个具名问题                           | `doctor`         |
| `recovery_required` | 有一个载荷事务未结                                 | `recover`        |
| `invalid`           | 已安装的证据无法验证                               | `status --json`  |
| `not_installed`     | 不存在自有的服务、监听器、命令、载荷或事务         | `install --help` |

每个结果至多给出一条下一步命令。[](source:code-status-next)[](source:readme-status)

@callout level=note title="已接受的本地风险"
| 威胁模型保留的每项残余风险，都需要同一用户的另一个进程。例如，`recover` 读取 /healthz 时，不做 `status` 所做的进程检查。[](source:threat-residual) |
