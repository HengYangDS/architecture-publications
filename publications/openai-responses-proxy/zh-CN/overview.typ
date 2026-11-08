// OpenAI Responses Proxy: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([OpenAI Responses Proxy], [可移植的请求，事务化的发布], [面向 Codex 及其他 Responses 客户端的回环数据面：每个请求都以 store=false 重建，发往路径所指的提供商；代理还负责安装、交接和监管自己的监听器。], read-from: [读取自 80 个文件，各附 SHA-256。], claim-x: 300pt)

// ── Band 1: the route of one turn, from the client to its provider and back ──
#head(48pt, 132pt, [一个轮次的路线])
#tx(48pt, 152pt, [POST /\<provider\>/v1/responses 与 GET /\<provider\>/v1/models；其他路径一律在上游 I/O 之前拒绝], fill: soft)
#head(1324pt, 132pt, [提供商])
#tx(1324pt, 152pt, [每家一条路由，取自清单], fill: soft)

#let yr = 236pt
#seg((122pt, yr), (1300pt, yr), w: 4pt, c: green)
#let stations = (
  (122pt, [客户端], [Codex、Hermes 或 Responses SDK], "ring"),
  (260pt, [监听器], [127.0.0.1:8792，仅回环], "ring"),
  (410pt, [请求体], [单个 Content-Length，30 秒、64 MiB 以内], "tick"),
  (560pt, [投影], [store=false，\ 去除提供商绑定], "tick"),
  (710pt, [委派], [仅在选用它的 \ 路由上可读], "tick"),
  (860pt, [闸门], [冷却中的提供商 \ 立即应答], "tick"),
  (1010pt, [交互], [单一时限，默认 900 秒], "ring"),
  (1160pt, [传输], [不跟随重定向；\ 已发出的请求绝不重发], "tick"),
)
#for (x, name, note, kind) in stations {
  if kind == "ring" { ring(x, yr, r: 6pt, w: 2.2pt) } else { tick(x, yr, h: 14pt, w: 2.4pt) }
  txc(x, yr - 16pt, 130pt, name, weight: "semibold")
  txc(x, yr + 26pt, 128pt, note, fill: soft)
}
#seg((1316pt, yr - 46pt), (1316pt, yr + 46pt), w: 4pt, c: green)
#dl(1324pt, yr - 30pt, 80pt, 228pt, (
  ([dmxapi], [www.dmxapi.cn]),
  ([ucloud], [api.modelverse.cn]),
  ([aihubmix], [api.inferera.com]),
  ([upstream], [安装时选定的一个源站]),
))
#tx(1324pt, yr + 50pt, [清单指定每条路由的源站，\ 以及报文策略（如有）。], w: 228pt, fill: soft)

// The response comes back through delivery, which validates before it writes.
#seg((1300pt, 318pt), (122pt, 318pt), (122pt, 298pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#place(top + left, polygon(fill: ochre, (122pt, 291pt), (118.5pt, 297pt), (125.5pt, 297pt)))
#tx(140pt, 338pt, [投递先校验每个事件再写出，并暂存内容之前的事件，因此内容前的 response.failed 可以重开。], fill: ochre, style: "italic")

// Band 1 foot: what a request keeps, and how each upstream failure is bounded.
#hrule(364pt, x1: 776pt)
#hrule(364pt, x0: 824pt)
#head(48pt, 390pt, [离开监听器的内容])
#dl(48pt, 414pt, 84pt, 728pt, (
  ([保留], [对话消息、工具调用及其输出、本轮控制项、加密的 Agent 消息]),
  ([去除], [前一个 response 与 conversation 的绑定、缓存键、推理内容、条目引用、搜索调用]),
  ([改写], [空的工具输出改为一个标记；后到的工具结果改为注明归属的消息]),
  ([拒绝], [未知类型和残缺的工具配对：在任何上游 I/O 之前以 400 拒绝]),
))
#head(824pt, 390pt, [每种失败都有一个有界的应对])
#dl(824pt, 414pt, 150pt, 728pt, (
  ([429], [转发一次；仅该提供商按 Retry-After 冷却，至多 300 秒]),
  ([重试后的 503], [转发；该提供商短暂冷却，直到下一次探测]),
  ([DMXAPI 477], [确切的 empty\_response：同样的字节再发一次]),
  ([response\_failed], [逐步缩小、不拆配对的重试，然后是一次仅含对话的尝试]),
  ([发出后断连], [502 upstream\_outcome\_unknown；由客户端决定]),
  ([时限], [提交前返回 504；提交后关闭流，绝不重放]),
))

// ── Band 2: one transaction per release, one handoff per new listener ──────
#hrule(530pt)
#head(48pt, 558pt, [每个发布版本都是一个记日志的事务])
#let yk = 630pt
#seg((112pt, yk), (712pt, yk), w: 1.7pt, c: green)
#let steps = (
  (112pt, "已准入", [用 ssh-keygen \ 验证签名], "ring", 118pt),
  (262pt, "已准备", [每个文件及摘要均已 \ 记入日志], "tick", 118pt),
  (412pt, "已物化", [新的一代，已预热], "tick", 118pt),
  (562pt, "已激活", none, "tick", 0pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 130pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(712pt, yk, r: 6pt, w: 2.4pt)
#txc(712pt, yk - 14pt, 90pt, [已完结], weight: "semibold")
#txc(712pt, yk + 24pt, 104pt, [监听器证明其身份], fill: soft)
#seg((562pt, yk + 6pt), (562pt, 700pt), (590pt, 700pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(597pt, 700pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(610pt, 704pt, [未确认：由 recover \ 完成或还原], w: 160pt, fill: ochre)
#tx(48pt, 724pt, [激活切换命令链接和唯一的选择器；选择器指定活动代及其唯一的前代。\ 回滚是回到前代的一个新事务。], w: 500pt, fill: soft)

#head(824pt, 558pt, [换新监听器，不丢一个轮次])
#seg((896pt, yk), (1496pt, yk), w: 1.7pt, c: green)
#let phases = (
  (896pt, "PREPARE", [后继进程 \ 从选定的一代启动], "ring"),
  (1046pt, "READY", [继承套接字，回显身份], "tick"),
  (1196pt, "COMMIT", [旧监听器不再接受连接], "tick"),
  (1346pt, "SERVING", [在 /healthz 上证明健康], "tick"),
)
#for (x, name, note, kind) in phases {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 130pt, name, weight: "semibold")
  txc(x, yk + 24pt, 140pt, note, fill: soft)
}
#ring(1496pt, yk, r: 6pt, w: 2.4pt)
#txc(1490pt, yk - 14pt, 100pt, [FINALIZE], weight: "semibold")
#txc(1484pt, yk + 24pt, 130pt, [旧监听器完成其轮次，\ 至多 900 秒], fill: soft)
#tx(824pt, 724pt, [不具备此能力的运行时改为排空：后继进程开始服务之前，新轮次会得到可重试的 503。], w: 728pt, fill: soft)

// ── Band 3: what keeps it running, the commands, and what others own ───────
#hrule(756pt)
#head(48pt, 782pt, [保持运行])
#dl(48pt, 806pt, 116pt, 460pt, (
  ([服务管理器], [launchd、systemd 或任务计划程序让它保持存活]),
  ([看门狗], [每 15 秒检查端口；启动监听器]),
))
#head(560pt, 782pt, [命令])
#dl(560pt, 806pt, 84pt, 470pt, (
  ([只读], [status 和 doctor 只读取，并给出下一条命令（如有）]),
  ([变更], [install、reload、rollback、recover 和 uninstall，一次一个]),
))
#head(1072pt, 782pt, [由他方掌管])
#dl(1072pt, 806pt, 110pt, 480pt, (
  ([客户端], [会话、工具状态和模型选择]),
  ([控制面], [凭据、提供商选择和客户端配置]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([每个视图各有一幅图版；交互页面就是导读，每项陈述都注明出处。])
