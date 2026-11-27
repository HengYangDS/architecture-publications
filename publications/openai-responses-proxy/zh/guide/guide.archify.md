# OpenAI Responses Proxy 怎样让 Codex 流量可在提供商之间移植，又怎样让自己持续运行？ {#guide}

OpenAI Responses Proxy 是一个回环监听器，架在 Codex 这类 Responses 客户端和第三方 Responses 提供商之间。[](source:readme-what) 每个请求都按同一套封闭语法重建，可在提供商之间移植；客户端的会话存储，它绝不改动。[](source:readme-portable)[](source:dr2-decision) 代理每次安装都成为不可变的一代，由看门狗监管，看门狗则由系统服务管理器保活。[](source:readme-generations)[](source:readme-macos)

- [只改请求，绝不改会话](block:p-portable)：store=false，不带提供商绑定，工具调用和输出不拆开。[](source:readme-compat)
- [提供商已完整收到的请求绝不重发](block:p-resend)；客户端收到 `502 upstream_outcome_unknown`，由它决定怎么办。[](source:dr6-resend)
- [升级期间继续放行每轮请求](block:p-handoff)：后继进程继承监听套接字，旧进程做完已接受的请求。[](source:readme-handoff)
- [每个安装步骤都记入事务日志](block:p-install)，因此 `recover` 能完成或撤销中断的安装。[](source:arch-completion)

@answer scope="OpenAI Responses Proxy v7.0.0 · 提交 b0d8505 · 源代码与项目自有文档"
@meta locale=zh-CN style=editorial
@source readme-what title="代理是什么" path="README.md" lines=3:7
@source readme-portable title="不改动会话存储" path="README.md" lines=12:13
@source readme-boundary title="产品边界" path="README.md" lines=26:38
@source readme-linux title="Linux 上的监管" path="README.md" lines=52:62
@source readme-macos title="macOS 上的看门狗" path="README.md" lines=64:72
@source readme-install title="安装已签名的资产" path="README.md" lines=86:89
@source readme-install-tx title="安装即事务" path="README.md" lines=101:109
@source readme-routes title="提供商路由" path="README.md" lines=122:133
@source readme-upstream title="一个显式指定的上游" path="README.md" lines=135:147
@source readme-status title="status 报告什么" path="README.md" lines=188:202
@source readme-purge title="只清除记下的文件" path="README.md" lines=218:224
@source readme-generations title="各代与选择器" path="README.md" lines=226:233
@source readme-handoff title="保持准入开放的交接" path="README.md" lines=238:245
@source readme-compat title="兼容行为" path="README.md" lines=253:272
@source readme-deadline title="同一个交互时限" path="README.md" lines=274:293
@source readme-ucloud title="UCloud 上的明文委派" path="README.md" lines=295:303
@source readme-request title="请求边界" path="README.md" lines=307:332
@source readme-body title="请求体准入" path="README.md" lines=334:341
@source readme-evidence title="运行时证据" path="README.md" lines=363:373
@source arch-authority title="哪些状态归谁" path="docs/architecture/authority-and-runtime-boundary.md" lines=40:50
@source arch-projection title="投影去除什么" path="docs/architecture/authority-and-runtime-boundary.md" lines=226:239
@source arch-agent title="加密的 Agent 消息" path="docs/architecture/authority-and-runtime-boundary.md" lines=248:257
@source arch-live title="实时响应的边界" path="docs/architecture/authority-and-runtime-boundary.md" lines=259:263
@source arch-recovery title="恢复的归属" path="docs/architecture/authority-and-runtime-boundary.md" lines=287:304
@source arch-commit title="提交、预热、交接、重新绑定" path="docs/architecture/authority-and-runtime-boundary.md" lines=328:342
@source arch-selector title="唯一的选择器" path="docs/architecture/authority-and-runtime-boundary.md" lines=344:357
@source arch-completion title="完成与恢复" path="docs/architecture/authority-and-runtime-boundary.md" lines=359:366
@source arch-deletion title="只删除记下的文件" path="docs/architecture/authority-and-runtime-boundary.md" lines=368:378
@source threat-assets title="资产与客户端凭据" path="docs/architecture/threat-model.md" lines=18:30
@source threat-boundaries title="信任边界" path="docs/architecture/threat-model.md" lines=32:44
@source threat-residual title="残余风险" path="docs/architecture/threat-model.md" lines=72:85
@source dr1-decision title="DR-0001：两个产品，两个责任方" path="docs/decisions/dr-0001-control-plane-data-plane-boundary.md" lines=23:29
@source dr2-decision title="DR-0002：无状态、可移植的重放" path="docs/decisions/dr-0002-provider-portable-stateless-replay.md" lines=23:57
@source dr2-consequence title="DR-0002：连续性来自重放的对话" path="docs/decisions/dr-0002-provider-portable-stateless-replay.md" lines=68:77
@source dr3-decision title="DR-0003：以提供商为界的恢复" path="docs/decisions/dr-0003-provider-scoped-recovery-and-backpressure.md" lines=22:35
@source dr6-resend title="DR-0006：已发出的请求不再发送" path="docs/decisions/dr-0006-semantic-fit-before-framework-adoption.md" lines=200:228
@source code-route title="路由分派" path="src/openai_responses_proxy/serving/server.py" lines=176:193
@source code-body title="按长度读取单个请求体" path="src/openai_responses_proxy/relay/responses.py" lines=126:144
@source code-project title="投影与委派" path="src/openai_responses_proxy/relay/responses.py" lines=250:289
@source code-gate title="先冷却，再准入" path="src/openai_responses_proxy/relay/responses.py" lines=314:340
@source code-cooldown title="提供商冷却" path="src/openai_responses_proxy/relay/responses.py" lines=40:86
@source code-deadline title="一次交互，一个时限" path="src/openai_responses_proxy/relay/exchange.py" lines=122:152
@source code-http-error title="已归类的上游错误" path="src/openai_responses_proxy/relay/exchange.py" lines=369:438
@source code-transport-error title="传输失败" path="src/openai_responses_proxy/relay/exchange.py" lines=441:478
@source code-outcome title="完整发出之后的失败" path="src/openai_responses_proxy/relay/upstream.py" lines=409:422
@source code-reused title="复用连接上的发送失败" path="src/openai_responses_proxy/relay/upstream.py" lines=346:387
@source code-reopen title="只有内容之前的失败才重新发起" path="src/openai_responses_proxy/relay/sse.py" lines=287:294
@source code-hold title="内容之前暂存的事件" path="src/openai_responses_proxy/relay/sse.py" lines=131:174
@source code-stream-terminals title="结束一条流的事件" path="src/openai_responses_proxy/relay/sse.py" lines=35:36
@source code-stream-end title="响应已提交的流怎样结束" path="src/openai_responses_proxy/relay/sse.py" lines=335:339
@source code-stream-class title="失败的流归入的失败类别" path="src/openai_responses_proxy/relay/sse.py" lines=346:360
@source code-stream-log title="记录流怎样结束的日志行" path="src/openai_responses_proxy/relay/sse.py" lines=364:384
@source code-json-terminal title="JSON 响应投递后的日志行" path="src/openai_responses_proxy/relay/downstream.py" lines=466:469
@source code-diagnostic title="诊断信息里的错误码与事件类型" path="src/openai_responses_proxy/protocol/response.py" lines=93:113
@source code-disposition title="哪些状态码会重试" path="src/openai_responses_proxy/protocol/recovery/execution.py" lines=56:92
@source code-compact title="不拆配对的压缩" path="src/openai_responses_proxy/protocol/recovery/execution.py" lines=105:156
@source code-input-variant title="input 变体的契约" path="src/openai_responses_proxy/protocol/recovery/input.py" lines=90:100
@source code-capacity title="输入超长或媒体超预算的拒绝" path="src/openai_responses_proxy/relay/exchange.py" lines=390:401
@source code-dmx title="DMXAPI empty_response" path="src/openai_responses_proxy/providers/policies/dmxapi.py" lines=16:34
@source code-manifest title="提供商清单" path="src/openai_responses_proxy/providers/manifest.toml" lines=1:15
@source code-plaintext title="选用明文委派" path="src/openai_responses_proxy/protocol/agent_delivery.py" lines=111:129
@source code-signature title="验证签名" path="src/openai_responses_proxy/lifecycle/artifact.py" lines=295:333
@source code-artifact title="归档包的准入" path="src/openai_responses_proxy/lifecycle/artifact.py" lines=223:292
@source code-begin title="开始事务" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=393:470
@source code-downgrade title="拒绝降级与重装" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=416:421
@source code-materialize title="候选落盘" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=140:201
@source code-activate title="激活候选" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=203:238
@source code-finalize title="完结安装" path="src/openai_responses_proxy/lifecycle/transaction/completion.py" lines=44:65
@source code-rollback title="回滚" path="src/openai_responses_proxy/lifecycle/transaction/execution.py" lines=257:273
@source code-recover title="依据事务日志恢复" path="src/openai_responses_proxy/lifecycle/transaction/recovery.py" lines=25:157
@source code-close title="关闭未写入的事务" path="src/openai_responses_proxy/lifecycle/transaction/recovery.py" lines=160:167
@source code-recover-wait title="还原之前的等待" path="src/openai_responses_proxy/lifecycle/control.py" lines=442:488
@source code-strategy title="两项交接能力" path="src/openai_responses_proxy/lifecycle/deployment/strategy.py" lines=49:59
@source code-incompatible title="拒绝不兼容的运行时" path="src/openai_responses_proxy/lifecycle/deployment/apply.py" lines=117:120
@source code-lease title="旧监听器的租约" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=125:133
@source code-request title="请求交接" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=395:490
@source code-finalized title="证明后继进程已完结" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=561:574
@source code-failed-handoff title="交接失败后回滚" path="src/openai_responses_proxy/lifecycle/deployment/apply.py" lines=278:296
@source code-predecessor title="证明旧监听器仍在服务" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=375:392
@source code-wait-at-rest title="请求没有应答时的等待" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=250:277
@source code-resolve title="为失败的请求判定结果" path="src/openai_responses_proxy/lifecycle/deployment/handoff.py" lines=493:558
@source code-disk-match title="只认选定的载荷" path="src/openai_responses_proxy/serving/control.py" lines=137:150
@source code-expired title="拒绝过期的交接请求" path="src/openai_responses_proxy/serving/control.py" lines=76:82
@source code-spawn title="传递套接字" path="src/openai_responses_proxy/serving/handoff/protocol.py" lines=198:244
@source code-prepare title="准备后继进程" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=256:324
@source code-commit title="越过 COMMIT" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=335:371
@source code-old-finishes title="旧监听器收尾" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=398:429
@source code-child title="后继进程一侧" path="src/openai_responses_proxy/serving/handoff/transaction.py" lines=480:538
@source code-local title="只接受本地发来的控制请求" path="src/openai_responses_proxy/relay/admission.py" lines=96:106
@source code-selector title="读取选择器" path="src/openai_responses_proxy/serving/identity.py" lines=110:133
@source code-selected title="选定的一代" path="src/openai_responses_proxy/lifecycle/generation.py" lines=73:78
@source code-no-selection title="未选定任何一代时的 status" path="src/openai_responses_proxy/lifecycle/control.py" lines=240:247
@source code-journal-paths title="数据根目录旁的事务日志" path="src/openai_responses_proxy/lifecycle/records.py" lines=26:38
@source code-command-path title="命令路径" path="src/openai_responses_proxy/lifecycle/command.py" lines=36:45
@source code-uninstall title="卸载的先后顺序" path="src/openai_responses_proxy/lifecycle/uninstall.py" lines=129:139
@source code-purge title="清除以自有的代为前提" path="src/openai_responses_proxy/lifecycle/transaction/completion.py" lines=228:241
@source code-watchdogs-linux title="Linux 上结束每一代的看门狗" path="src/openai_responses_proxy/lifecycle/supervision/linux.py" lines=197:207
@source code-plist title="launchd Agent" path="src/openai_responses_proxy/lifecycle/supervision/macos.py" lines=125:138
@source code-domains title="GUI 登录域或 Background 域" path="src/openai_responses_proxy/lifecycle/supervision/macos.py" lines=66:87
@source code-unit title="systemd 用户单元" path="src/openai_responses_proxy/lifecycle/supervision/linux.py" lines=21:35
@source code-roots title="数据根目录与状态根目录" path="src/openai_responses_proxy/runtime/config.py" lines=149:172
@source code-watchdog title="看门狗循环" path="src/openai_responses_proxy/lifecycle/supervision/watchdog.py" lines=91:129
@source code-activate-carrier title="每个角色加载自己的运行配置" path="src/openai_responses_proxy/lifecycle/runtime_spec.py" lines=153:160
@source code-carrier-schema title="运行配置必须字段齐全" path="src/openai_responses_proxy/lifecycle/runtime_spec.py" lines=163:174
@source code-status-next title="每种状态一条下一步命令" path="src/openai_responses_proxy/cli/outcome.py" lines=37:43
@source code-lock title="唯一的生命周期写入者" path="src/openai_responses_proxy/cli/application.py" lines=67:86
@source code-options title="端口与时限选项接受的取值" path="src/openai_responses_proxy/cli/options.py" lines=32:73
@source readme-port title="默认端口" path="README.md" lines=91:99
@source readme-budgets title="全新安装可另选的上限" path="README.md" lines=343:359
@source code-defaults title="运行时默认值" path="src/openai_responses_proxy/runtime/config.py" lines=68:84
@source code-platforms title="发布平台" path="src/openai_responses_proxy/product_identity.py" lines=13:20
@source changelog-100 title="1.0.0 版" path="CHANGELOG.md" lines=2185:2191
@source changelog-202 title="2.0.2 改名" path="CHANGELOG.md" lines=1580:1590
@source changelog-500 title="5.0.0 改名" path="CHANGELOG.md" lines=680:687
@source changelog-5111 title="5.1.11 版" path="CHANGELOG.md" lines=251:264
@source changelog-5112 title="5.1.12 版" path="CHANGELOG.md" lines=229:249
@source changelog-600 title="6.0.0 版" path="CHANGELOG.md" lines=173:227
@source changelog-601 title="6.0.1 版" path="CHANGELOG.md" lines=133:171
@source changelog-602 title="6.0.2 版" path="CHANGELOG.md" lines=80:131
@source changelog-603 title="6.0.3 版" path="CHANGELOG.md" lines=50:78
@source changelog-700 title="7.0.0 版" path="CHANGELOG.md" lines=11:48

## 谁通过代理发送流量，代理又把哪些事留给别人？ {#p-context}

代理负责 Responses 规范化、重放的可移植性、限次恢复和自身的服务生命周期。它不配置任何客户端，也不读取客户端配置。[](source:readme-boundary)[](source:dr1-decision)

@facts
| 监听器 | 127.0.0.1，端口 8792 |
| 请求体 | 一个 Content-Length，至多 64 MiB，30 秒内收完 |
| 交互时限 | 900 秒，覆盖整个交互，包括对客户端的每一次写入 |
| SSE 事件 | 每个至多 64 MiB，内容之前暂存的事件也一样 |
| 模型目录 | 每个请求 30 秒，至多 8 MiB |
| 发布平台 | macOS arm64、Linux x86_64 |

监听器只绑定 127.0.0.1，不对请求做身份验证。[](source:threat-boundaries)只有 8792 与本机其他服务冲突时，才用 `--port` 另选端口。[](source:readme-port)其余数值都是运行时默认值，每个平台各有自己的原生发布资产。[](source:code-defaults)[](source:readme-deadline)[](source:code-platforms)全新安装可以另选请求体、事件和模型目录的上限，升级则沿用已持久保存的值。[](source:readme-budgets)

`--port` 只接受 1 到 65535 之间、用十进制数字写成的整数。带小数、进制前缀或加号，都算用法错误。[](source:code-options)[](source:changelog-5111)

@diagram architecture id=context-map source=context.architecture.json

@steps id=context-steps
| step-ctx-client | Responses 客户端 | Codex、Hermes 或某个 Responses SDK。它的请求、重放、流式传输、错误和已安装客户端这几类场景全部通过后，才算准入。[](source:readme-boundary) | context-map | ctx-client |
| step-ctx-control | 客户端控制面 | 负责凭据、提供商选择和客户端配置，并把客户端指向回环 URL，每个提供商一个。[](source:readme-boundary)[](source:readme-routes) | context-map | ctx-control |
| step-ctx-proxy | OpenAI Responses Proxy | 只在 127.0.0.1 上监听，自身不持有任何凭据；客户端的 Authorization 请求头随单个请求发往上游。[](source:threat-boundaries)[](source:threat-assets) | context-map | ctx-proxy |
| step-ctx-providers | 提供商端点 | 清单列出 DMXAPI、UCloud、AIHubMix 和 Suhe.AI；安装时还可另加一个显式指定的上游。[](source:code-manifest)[](source:readme-upstream) | context-map | ctx-providers |
| step-ctx-operator | 运维方 | 安装已签名的发布资产，信任锚经另一条可信渠道提供。[](source:readme-install) | context-map | ctx-operator |
| step-ctx-service | 系统服务管理器 | 让看门狗保持运行：macOS 上是 launchd，Linux 上是 systemd 用户管理器。[](source:readme-macos)[](source:readme-linux) | context-map | ctx-service |

| 责任方       | 权威状态                                              |
| ------------ | ----------------------------------------------------- |
| 客户端       | 会话、工具状态、JSONL、SQLite、已存储条目、模型元数据 |
| 客户端控制面 | 凭据、提供商选择、客户端端点配置                      |
| 已安装的代理 | 清单所辖的载荷，以及注册到系统的服务定义              |
| 提供商       | 模型执行、配额和上游可用性                            |

每类状态只有一个责任方，代理只写归自己管的状态。[](source:arch-authority)

## 一轮对话会经历什么？ {#p-turn}

代理只放行 `POST /<provider>/v1/responses` 和 `GET /<provider>/v1/models`。请求头、请求体和查询参数都不能另选主机。[](source:readme-request)

@sequence id=turn-flow title="穿过代理的一轮 Responses 对话"
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
| turn-relay | turn-projection | 重建请求体 |
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
| step-turn-route | 回环监听器 | 从路径解析出提供商。经过编码、带点段或无关的路径，在任何上游 I/O 之前就拒绝。[](source:readme-request)[](source:code-route) | turn-flow | turn-listener | | turn-client-to-turn-listener-1,turn-listener-to-turn-relay-1 |
| step-turn-body | Responses 转发 | 读取一个按 ASCII Content-Length 定长的请求体，限时 30 秒、限长 64 MiB；太慢或太大的请求体分别得到 408 和 413。[](source:readme-body)[](source:code-body) | turn-flow | turn-relay | | turn-listener-to-turn-relay-1 |
| step-turn-project | 重放投影 | 先按可移植语法重建请求体；路由要求时，再选用明文委派。[](source:code-project) | turn-flow | turn-projection | | turn-relay-to-turn-projection-1,turn-projection-to-turn-relay-1 |
| step-turn-gate | Responses 转发 | 冷却中的提供商以 429 或 503 加 Retry-After 应答。否则放行这一轮请求，计为一个进行中的 Response。[](source:code-cooldown)[](source:code-gate) | turn-flow | turn-relay | | turn-relay-to-turn-exchange-1 |
| step-turn-send | 上游交互 | 同一个时限（默认 900 秒）约束等待响应头、重试、读取，以及对客户端的每一次写入。[](source:readme-deadline)[](source:code-deadline) | turn-flow | turn-exchange | | turn-exchange-to-turn-provider-1,turn-provider-to-turn-exchange-1,turn-exchange-to-turn-relay-1 |
| step-turn-deliver | 响应投递 | 每个事件先校验再写出；出现在任何内容之前的事件则暂存。[](source:code-hold)[](source:arch-live) | turn-flow | turn-delivery | | turn-relay-to-turn-delivery-1,turn-delivery-to-turn-client-1 |

## 请求发出去时保留了什么？ {#p-portable}

连续性来自客户端重放的对话，而非提供商的存储。因此，可移植的会话无需服务端状态，就能在已准入的提供商之间移植。[](source:dr2-consequence)

@diagram tree id=projection-tree source=projection.tree.json

@steps id=projection-steps
| step-pr-bindings | 提供商绑定 | response、conversation、缓存和已存储条目这几类绑定，在不同提供商之间没有共同含义，因此全部去除。[](source:arch-projection) | projection-tree | pr-bindings |
| step-pr-pairs | 工具调用及其输出 | 调用保留自己的标识，输出和调用保持配对。后到的结果若带有自身标识，就地改写成注明归属的消息。[](source:arch-projection) | projection-tree | pr-pairs |
| step-pr-agent | 加密的 Agent 消息 | 原生控制数据的信封和密文原样保留；代理不解密，也不承诺别的提供商能解密。[](source:arch-agent) | projection-tree | pr-agent |
| step-pr-controls | 本轮控制项 | 空的 additional_tools 列表保持为空，原生压缩期间也是如此。[](source:dr2-decision) | projection-tree | pr-controls |
| step-pr-refused | 在上游 I/O 之前拒绝 | 未知或未经证明的结构在本地直接以 400 拒绝，既不猜测，也不悄悄丢弃。[](source:dr2-decision)[](source:arch-projection) | projection-tree | pr-refused |

@callout level=note title="UCloud 上的可读委派"
| UCloud 路由在生成之前给 collaboration 命名空间设别名，可读参数到达后再还原。它绝不把密文改标为明文。[](source:readme-ucloud)[](source:code-plaintext) |

## 请求何时可以再发一次？ {#p-resend}

收到完整请求的提供商，可能已在处理它。再发一次，可能让提供商的工作和计费都重复一遍。[](source:dr6-resend)

@diagram lifecycle id=exchange-life source=exchange.lifecycle.json

@steps id=exchange-steps
| step-ex-sending | 发送中 | 请求发完之前出现的连接、DNS 和 TLS 失败会带退避重试，至多尝试四次。在复用的空闲连接上发送失败时，改在新连接上重发一次。[](source:code-transport-error)[](source:code-reused) | exchange-life | ex-sending |
| step-ex-sent | 已完整发出 | 从这一刻起，连接中断或回复格式错误都意味着结果未知，因为提供商可能已接受该请求。[](source:code-outcome) | exchange-life | ex-sent |
| step-ex-held | 内容之前 | 只有内容之前收到的 response.failed 才会重新发起请求；流若只是结束，则不会。[](source:code-reopen) | exchange-life | ex-held |
| step-ex-unknown | 结果未知 | 客户端收到一次 `502 upstream_outcome_unknown`，由它决定是否重试这一轮。[](source:dr6-resend) | exchange-life | ex-unknown |
| step-ex-expired | 时限已到 | 响应提交之前，客户端得到 `504 upstream_deadline_exceeded`；响应提交之后，流直接关闭，不带终止符。[](source:readme-deadline) | exchange-life | ex-expired |

每种上游错误只有一种应对，而且有限度；冷却只限制引发错误的那家提供商。[](source:dr3-decision)[](source:arch-recovery)

| 上游应答                    | 代理的做法                                                                                                                                |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `429`                       | 转发一次，再按 Retry-After 冷却这家提供商，至多 300 秒[](source:code-http-error)                                                          |
| 限次重试后的 `503`          | 转发原始错误，再短暂冷却这家提供商[](source:code-disposition)[](source:code-http-error)                                                   |
| DMXAPI `477 empty_response` | 把投影后的同一份字节再发一次[](source:code-dmx)                                                                                           |
| `response_failed`           | 以严格更小、不拆配对的请求重试，之后至多再试一次只含对话的请求[](source:code-compact)                                                     |
| 无效的 `input` 联合类型     | 改用更小的当前对话尝试一次，然后停止[](source:code-input-variant)                                                                         |
| 输入超长或媒体超预算        | 当前输入允许时，去掉较早的历史再试一次，然后停止[](source:code-capacity)[](source:code-compact)                                           |
| `invalid_encrypted_content` | 转发这次拒绝，不替换任务[](source:arch-agent)                                                                                             |
| 流中的顶层 `error` 事件     | 转发该事件和响应的结尾，上游在它之后发来的内容不再转发[](source:code-stream-terminals)[](source:code-stream-end)[](source:changelog-5112) |

## 已签名的发布版本如何成为正在服务的一代？ {#p-install}

安装绝不下载依赖，也不读取提供商凭据。[](source:readme-install-tx) 首先，ssh-keygen 必须为 SHA256SUMS.sig 恰好找到一个主体，归档包及其平台清单也必须与已签名的校验和相符。[](source:code-signature)[](source:code-artifact) 这之后事务才提交这个包，并在完成前核实监听器的身份。[](source:arch-commit)

原生可执行文件冷启动若超过默认的 30 秒，可用 `--timeout-seconds` 放宽。超过 3600 的值算用法错误。[](source:readme-install-tx)[](source:code-options)[](source:changelog-5111)

@diagram lifecycle id=tx-life source=transaction.lifecycle.json

@steps id=tx-steps
| step-tx-prepared | 已准备 | 写入之前，事务日志记下每个候选文件及其摘要。拒绝降级，也拒绝重装已安装的发布版本。[](source:code-begin)[](source:code-downgrade) | tx-life | tx-prepared |
| step-tx-materialized | 已落盘 | 候选写成新的不可变代，按自身清单验证，并预热它自己的可执行文件。[](source:code-materialize) | tx-life | tx-materialized |
| step-tx-activated | 已激活 | 选择器经一次原子写入，把候选定为当前代，把原来的一代定为前代；命令链接随之切换。[](source:code-activate)[](source:readme-generations) | tx-life | tx-activated |
| step-tx-finalized | 已完结 | 只有监听器报告了候选的身份，事务才算完结。更早的各代随后按记录下的字节移除。[](source:code-finalize)[](source:arch-selector) | tx-life | tx-finalized |
| step-tx-recovery | 需要恢复 | 事务日志保留；`recover` 读取运行中监听器的身份，据此完成或还原。已激活的升级或回滚，若此前的发布版本仍在服务，`recover` 先等 121 秒，再读一次健康状态，然后才还原。[](source:code-recover)[](source:code-recover-wait)[](source:arch-completion)[](source:changelog-602) | tx-life | tx-recovery |
| step-tx-rolled-back | 已回滚 | 先前的选择和命令链接恢复原样，只删除候选中已记录的文件。[](source:code-rollback)[](source:arch-deletion) | tx-life | tx-rolled-back |
| step-tx-closed | 已关闭 | 未写入任何内容的事务直接关闭，不产生其他影响。[](source:code-close) | tx-life | tx-closed |

@callout level=warning title="5.0.6 及更早版本留下的安装会被拒绝"
| 运行配置若缺少请求体、模型目录和 SSE 的上限，会被拒绝；载荷清单若没有回执摘要，也一样。在 macOS 上，launchd Agent 若不同时声明 Aqua 和 Background 两种会话类型，同样被拒绝。每种情况都给出原因，不做任何改动。这样的安装要先用当初安装它的那个版本卸载，再安装本版本。[](source:code-carrier-schema)[](source:changelog-600) |

## 升级怎样替换监听器，又一轮都不丢？ {#p-handoff}

升级、回滚和重载走同一套交接，替换监听器没有别的方式。运行中的监听器把监听套接字交给后继进程，新到的各轮请求因此始终得到放行。[](source:readme-handoff)

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
| ho-new | ho-old | SERVING，健康已核实 | return |
| ho-old | ho-new | FINALIZE |
| ho-new | ho-old | FINALIZED | return |
| phase | 服务 |
| ho-client | ho-new | 新到的请求 | emphasis |
| ho-old | ho-client | 已接受的请求做完 | return |
| phase | 核实 |
| ho-deploy | ho-new | 读取 /healthz |
| ho-new | ho-deploy | 已完结的身份 | return |

@steps id=handoff-steps
| step-ho-request | 部署 | 以 POST 发送发布版本和各项摘要。请求若与磁盘上选定的载荷不符，监听器即拒绝。监听器接受连接后，只在请求自带的超时之内开始交接；逾时的请求以 HTTP 408 拒绝。[](source:code-disk-match)[](source:code-local)[](source:code-prepare)[](source:code-expired) | handoff-flow | ho-deploy | | ho-deploy-to-ho-old-1,ho-old-to-ho-deploy-1 |
| step-ho-prepare | 后继进程 | 从选定的一代启动，继承套接字，并在服务之前回显身份。[](source:code-spawn)[](source:code-prepare) | handoff-flow | ho-new | | ho-old-to-ho-new-1,ho-new-to-ho-old-1 |
| step-ho-commit | 运行中的监听器 | 到 COMMIT 时，它停止接受连接；后继进程开始服务，并在 FINALIZE 之前通过 /healthz 证明自己的身份。[](source:code-commit)[](source:code-child) | handoff-flow | ho-old | | ho-old-to-ho-new-2,ho-new-to-ho-old-2,ho-old-to-ho-new-3,ho-new-to-ho-old-3 |
| step-ho-finish | 运行中的监听器 | 已接受的各轮请求留在旧进程上，直到结束或达到上游超时，至多 900 秒。[](source:code-old-finishes)[](source:code-lease) | handoff-flow | ho-old | | ho-client-to-ho-new-1,ho-old-to-ho-client-1 |
| step-ho-prove | 部署 | 只有旧进程已退出，且后继进程报告已完结的身份，部署才完结。[](source:code-finalized)[](source:code-request) | handoff-flow | ho-deploy | | ho-deploy-to-ho-new-1,ho-new-to-ho-deploy-1 |

交接若在后继进程越过 COMMIT 之前失败，就会回滚。回滚之前，部署先从 /healthz 读到：旧监听器与交接开始时记下的一致，仍在接受请求，也没有交接在进行。部署还要有证据表明，这次请求的交接不会再开始。这些若得不到证明，升级或回滚的事务就不结束，留给 `recover` 处理。[](source:code-failed-handoff)[](source:code-predecessor)[](source:changelog-600)[](source:changelog-602)

请求若没等到监听器应答就结束，部署不立即回滚，因为监听器仍可能开始交接。部署第一次读到监听器没有交接在进行，就从这时起等满请求自带的超时再加一秒，默认共 31 秒。届时仍没有交接，升级或回滚才还原此前的发布版本。这期间开始的交接，部署一直跟到结束。[](source:code-wait-at-rest)[](source:code-resolve)[](source:changelog-602)

@callout level=warning title="缺少交接能力的监听器会被拒绝"
| 运行中的监听器若没有同时声明 `selected-generation-handoff` 和 `admission-preserving-handoff`，`install`、`rollback` 和 `reload` 在做任何改动之前就拒绝。5.0.0 起的每个发布版本都声明了这两项能力。更旧的安装要先用它自己的版本卸载，再安装本版本。[](source:code-strategy)[](source:code-incompatible)[](source:readme-handoff)[](source:changelog-600) |

## 一次安装写入什么，写在哪里？ {#p-disk}

以下是 macOS 的默认位置；Linux 遵循 XDG 目录。[](source:code-roots)

@diagram tree id=disk-tree source=disk.tree.json

@steps id=disk-steps
| step-dk-selector | payload-selection.json | 当前代及其唯一前代的权威来源，仅此一份；监听器和生命周期命令都读取它。已安装的载荷只经它指明的那一代读取。数据根目录这一层的载荷文件不属于本产品。[](source:code-selector)[](source:code-selected)[](source:changelog-603) | disk-tree | dk-selector |
| step-dk-generations | generations/ | 每次安装写入一个新目录；升级成功后，恰好保留一个前代。[](source:readme-generations) | disk-tree | dk-generations |
| step-dk-transaction | 事务日志 | 只在事务尚未结束时存在，位于数据根目录旁，处在它可能删除的文件之外。[](source:code-journal-paths) | disk-tree | dk-transaction |
| step-dk-command | 命令链接 | 一个符号链接，指向选定的最新发布版本，因此服务回滚不会让命令降级。[](source:code-command-path)[](source:readme-generations) | disk-tree | dk-command |
| step-dk-agent | launchd Agent | 以看门狗角色运行可执行文件，并设置 RunAtLoad 和 KeepAlive。[](source:code-plist) | disk-tree | dk-agent |

`uninstall` 先读取各代载荷，再移除注册到系统的服务。因此 `generations/` 目录若无效，它在移除任何东西之前就拒绝。在 Linux 上，它还结束该目录中每一代的看门狗。[](source:code-uninstall)[](source:code-watchdogs-linux)[](source:changelog-603)

`uninstall --purge` 先记下每个载荷文件的路径和摘要，再只删除记下的这些文件。未知内容保留，并会报告。[](source:readme-purge)数据根目录中若没有本产品自有的代，清除就失败，目录里的内容原样保留。[](source:code-purge)[](source:changelog-603)

## 这个代理怎样走到今天？ {#p-history}

代理在 2026 年 7 月发布 1.0.0，11 月发布 7.0.0，其间两次改名。[](source:changelog-100)[](source:changelog-202)[](source:changelog-500)[](source:changelog-700)下面列出其中十九个版本，它们改变了客户端或运维方遇到的行为。

@diagram timeline id=history source=history.timeline.json title="这个代理怎样走到今天"

## 谁让监听器持续运行，status 又报告什么？ {#p-running}

端口关闭时，看门狗启动监听器；有事务尚未结束、也未激活时，它就等待。[](source:code-watchdog)

@diagram architecture id=running-map source=running.architecture.json

@steps id=running-steps
| step-run-manager | 系统服务管理器 | 加载时启动看门狗，并持续保活。[](source:code-plist)[](source:code-unit) | running-map | run-manager |
| step-run-watchdog | 看门狗 | 每 15 秒检查一次监听端口；启动接连失败时退避，最长 120 秒。[](source:code-watchdog) | running-map | run-watchdog |
| step-run-carrier | runtime-config.json | 监听器、看门狗和交接子进程各自加载自身可执行文件旁的运行配置，而不是 shell 的环境。[](source:code-activate-carrier) | running-map | run-carrier |
| step-run-cli | 命令行 | 同一时刻只有一个生命周期写入者；`status` 读取 /healthz 和载荷，不改动任何东西。[](source:code-lock)[](source:readme-evidence) | running-map | run-cli |

@facts
| macOS | 有 GUI 登录时，launchd Agent 位于该登录的域中，重启后会再次运行；在 Background 域中则不会。[](source:readme-macos)[](source:code-domains) |
| Linux | 需要可达的 systemd 用户管理器；注销后是否继续运行，取决于主机管理员控制的 lingering 策略。[](source:readme-linux) |

| 状态                | 含义                                               | 下一步命令       |
| ------------------- | -------------------------------------------------- | ---------------- |
| `running`           | 载荷已验证，监管者已绑定，监听器以已安装的身份服务 | 无               |
| `stopped`           | 监管者已声明，但它和监听器都未运行                 | `reload`         |
| `degraded`          | 已安装，但有一个已指明的问题                       | `doctor`         |
| `recovery_required` | 有一个载荷事务尚未结束                             | `recover`        |
| `invalid`           | 安装留下的证据无法验证                             | `status --json`  |
| `not_installed`     | 不存在自有的服务、监听器、命令、载荷或事务         | `install --help` |

每个结果至多给出一条下一步命令。[](source:code-status-next)[](source:readme-status)未选定任何一代时，`status` 报告 `payload_integrity` 的 `ok` 为 false，`detail` 为 `no payload generation is selected`。[](source:code-no-selection)[](source:changelog-603)

`status --json` 还报告可靠性计数器和已归类的失败，都不含凭据。[](source:readme-evidence)上游以顶层 `error` 事件结束的流，失败类别是 `stream_error`。[](source:code-stream-class)[](source:changelog-5112)

日志写明每个已放行的响应怎样结束，不含事件的消息文本。[](source:code-gate)[](source:changelog-601)流若以 `error` 事件结束，日志记 `terminal=error` 和该事件的错误码。流若没有终态事件就结束，日志记 `last=` 和最后接受的事件类型。[](source:code-stream-log)[](source:code-diagnostic)JSON 响应投递之后，日志记 `json_terminal` 和该响应的 `status`。[](source:code-json-terminal)

@callout level=note title="已接受的本地风险"
| 威胁模型保留的每项残余风险，都以同一用户的另一个进程为前提。例如，`recover` 读取 /healthz 时，不做 `status` 所做的进程检查。[](source:threat-residual) |
