// Architecture Publisher: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([Architecture Publisher], [含义、证据、形式与验收，各归一方], [archpub 依据显式模型绘制任意仓库的架构，把交付物的每个字节绑定到其输入，只出版具名审阅人验收过的内容。], read-from: [读取 64 个文件，各附 SHA-256。], claim-x: 270pt)

// ── Band 1: four owners side by side; one build passes through them ───────
#let cols = ((48pt, [作者], [掌管含义]), (346pt, [仓库], [存放证据]), (636pt, [出版工具], [赋予形式]), (1196pt, [审阅人], [验收并出版]))
#let yb = 262pt
#let ybind = 176pt
#let xbind = 1100pt
#for (k, (x, name, role)) in cols.enumerate() {
  head(x, 132pt, name)
  tx(x, 152pt, role, fill: soft)
  // A rule that the binding crosses pauses for its line and its sentence.
  if k > 0 and x - 16pt < xbind {
    seg((x - 16pt, 118pt), (x - 16pt, ybind - 22pt), w: 0.8pt, c: rule)
    seg((x - 16pt, ybind + 8pt), (x - 16pt, 460pt), w: 0.8pt, c: rule)
  } else if k > 0 { seg((x - 16pt, 118pt), (x - 16pt, 460pt), w: 0.8pt, c: rule) }
}
// The binding: the manifest names the digest of every input, so every byte answers to one.
#seg((xbind, yb - 8pt), (xbind, ybind), (84pt, ybind), (84pt, yb - 10pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#down(84pt, yb - 8pt)
#seg((380pt, ybind), (380pt, yb - 10pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#down(380pt, yb - 8pt)
#tx(420pt, ybind - 6pt, [manifest.json 按摘要绑定模型、每个已归属和被引用的文件、每项物料和每个产物], fill: ochre, style: "italic")
// The build: one line to the fork, two media, one delivery.
#seg((84pt, yb), (370pt, yb), w: 4pt, c: green)
#seg((390pt, yb), (842pt, yb), w: 4pt, c: green)
#seg((842pt, yb), (864pt, yb - 40pt), (980pt, yb - 40pt), (1002pt, yb), w: 2.4pt, c: green)
#seg((842pt, yb), (864pt, yb + 40pt), (980pt, yb + 40pt), (1002pt, yb), w: 2.4pt, c: green)
#seg((1002pt, yb), (1406pt, yb), w: 4pt, c: green)
#ring(84pt, yb, r: 7pt, w: 2.6pt)
#ring(380pt, yb, r: 6pt, w: 2.2pt)
#tick(690pt, yb, h: 15pt)
#tick(800pt, yb, h: 15pt)
#tick(922pt, yb - 40pt, h: 13pt)
#tick(922pt, yb + 40pt, h: 13pt)
#disc(xbind, yb, r: 7pt)
#ring(1246pt, yb, r: 6pt, w: 2.2pt)
#ring(1406pt, yb, r: 7pt, w: 2.6pt)
#tx(96pt, yb - 14pt, [model.json], weight: "semibold")
#tx(392pt, yb - 14pt, [文件], weight: "semibold")
#txc(690pt, yb - 14pt, 90pt, [规划], weight: "semibold")
#txc(800pt, yb - 14pt, 90pt, [布局], weight: "semibold")
#txc(922pt, yb - 54pt, 90pt, [图册], weight: "semibold")
#tx(960pt, yb - 54pt, [每个视图一幅图版], fill: soft)
#txc(922pt, yb + 66pt, 90pt, [页面], weight: "semibold")
#tx(960pt, yb + 66pt, [作者的导读，引用区间已核验], fill: soft)
// The delivery's name stands below its stop, clear of the binding that rises from it.
#txc(xbind, yb + 28pt, 100pt, [交付物], weight: "semibold")
#txc(1246pt, yb - 14pt, 90pt, [验收], weight: "semibold")
#txc(1406pt, yb - 16pt, 90pt, [出版], weight: "semibold")
// What each owner contributes, under the line.
#let yn = 360pt
#tx(104pt, yn, [认领文件的组件、引用这些文件的关系、\ 视图、范围、总览和导读；\ 每个问题附其 JSON 路径], w: 226pt)
#seg((84pt, yb + 8pt), (84pt, 422pt), w: 1.5pt, c: green)
#ring(84pt, 430pt, r: 5pt, w: 2pt)
#tx(98pt, 435pt, [LikeC4，第 1 或第 2 版], weight: "semibold")
#tx(98pt, 452pt, [导入，或迁移到第 3 版], fill: soft)
#tx(346pt, yn, [经 Git 在钉定修订上读取，\ 每个文件归最具体的认领；\ 不拉取、不提示、不改动检出], w: 260pt)
#tx(636pt, yn, [视图排在同一套列栅格上，\ 连线只走水平或竖直方向；\ 图册由 Typst 以本社字体排版], w: 196pt)
#tx(1030pt, yn, [暂存于新目录，\ 完成后才重命名就位], w: 150pt)
#tx(1196pt, yn, [acceptance.json 写明审阅人和清单，只写一次], w: 150pt)
#tx(1376pt, yn, [root/id/version；只放已验收的交付物，从不覆盖另一份], w: 176pt)
// The supplies the publisher runs, each verified by digest before use.
#tx(636pt, 435pt, [保管中的物料], weight: "semibold")
#tx(788pt, 435pt, [Archify 3.2.0 · opentype.js 2.0.0 · Lucide 1.66.0], fill: soft)
#tx(788pt, 451pt, [Noto Sans CJK SC 2.004], fill: soft)
#tx(788pt, 467pt, [Source Serif 4 4.005 · Source Sans 3 3.052], fill: soft)

// Band 1 foot: how a view is drawn, and what a delivery holds.
#hrule(476pt, x1: 776pt)
#hrule(476pt, x0: 824pt)
#dl(48pt, 500pt, 104pt, 728pt, (
  ([行], [卡片排在同一套列栅格的共用行线上，每张与其文字同宽]),
  ([连线], [只走水平或竖直方向，位于行间的通道中]),
  ([重叠], [有重叠的布局绝不绘出]),
  ([拒绝], [没有布局能画出的视图予以拒绝，绝不缩小]),
))
#dl(824pt, 500pt, 104pt, 728pt, (
  ([图册], [一个 PDF/A-3a 与 PDF/UA-1 文件；各页另出 PNG，未指定时宽 2400 px]),
  ([页面], [一个 HTML 文件：作者的导读，或每个视图一个 Archify 面板]),
  ([总览], [作者以本社版式所作的编排，排入图册]),
  ([清单], [模型、每个已归属和被引用的文件、物料与产物的摘要]),
  ([验收], [审阅人、一段备注，以及它所验收的清单]),
))

// ── Band 2: what is refused, and what the publisher may touch ─────────────
#head(48pt, 594pt, [每一步宁可拒绝，也不降级])
#let refusals = (
  ([模型], [model\_invalid · model\_too\_large]),
  ([文件], [files\_unresolved · source\_read\_failed]),
  ([布局], [layout\_untidy · layout\_row\_too\_wide]),
  ([图册], [plate\_unfittable · edition\_text\_wider]),
  ([页面], [page\_layout\_refused · page\_refused]),
  ([导读], [guide\_missing · guide\_repository\_mismatch]),
  ([总览], [overview\_composition\_missing · overview\_text\_overlap]),
  ([交付物], [delivery\_exists · delivery\_changed]),
  ([验收], [acceptance\_exists · acceptance\_reviewer\_missing]),
  ([出版], [publish\_unaccepted · publish\_conflict]),
)
#for (k, (stage, codes)) in refusals.enumerate() {
  let x = if k < 5 { 48pt } else { 400pt }
  let b = 626pt + calc.rem(k, 5) * 18pt
  tx(x, b, stage, weight: "semibold")
  tx(x + 92pt, b, codes, fill: soft)
}
#tx(48pt, 734pt, [每次拒绝都列出每个问题及其路径，由调用方修正后重试；不会背着调用方缩小、猜测或重试。], w: 728pt, fill: soft)

#head(824pt, 594pt, [出版工具可以触及什么])
#dl(824pt, 626pt, 104pt, 728pt, (
  ([Git], [在钉定修订上读取，仅为检查导读才克隆；从不拉取，也不改动检出]),
  ([子进程], [Git、Archify 和 Typst 在白名单环境中运行]),
  ([LikeC4], [在 Node 的权限模型下解析，只读取它自己的物料]),
  ([输出], [一个新的交付物目录，完成后重命名就位]),
  ([字节], [在同一平台上，相同的模型、文件和版本产出相同的字节]),
))

// ── Band 3: commands, languages, and what it will not do ──────────────────
#hrule(776pt)
#head(48pt, 800pt, [命令])
#dl(48pt, 822pt, 70pt, 470pt, (
  ([check], [校验、绑定、编排并统计覆盖；\-\-against 列出重新钉定工作]),
  ([build], [写出交付物；随后是 accept 与 publish]),
  ([import], [从 LikeC4 写出模型；migrate 转换第 1、2 版]),
))
#head(560pt, 800pt, [以模型的语言])
#tx(560pt, 822pt, [英语、简体与繁体中文、西班牙语或韩语：出版工具自己的用语随模型而定。], w: 470pt)
#head(1072pt, 800pt, [它不做什么])
#tx(1072pt, 822pt, [从代码推断架构、判断模型是否属实，或判定一幅图足以出版], w: 480pt)

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([每个视图都有其图版；交互页面即导读，每项陈述都注明出处。])
