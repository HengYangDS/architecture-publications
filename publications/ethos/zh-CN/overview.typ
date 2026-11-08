// ETHOS · 问道: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([ETHOS · 问道], [意图先经编译和证明，仓库才会改动], [每一步都把正式意图和刚观察到的事实编译成一份 TransitionPlan；只有 pass 才准入改动，每次改动都是一次确切的 compare-and-swap，核验记录不授予任何决定权。], read-from: [取自 467 个文件，每个文件都以其 SHA-256 引用。], claim-x: 196pt)

// ── Band 1: the repository's roles above, one change below them ───────────
#let ys = 236pt
#let tr = 22pt
#head(48pt, 132pt, [意图])
#head(200pt, 132pt, [工作通道 · 并行])
#head(812pt, 132pt, [候选分支])
#head(982pt, 132pt, [已验收])
#head(1150pt, 132pt, [发布])
#head(1318pt, 132pt, [平台])
#tx(48pt, 152pt, [openspec/ · 正式变更], fill: soft)
#tx(200pt, 152pt, [work/\* · 各有一个工作区和一份租约], fill: soft)
#tx(812pt, 152pt, [candidate/dev · land], fill: soft)
#tx(982pt, 152pt, [dev · 收尾], fill: soft)
#tx(1150pt, 152pt, [main · 签名的 v\* 标签], fill: soft)
#tx(1318pt, 152pt, [GitLab · GitHub · publish], fill: soft)

// The archive returns to the intent: the specs change with the repository.
#seg((682pt, ys - tr), (682pt, 182pt), (112pt, 182pt), (112pt, ys - 12pt), w: 1.15pt, c: mid)
#down(112pt, ys - 8pt, c: mid)
#tx(300pt, 177pt, [归档会更新规格], fill: mid, style: "italic")
// The proof is made once and read by every move below the lanes.
#seg((748pt, 182pt), (1206pt, 182pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#for x in (880pt, 1046pt, 1206pt) {
  seg((x, 182pt), (x, ys - 12pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
  down(x, ys - 8pt)
}
#tx(886pt, 177pt, [确切提交的证明核验记录], fill: ochre, style: "italic")

// The change: one heavy line, three lanes in parallel, one at a time after them.
#seg((112pt, ys), (208pt, ys), w: 4pt, c: green)
#seg((208pt, ys), (792pt, ys), w: 4pt, c: green)
#seg((208pt, ys), (230pt, ys - tr), (770pt, ys - tr), (792pt, ys), w: 1.7pt, c: green)
#seg((208pt, ys), (230pt, ys + tr), (770pt, ys + tr), (792pt, ys), w: 1.7pt, c: green)
#seg((792pt, ys), (1366pt, ys), w: 4pt, c: green)
#ring(112pt, ys, r: 7pt, w: 2.6pt)
#let lane = ((262pt, "开始", "tick"), (382pt, "写前准入", "ring"), (502pt, "提交", "ring"), (622pt, "归档", "tick"), (742pt, "证明", "ring"))
#for (x, name, kind) in lane {
  for dy in (-tr, 0pt, tr) {
    if kind == "tick" { tick(x, ys + dy, h: if dy == 0pt { 15pt } else { 11pt }) } else { ring(x, ys + dy, r: if dy == 0pt { 5pt } else { 3.6pt }, w: if dy == 0pt { 2pt } else { 1.5pt }) }
  }
  txc(x, ys - tr - 11pt, 110pt, name, weight: "semibold")
}
#tick(880pt, ys, h: 15pt)
#disc(1046pt, ys, r: 6pt)
#disc(1206pt, ys, r: 6pt)
#ring(1366pt, ys, r: 7pt, w: 2.6pt)

// What each role does, set directly under it.
#tx(48pt, 290pt, [OpenSpec 是唯一 \ 受版本管理的意图；\ 一项正式变更编译成 \ 一个 Commitment。], w: 140pt)
#dl(200pt, 290pt, 72pt, 290pt, (
  ([开始], [从候选分支创建自有分支]),
  ([写前准入], [写入前核对受版本管理的确切路径]),
  ([提交], [由所选运行时的钩子准入]),
))
#dl(500pt, 290pt, 66pt, 300pt, (
  ([归档], [官方归档，一次签名提交]),
  ([证明], [确切 HEAD 的门禁图，存于 Git 旁]),
))
#tx(812pt, 290pt, [通道逐条落地；\ 基线过时则拒绝，由 \ #box[lane refresh-base] 重放。], w: 158pt)
#tx(982pt, 290pt, [dev 只随已证明候选分支的收尾前进。], w: 150pt)
#tx(1150pt, 290pt, [main 接收已验收 dev 的 \ 签名标签；由托管作业发布。], w: 166pt)
#tx(1318pt, 290pt, [每个平台一次原子推送，各有回执；\ 不声称跨平台的原子性。], w: 234pt)

// Band 1 foot: how a lane is held, and how a move is refused.
#hrule(360pt, x1: 776pt)
#hrule(360pt, x0: 824pt)
#dl(48pt, 384pt, 112pt, 728pt, (
  ([租约], [持有者、代次和到期时间记在 state.sqlite 中：每条通道只有一个归属方，可续约、恢复或接管]),
  ([写入顺序], [目标路径 · 仓库根目录 · 刷新上下文 · status · prewrite · 写入 · 写后审计]),
  ([交接], [通道作为一个内容寻址的包在主机之间转移；revoke-source 结束旧租约]),
  ([退役], [landed、superseded、absorbed-ref、abandon 或 recover，始终在预期的头提交上]),
))
#dl(824pt, 384pt, 140pt, 728pt, (
  ([无决定权], [没有 \-\-authorize 和 \-\-expect-head，什么都不会移动]),
  ([候选分支已分叉], [先用 candidate \-\-refresh-from-accepted 重置，再重放通道]),
  ([未经证明的归档], [archive-change \-\-compensate 恢复归档前的确切头提交]),
  ([未知或有未提交改动], [只观察，直到某个公开转换能推导出一个安全的改动]),
))

// ── Band 2: the plan every step is, and the structure every repository shares ──
#head(48pt, 500pt, [每一步都是一份 TransitionPlan])
#let yk = 586pt
#seg((104pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (104pt, "输入", [Commitment、Facts \ 和先前的核验记录], "ring", 112pt),
  (216pt, "决定权", [已解析，\ 并列出每处矛盾], "tick", 104pt),
  (320pt, "编译", [检查、决策 \ 和改动], "tick", 92pt),
  (424pt, "排序", [一个 DAG；\ 输入相同，字节相同], "tick", 114pt),
  (536pt, "判定", none, "ring", 0pt),
  (640pt, "改动", [一次确切的 \ compare-and-swap], "tick", 104pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 110pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 84pt, [写下核验记录], weight: "semibold")
#txc(744pt, yk + 24pt, 70pt, [仅作证据], fill: soft)
#tx(568pt, yk - 6pt, [pass], fill: green, style: "italic")
#seg((536pt, yk + 6pt), (536pt, 652pt), (556pt, 652pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(563pt, 652pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(576pt, 656pt, [block 或 unknown：不做改动], fill: ochre, style: "italic")
#tx(48pt, 700pt, [输入都是显式的值：编译不从环境读取文件、时钟、网络或进程。只有持有显式根目录、决定权、前置条件和预期状态的适配器，才会执行已准入的改动，并写下核验记录。], w: 728pt, fill: soft)

#head(824pt, 500pt, [每个受治理仓库共有的结构])
#let cols = (
  (824pt, [声明], (([profile.toml], [绑定、OpenSpec 路径]), ([范式], [命名、文档、工具链]), ([OpenSpec], [唯一受版本管理的意图]))),
  (1008pt, [检查], (([文档], [命名、许可证、链接]), ([尺寸], [统一的单文件上限]), ([流水线], [一个 CI 模型，覆盖每个平台]))),
  (1192pt, [强制], (([提交], [信息语法和 SSH 签名]), ([布局], [导入解析到归属方]), ([投影], [只用原生生成器]))),
  (1376pt, [存于 Git 旁], (([state.sqlite], [租约]), ([attestations-set], [持久的核验记录]), ([runtime/CURRENT], [一个运行时；保留 ROLLBACK]))),
)
#for (x, title, rows) in cols {
  tx(x, 536pt, title, weight: "semibold")
  hrule(546pt, x0: x, x1: x + 166pt)
  for (k, (term, def)) in rows.enumerate() {
    tx(x, 570pt + k * 40pt, term, weight: "semibold")
    tx(x, 586pt + k * 40pt, def, fill: soft)
  }
}
#tx(824pt, 700pt, [ETHOS 自己也守同一条底线。配置选择事实和门禁，但从不选择命令的含义。], w: 728pt, fill: soft)

// ── Band 3: how a repository is formed, how it is reached, how a lane ends ─
#hrule(744pt)
#head(48pt, 770pt, [建立或接入])
#dl(48pt, 794pt, 152pt, 460pt, (
  ([adopt \-\-create], [用起始模板建立新仓库]),
  ([adopt], [在其头提交上绑定现有仓库]),
  ([adopt \-\-evolve-starter], [把起始模板的升级合并进候选分支]),
))
#head(560pt, 770pt, [以同样方式触达])
#dl(560pt, 794pt, 72pt, 470pt, (
  ([CLI], [status、plan、prove、land、publish、lane 和 hook]),
  ([MCP], [同样的操作，经由绑定根目录的传输]),
  ([技能], [按所声明的命令校验的包]),
))
#head(1072pt, 770pt, [每条通道都明确结束])
#dl(1072pt, 794pt, 72pt, 480pt, (
  ([retire], [landed · superseded · absorbed-ref · abandon · recover]),
  ([lease], [renew · resume · reacquire · takeover]),
  ([handoff], [transfer · export · import · revoke-source]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([每个视图各有一张图版；交互页面就是指南，每项论断都附引用。])
