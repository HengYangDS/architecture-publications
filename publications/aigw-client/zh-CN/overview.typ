// AIGW: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([AIGW], [一份审阅过的配置，写入每个客户端], [本地控制面：AIGW 把审阅过的配置写成各客户端的原生配置，只改归自己管的部分；它只在执行命令或读取凭据时运行，请求绝不经过它。], read-from: [内容取自 208 个文件，每个文件都标明 SHA-256。], claim-x: 124pt)

// ── Band 1: the configuration, its projection into each client, the clients' own traffic ──
#head(48pt, 132pt, [控制面 · AIGW])
#tx(48pt, 152pt, [config.toml 由一把锁保护 · 令牌另行存放], fill: soft)
#head(824pt, 132pt, [数据面 · 各客户端])
#tx(824pt, 152pt, [各客户端保留自己的状态，自己调用自己的端点], fill: soft)

// The configuration: what an Account exposes, which Route a client uses.
#let yr = 236pt
#let (xa, xr, xb, xbus) = (120pt, 340pt, 560pt, 700pt)
#seg((xa + 8pt, yr), (xr - 8pt, yr), w: 1.7pt, c: green)
#seg((xr + 8pt, yr), (xb - 8pt, yr), w: 1.7pt, c: green)
#seg((xr, yr + 8pt), (xr, 328pt), w: 1.7pt, c: green)
#ring(xa, yr, r: 6pt, w: 2.2pt)
#ring(xr, yr, r: 6pt, w: 2.2pt)
#disc(xb, yr, r: 6.5pt)
#ring(xr, 336pt, r: 5pt, w: 2pt)
#ring(xa, 336pt, r: 5pt, w: 2pt)
#tx(xa - 8pt, yr - 16pt, [账户], weight: "semibold")
#tx(xr - 8pt, yr - 16pt, [路由], weight: "semibold")
#tx(xb - 8pt, yr - 16pt, [客户端绑定], weight: "semibold")
#tx(xa + 12pt, yr + 26pt, [提供商的一项能力：按协议列出端点，绝不含凭据], w: 176pt, fill: soft)
#tx(xr + 12pt, yr + 26pt, [一个账户如何按接口和生命周期提供一个模型], w: 176pt, fill: soft)
#tx(xb + 12pt, yr + 26pt, [某个已准入客户端选用的路由], w: 104pt, fill: soft)
#tx(xa + 86pt, yr - 6pt, [提供], fill: mid, style: "italic")
#tx(xr + 76pt, yr - 6pt, [被选用], fill: mid, style: "italic")
#tx(xr + 14pt, 341pt, [模型], weight: "semibold")
#tx(xr + 14pt, 359pt, [标识一款规范的上游产品], fill: soft)
#tx(xa + 14pt, 341pt, [令牌], weight: "semibold")
#tx(xa + 14pt, 359pt, [放在选定的一个存储里：密钥环、DPAPI 或属主专用文件], w: 190pt, fill: soft)

// The projection: one guarded transaction into each admitted client's own region.
#let rows = (200pt, 262pt, 324pt, 386pt)
#seg((xb + 6pt, yr), (xbus, yr), w: 4pt, c: green)
#seg((xbus, rows.first()), (xbus, rows.last()), w: 4pt, c: green)
#for y in rows { seg((xbus, y), (852pt, y), w: 2.2pt, c: green) }
#tx(xbus + 14pt, 186pt, [规划 · 应用 · 验证，一次受保护的事务], fill: green, style: "italic")
#let clients = (
  ([Codex], [\~/.codex/config.toml], [对话、模型元数据和 Desktop 图形界面仍归 Codex]),
  ([Claude Code], [\~/.claude/settings.json], [会话和运行时行为仍归 Claude Code]),
  ([Claude Desktop], [Claude-3p/configLibrary], [它自己的库；其余都归应用本身]),
  ([Hermes], [\~/.hermes/config.yaml], [除 AIGW 自己的提供商和模型外，其余都归 Hermes]),
)
#for (k, (name, target, keeps)) in clients.enumerate() {
  let y = rows.at(k)
  ring(860pt, y, r: 6pt, w: 2.2pt)
  head(876pt, y + 6pt, name)
  tx(1070pt, y + 5pt, target)
  tx(876pt, y + 24pt, keeps, fill: soft)
  seg((1336pt, y), (1404pt, y), w: 1.5pt, c: mid)
  right-arrow(1412pt, y, s: 6pt)
}
#seg((1420pt, rows.first() - 14pt), (1420pt, rows.last() + 14pt), w: 4pt, c: green)
#head(1436pt, 206pt, [端点])
#tx(1436pt, 226pt, [提供商，或选定的网关], fill: soft, w: 66pt)
#tx(1436pt, 282pt, [流量、重试和服务生命周期都归它们], fill: soft, w: 104pt)
#tx(1236pt, 176pt, [每个请求直接发往自己的端点], fill: mid, style: "italic")
// The credential read: on demand, by the client, matched to its projection.
#seg((xa, 344pt), (xa, 420pt), (846pt, 420pt), (846pt, rows.last() + 8pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#place(top + left, polygon(fill: ochre, (846pt, rows.last() + 6pt), (842.5pt, rows.last() + 12pt), (849.5pt, rows.last() + 12pt)))
#tx(170pt, 414pt, [每个客户端通过 aigw credential 按需读取自己的令牌，令牌与写入该客户端的配置对应], fill: ochre, style: "italic")

// Band 1 foot: what the operator does, and the one vocabulary every surface reports.
#hrule(448pt, x1: 776pt)
#hrule(448pt, x0: 824pt)
#dl(48pt, 472pt, 104pt, 728pt, (
  ([setup], [首次设置：一个账户和一个路由，绑定到选定的客户端]),
  ([use], [为一个客户端选择路由]),
  ([sync], [重新同步每个已启用的客户端；\-\-dry-run 只显示计划，不读取任何机密]),
  ([verify], [用真实的原生客户端验证路由，可能消耗配额；只有 \-\-for all 全部通过才记录检查点]),
  ([rotate], [更新一个账户令牌]),
  ([rollback], [恢复配置和写入客户端的内容，不恢复程序]),
))
#dl(824pt, 472pt, 132pt, 728pt, (
  ([已配置], [本地前提条件满足；尚未观测任何端点]),
  ([端点已检查], [一次端点诊断成功；推理尚未证实]),
  ([推理已检查], [一次请求成功，用的正是路由的确切模型]),
  ([已推迟], [凭据或客户端配置有意推迟]),
  ([降级], [配置仍在，但有可恢复的问题]),
  ([无效 · 不可用], [不能安全使用 · 缺少一项必需的能力]),
))

// ── Band 2: the transaction every projection is, and who owns what ─────────
#head(48pt, 614pt, [每次写入都是一次受保护的事务])
#let yk = 682pt
#seg((106pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (106pt, [发现], [每个已准入客户端及其原生路径], "ring", 104pt),
  (248pt, [规划], [写入之前就已完整，且不含机密], "tick", 130pt),
  (390pt, [准备], [记下每个目标写入前后的确切状态], "tick", 104pt),
  (520pt, [提交], none, "ring", 0pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 120pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 70pt, [回执], weight: "semibold")
#txc(744pt, yk + 24pt, 96pt, [凭一份回执补偿], fill: soft)
#tx(560pt, yk - 6pt, [全部已提交], fill: green, style: "italic")
#seg((520pt, yk + 6pt), (520pt, 740pt), (536pt, 740pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(543pt, 740pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(556pt, 736pt, [逆序补偿，且只在文件仍是本次写入时才做；内容一旦变化即拒绝，绝不覆盖后来者的写入。], w: 220pt, fill: ochre)

#head(824pt, 614pt, [什么归谁])
#let owners = (
  ([AIGW 配置], [账户、模型、路由、推荐和客户端绑定]),
  ([选定的令牌存储], [账户令牌；存储由 AIGW 选择]),
  ([客户端适配器], [客户端自身配置中已准入、归 AIGW 管的一块]),
  ([客户端本身], [对话、记忆、工具和图形界面状态]),
  ([端点产品], [流量规范化、重试和服务生命周期]),
  ([本地 Git 与代码托管平台], [已签名的提交和标签；托管、CI 与发布记录]),
)
#hrule(634pt, x0: 824pt)
#for (k, (who, what)) in owners.enumerate() {
  tx(824pt, 654pt + k * 18pt, who, weight: "semibold")
  tx(1010pt, 654pt + k * 18pt, what, fill: soft)
}

// ── Band 3: the program, configuration that travels, accounts that change ──
#hrule(786pt)
#head(48pt, 812pt, [程序本身])
#dl(48pt, 836pt, 96pt, 460pt, (
  ([update], [只更新或回滚便携程序]),
  ([uninstall], [先撤回 AIGW 写入客户端的配置，再移除程序]),
))
#head(560pt, 812pt, [不含机密的配置])
#dl(560pt, 836pt, 84pt, 470pt, (
  ([export], [一份不含机密的配置清单]),
  ([import], [合并这样一份清单；migrate 迁移配置的模式]),
))
#head(1072pt, 812pt, [变更账户])
#dl(1072pt, 836pt, 84pt, 480pt, (
  ([rename], [重命名账户；之后用 \-\-finalize 删除旧的凭据槽位]),
  ([rotate], [替换选定存储中的一个令牌]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([每个视图各有一幅图版；交互页面就是导览，每条论断都标明出处。])
