// DDWG: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([DDWG], [从工作问题，到规则所在的那一个主题], [成员和智能体不用安装任何软件就能读这份指南；维护者修改指南，要走一项 OpenSpec 正式变更，由已安装的 ETHOS 准入、证明并发布。], read-from: [依据 48 个文件写成，每个文件都按 SHA-256 引用。], claim-x: 124pt)

// ── Band 1: two entries, one task map, seven topics under the charter ──────
#head(48pt, 132pt, [两个入口，一张任务地图])
#tx(48pt, 152pt, [成员和智能体读同一套指南], fill: soft)
#head(588pt, 132pt, [七个主题，每条规则只归一处])
#tx(588pt, 152pt, [任务地图把每个工作问题引到负责它的章节], fill: soft)

#let yr = 236pt
#let (xe, xm, xbus) = (120pt, 380pt, 540pt)
// The repository entry leads to the task map; the Agent entry joins it from below.
#seg((xe + 8pt, yr), (xm - 8pt, yr), w: 1.7pt, c: green)
#seg((xe + 8pt, 336pt), (xm, 336pt), (xm, yr + 8pt), w: 1.7pt, c: green)
#ring(xe, yr, r: 6pt, w: 2.2pt)
#ring(xe, 336pt, r: 6pt, w: 2.2pt)
#disc(xm, yr, r: 6.5pt)
#tx(xe - 8pt, yr - 16pt, label-of("repository-entry"), weight: "semibold")
#tx(xm - 8pt, yr - 16pt, label-of("task-map"), weight: "semibold")
#tx(xe + 12pt, yr + 26pt, [README.md：先讲宗旨，再引向#box[任务地图]，#box[并写明 MIT License 授权]], w: 220pt, fill: soft)
#tx(xe + 14pt, 326pt, label-of("agent-entry"), weight: "semibold")
#tx(xe + 12pt, 362pt, [AGENTS.md：委托范围；#box[授权和验收留在人手里]], w: 236pt, fill: soft)
#tx(xm + 14pt, yr + 26pt, [docs/README.md，#box[紧急路线在前]], w: 132pt, fill: soft)

// The task map's bus to the seven topics; the charter, which the other topics apply, comes first.
#let rows = (176pt, 216pt, 256pt, 296pt, 336pt, 376pt, 416pt)
#seg((xm + 8pt, yr), (xbus, yr), w: 4pt, c: green)
#seg((xbus, rows.first()), (xbus, rows.last()), w: 4pt, c: green)
#let topics = (
  ("charter", [两种依据、四条底线，以及每个主题都要用的风险分级]),
  ("decide", [界定决策、诊断故障、让方案可以比较]),
  ("data", [证明数据资产适合用途；变更共享或生产数据]),
  ("deliver", [动手前核对承诺；凭证据收尾]),
  ("communicate", [理清汇报、决策文档或上报的结构]),
  ("human-agent", [委托有边界的任务；检查智能体的实际输出]),
  ("evolve", [紧急情况与例外；辅导；准入或撤下一项实践]),
)
#for (k, (id, duty)) in topics.enumerate() {
  let y = rows.at(k)
  seg((xbus, y), (xbus + 40pt, y), w: 2.2pt, c: green)
  if k == 0 { disc(xbus + 48pt, y, r: 6.5pt) } else { ring(xbus + 48pt, y, r: 6pt, w: 2.2pt) }
  tx(xbus + 64pt, y + 5pt, label-of(id), weight: "semibold")
  tx(xbus + 248pt, y + 5pt, duty, fill: soft)
}
#tx(1300pt, 176pt, [一条规则，只归一处], weight: "semibold")
#tx(1300pt, 196pt, [每项义务只在一处维护。#box[导航、范例、决策记录和治理页面]#box[都链接过去，不另写一遍。]], w: 252pt, fill: soft)
#tx(1300pt, 316pt, [紧急优先], weight: "semibold")
#tx(1300pt, 336pt, [紧急故障或越界的路线，#box[排在所有常规路线之前。]], w: 252pt, fill: soft)

// Band 1 foot: what the charter holds every topic to.
#hrule(456pt, x1: 776pt)
#hrule(456pt, x0: 824pt)
#tx(48pt, 482pt, [四条底线], weight: "semibold")
#dl(48pt, 504pt, 144pt, 728pt, (
  ([说真话], [不编造、不隐瞒、不挑着说；没把握的不说成有把握]),
  ([守边界], [对象、时间、能力、权限、数据、安全、合规、行动]),
  ([责任落到人], [每项判断、决定、变更和验收都有人负责]),
  ([不虚报完成], [没有对得上的证据，不说完成、正确、可用或已采用]),
))
#tx(824pt, 482pt, [形式随风险而定], weight: "semibold")
#dl(824pt, 504pt, 112pt, 728pt, (
  ([L0 轻量], [局部、可逆：一次讲清结论、依据和做法]),
  ([L1 标准], [跨角色、方案相互竞争或有重大不确定：留一份可评审的记录]),
  ([L2 高风险], [生产、资金、敏感数据、覆盖：授权、回滚、评审]),
  ([评审], [看实际的事实和证据，不看作者或智能体自己怎么说]),
))

// ── Band 2: the life of one change, and who owns what ──────────────────────
#head(48pt, 604pt, [每项改动都走一项正式变更])
#let yk = 664pt
#seg((104pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (104pt, [正式变更], [提案、设计、#box[增量、tasks.md]], "ring"),
  (210pt, [工作通道], [#box[归属与租约]#box[由 ETHOS 管理]], "tick"),
  (316pt, [写前准入], [确切路径，#box[写入前一刻]], "tick"),
  (422pt, [提交], [可信的 SSH 签名], "tick"),
  (528pt, [证明], none, "ring"),
  (634pt, [已验收], [dev 快进前移], "tick"),
)
#for (x, name, note, kind) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 100pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, 100pt, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 70pt, [归档], weight: "semibold")
#txc(744pt, yk + 24pt, 96pt, [新的提交，#box[重新证明]], fill: soft)
#tx(548pt, yk - 6pt, [通过], fill: green, style: "italic")
#seg((528pt, yk + 6pt), (528pt, 736pt), (548pt, 736pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(555pt, 736pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(568pt, 740pt, [阻断或未知：什么都不前移，#box[也不能用直接推送绕过它]], w: 200pt, fill: ochre)
#tx(48pt, 740pt, [证明就是在确切的 HEAD 上执行完整的主机检查图。], w: 440pt, fill: soft)

#head(824pt, 604pt, [谁负责什么])
#hrule(624pt, x0: 824pt)
#let owners = (
  ([OpenSpec 正式变更], [实质意图、需求、设计，以及 tasks.md 里的进度]),
  ([已安装的 ETHOS], [改动归属、租约、准入、证明、验收和发布]),
  ([治理页面], [权限、验收、发布和撤下的边界]),
  ([贡献指南], [编辑、核验、准备 ETHOS 和发布时用的确切命令]),
  ([配置地图], [每项检查背后的原生输入]),
  ([决策记录], [长期决策的理由和被否决的备选方案，不记任务或日志]),
)
#for (k, (who, what)) in owners.enumerate() {
  tx(824pt, 644pt + k * 18pt, who, weight: "semibold")
  tx(1000pt, 644pt + k * 18pt, what, fill: soft)
}

// ── Band 3: the edition, its two Forges, what a pass does not prove ────────
#hrule(774pt)
#head(48pt, 800pt, [版本])
#dl(48pt, 824pt, 84pt, 460pt, (
  ([VERSION], [8.0.0，唯一的发布标识；变更日志跟着它走]),
  ([标签], [签名的 vX.Y.Z，与 VERSION 和对应的变更日志条目一致]),
))
#head(560pt, 800pt, [两个平台，各自独立])
#dl(560pt, 824pt, 72pt, 470pt, (
  ([GitLab], [组织的发布平台]),
  ([GitHub], [独立的仓库、CI/CD 和分发]),
))
#head(1072pt, 800pt, [通过证明不了什么])
#dl(1072pt, 824pt, 96pt, 480pt, (
  ([检查], [含义、阅读顺序或团队采用]),
  ([本地证明], [已交付到任一平台]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([每个视图各有一幅图版；交互页面就是导读，每条说法都注明出处。])
