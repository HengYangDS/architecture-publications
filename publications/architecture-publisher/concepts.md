# Architecture Publisher: term renderings

The renderings this work fixes before translation, used everywhere under `zh/`. Source names the file of
`architecture-publisher` at v0.16.0 (`c991457`) that defines or uses the term; the edition's own
Chinese words come from `src/edition/words.mjs` and `src/locale.mjs`. Renderings marked "approved" are the
owner-approved shared renderings.

| English                                                     | 中文                                             | Source                                                                           |
| ----------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------------- |
| Architecture Publisher, archpub                             | Architecture Publisher, archpub (kept)           | `package.json`                                                                   |
| the publisher                                               | 出版工具                                         | `src/edition/words.mjs` (published → 出版工具)                                   |
| Architecture Model, model                                   | 架构模型, 模型                                   | `src/edition/words.mjs`                                                          |
| print edition, edition                                      | 图册 (the edition's name: 架构图册)              | `src/edition/words.mjs`                                                          |
| plate                                                       | 图版                                             | `src/edition/words.mjs`                                                          |
| overview                                                    | 总览                                             | `src/edition/words.mjs`                                                          |
| state (an overview); the overview a model states            | 写明; 模型写明的总览                             | `src/model/overview.mjs`                                                         |
| course, step, block (of a stated overview)                  | 主线, 步骤, 区块                                 | `src/model/overview.mjs`                                                         |
| further course (a block that is a course of its own)        | 副线                                             | `src/model/overview.mjs`                                                         |
| scope                                                       | 范围                                             | `src/edition/words.mjs`, `src/sources/scope.mjs`                                 |
| Files (the heading of a narrowed plate's file list)         | 文件位置                                         | `src/edition/words.mjs` (places)                                                 |
| claim (a statement the page cites)                          | 陈述                                             | `src/edition/words.mjs` (readingNote)                                            |
| statement (a component, relation or group)                  | 陈述                                             | `src/pinned/reader.mjs`, `src/locale.mjs`                                        |
| each cited by its SHA-256                                   | 各附 SHA-256                                     | `src/edition/words.mjs` (writtenFrom)                                            |
| view                                                        | 视图                                             | `src/locale.mjs`, `src/plan/views.mjs`                                           |
| component                                                   | 组件                                             | `src/locale.mjs`                                                                 |
| relation                                                    | 关系                                             | `src/locale.mjs`                                                                 |
| group                                                       | 分组                                             | `src/locale.mjs`                                                                 |
| words (the publisher's own)                                 | 用语                                             | `src/locale.mjs`, `src/edition/words.mjs`                                        |
| page (the Archify page)                                     | 页面                                             | `src/map/archify.mjs`                                                            |
| generated page (no guide named)                             | 自动生成的页面                                   | `src/projection.mjs`, `src/map/explainer.mjs`                                    |
| interactive page                                            | 交互页面                                         | `src/map/explainer.mjs`                                                          |
| guide                                                       | 导读                                             | `src/map/guide.mjs`                                                              |
| explainer                                                   | 讲解页                                           | `src/map/explainer.mjs`                                                          |
| panel                                                       | 面板                                             | `src/map/explainer.mjs`                                                          |
| draft                                                       | 草稿                                             | `src/map/guide.mjs`                                                              |
| author                                                      | 作者                                             | `src/model/load.mjs`, `src/overview/house.typ`                                   |
| reviewer                                                    | 审阅者                                           | `src/delivery.mjs`                                                               |
| acceptance, accept                                          | 验收 (approved)                                  | `src/delivery.mjs`                                                               |
| publish, publication                                        | 出版                                             | `src/delivery.mjs`                                                               |
| publication root                                            | 出版根目录                                       | `src/delivery.mjs`, `src/cli/run.mjs`                                            |
| release, released                                           | 发布 (approved)                                  | `package.json`, `src/edition/words.mjs`                                          |
| delivery                                                    | 交付物                                           | `src/build.mjs`, `src/delivery.mjs`                                              |
| manifest                                                    | 清单                                             | `src/manifest.mjs`                                                               |
| package manifest                                            | 包清单                                           | `package.json`                                                                   |
| supply, vendored supply                                     | 物料, 随附物料                                   | `src/supply.mjs`                                                                 |
| supply manifest                                             | 物料清单                                         | `src/supply.mjs`                                                                 |
| in custody                                                  | 随附物料及版本 (the block title)                 | this work's overview block only; the repository says "verify" (`src/supply.mjs`) |
| digest                                                      | 哈希摘要                                         | `src/build.mjs`                                                                  |
| artifact                                                    | 产物                                             | `src/build.mjs`, `src/delivery.mjs`                                              |
| stage (kind of component)                                   | 阶段                                             | this work's `model.json` kinds                                                   |
| stage (verb: write before renaming)                         | 暂存                                             | `src/build.mjs`, `src/edition/typeset.mjs`                                       |
| rename into place                                           | 重命名就位                                       | `src/build.mjs`                                                                  |
| build                                                       | 构建                                             | `src/build.mjs`                                                                  |
| builder                                                     | 构建器                                           | `src/build.mjs`                                                                  |
| importer, import                                            | 导入器, 导入                                     | `src/importers/likec4.mjs`                                                       |
| migration, migrate                                          | 迁移                                             | `src/importers/model.mjs`                                                        |
| loader, load                                                | 加载器, 加载                                     | `src/model/load.mjs`                                                             |
| version (model format)                                      | 第 N 版                                          | `src/importers/model.mjs`                                                        |
| source catalog                                              | 来源清单                                         | `src/importers/model.mjs`                                                        |
| workspace (LikeC4)                                          | 工作空间                                         | `src/importers/likec4.mjs`                                                       |
| sandboxed worker                                            | 沙箱工作进程                                     | `src/importers/likec4.mjs`                                                       |
| child, child process                                        | 子进程                                           | `src/environment.mjs`                                                            |
| allowlisted environment                                     | 白名单内的环境变量                               | `src/environment.mjs`                                                            |
| permission model (Node)                                     | 权限模型                                         | `src/importers/likec4.mjs`                                                       |
| claim (a component's path claim)                            | 认领 (verb); 认领规则 (noun)                     | `src/sources/bind.mjs`, `src/model/schema.json`                                  |
| path rule                                                   | 路径规则                                         | `src/model/schema.json` (claim patterns); the phrase is this work's              |
| owner (of a file); a component's own files                  | 所属组件; 名下文件                               | `src/sources/bind.mjs`                                                           |
| owner (of meaning, evidence, form, acceptance)              | 归属方 (各归一方)                                | this work's overview (`claim`)                                                   |
| owned                                                       | 已归属                                           | `src/sources/coverage.mjs`                                                       |
| uncovered                                                   | 未覆盖                                           | `src/sources/coverage.mjs`                                                       |
| excluded                                                    | 已排除                                           | `src/sources/scope.mjs`                                                          |
| coverage                                                    | 覆盖                                             | `src/sources/coverage.mjs`                                                       |
| bind, binding                                               | 绑定                                             | `src/sources/bind.mjs`                                                           |
| pin, pinned revision                                        | 固定, 固定的提交                                 | `src/build.mjs`, `src/map/guide.mjs`                                             |
| re-pin                                                      | 更换固定的提交                                   | `src/sources/worklist.mjs`                                                       |
| worklist                                                    | 待办清单 (re-pin worklist: 更换提交的待办清单)   | `src/sources/worklist.mjs`                                                       |
| revision                                                    | 提交 (as commit; the foot says 提交)             | `src/edition/words.mjs` (foot)                                                   |
| repository                                                  | 仓库 (approved)                                  | `src/edition/words.mjs`                                                          |
| commit                                                      | 提交 (approved)                                  | `src/sources/worklist.mjs`                                                       |
| checkout                                                    | 检出目录                                         | `src/build.mjs`, `src/map/guide.mjs`                                             |
| clone                                                       | 克隆                                             | `src/map/guide.mjs`                                                              |
| fetch                                                       | 抓取                                             | `src/sources/git.mjs`                                                            |
| diff                                                        | 比较                                             | `src/sources/worklist.mjs`                                                       |
| compare (two deliveries)                                    | 比较 (`archpub compare` kept)                    | `src/delivery.mjs`                                                               |
| glob                                                        | glob (kept)                                      | `src/sources/scope.mjs`                                                          |
| cite, citation                                              | 引用                                             | `src/build.mjs`, `src/sources/worklist.mjs`                                      |
| cited range                                                 | 引用区间                                         | `src/map/guide.mjs`                                                              |
| validate                                                    | 校验                                             | `src/model/load.mjs`                                                             |
| verify                                                      | 核验                                             | `src/supply.mjs`, `src/delivery.mjs`                                             |
| check                                                       | 检查 (`archpub check` kept)                      | `src/cli/run.mjs`, `src/overview/checks.mjs`                                     |
| refuse, refusal                                             | 拒绝                                             | `src/refusal.mjs`                                                                |
| degrade                                                     | 降级                                             | this work's overview block only                                                  |
| problem                                                     | 错误 (问题 is a plate's question)                | `src/refusal.mjs`                                                                |
| caller                                                      | 调用方                                           | `src/refusal.mjs`                                                                |
| reading plan, plan                                          | 阅读规划, 规划                                   | `src/plan/views.mjs`                                                             |
| layout, lay out                                             | 布局                                             | `src/layout/grid.mjs`                                                            |
| layout engine                                               | 布局引擎                                         | this work's `model.json` kinds; engine in `src/poster/plate.mjs`                 |
| grid (the one column lattice cards are placed on)           | 网格                                             | `src/layout/grid.mjs`, `src/layout/placement.mjs`                                |
| row                                                         | 行                                               | `src/layout/rows.mjs`                                                            |
| tier                                                        | 层级                                             | `src/layout/rows.mjs`, `src/model/schema.json`                                   |
| layer                                                       | 分层                                             | `src/layout/rows.mjs`                                                            |
| placement, place                                            | 摆放                                             | `src/layout/placement.mjs`                                                       |
| position                                                    | 位置                                             | `src/layout/placement.mjs`                                                       |
| card                                                        | 卡片                                             | `src/poster/part.mjs`, `src/edition/words.mjs` (readingNote)                     |
| wire                                                        | 连线                                             | `src/layout/channels.mjs`                                                        |
| bus                                                         | 总线                                             | `src/layout/channels.mjs`                                                        |
| corridor                                                    | 走廊                                             | `src/layout/channels.mjs`                                                        |
| channel                                                     | 通道                                             | `src/layout/channels.mjs`                                                        |
| channel solver, route                                       | 通道求解器, 布线                                 | `src/layout/channel-solver/search.mjs`                                           |
| neatness measure, measure                                   | 整洁度量, 度量                                   | `src/layout/measure.mjs`                                                         |
| overlap                                                     | 重叠                                             | `src/layout/measure.mjs`, `src/overview/checks.mjs`                              |
| medium, media                                               | 媒介                                             | `src/kinds.mjs`                                                                  |
| compose, composer (of plates)                               | 编排, 编排器                                     | `src/poster/compose/plates.mjs`                                                  |
| composition (an overview as a Typst file; retired)          | 编排                                             | `src/model/overview.mjs` (the refusal of a composition)                          |
| body (the edition's)                                        | 正文区                                           | `src/overview/house.typ`                                                         |
| balance gate                                                | 平衡检查                                         | `src/poster/compose/gates.mjs`                                                   |
| typeface, face                                              | 字体                                             | `src/poster/text.mjs`                                                            |
| house class (a Typst class)                                 | 版式类 (类 as in 文档类)                         | `src/overview/house.typ`                                                         |
| house faces (Source Serif 4, Source Sans 3)                 | 专用字体; in full 出版工具的专用字体             | `renderers/house/supply/supply.json`, `src/overview/glyphs.mjs`                  |
| tokens (house tokens)                                       | 版式设计令牌                                     | `src/overview/house.typ`, `src/house.json`                                       |
| typeset, set                                                | 排版                                             | `src/edition/words.mjs` (typeset → 排版)                                         |
| record (the edition's)                                      | 图册记录                                         | `src/edition/record.mjs`                                                         |
| render                                                      | 渲染                                             | `src/edition/typeset.mjs`                                                        |
| break lines                                                 | 断行                                             | `src/breaks.mjs`                                                                 |
| text box                                                    | 文本框                                           | `src/overview/checks.mjs`                                                        |
| glyph                                                       | 字形                                             | `src/overview/glyphs.mjs`                                                        |
| ring (the mark of a station on a stated overview)           | 圆环                                             | `src/overview/drawn.typ`, `src/overview/checks.mjs`                              |
| kind                                                        | 类型                                             | `src/kinds.mjs`                                                                  |
| icon                                                        | 图标                                             | `src/icons.mjs`                                                                  |
| command line                                                | 命令行                                           | `src/cli/run.mjs`                                                                |
| exits (detail), exit code; usage (exit 2)                   | 退出码; 用法错误                                 | `src/cli/run.mjs`                                                                |
| report, mark (of a command's report)                        | 报告, 标记                                       | `src/cli/report.mjs`                                                             |
| external tool                                               | 外部工具                                         | this work's `model.json` kinds; external in `src/kinds.mjs`                      |
| delivery store                                              | 交付物存储                                       | this work's `model.json` kinds; root in `src/delivery.mjs`                       |
| OpenSpec Change                                             | OpenSpec 正式变更 (approved)                     | `openspec/` (outside the scope)                                                  |
| work (a publication)                                        | 作品                                             | this work's `guide/guide.archify.md`                                             |
| summary (a view's)                                          | 概述 (哈希摘要 is digest)                        | `docs/reference/model.md` (Views)                                                |
| reading (a plate's: summary and where each component lives) | 说明栏                                           | `docs/reference/operations.md`, `src/poster/compose/plates.mjs`                  |
| summary above its figure, full width                        | 图上方的概述, 全宽                               | `docs/reference/operations.md`, `src/poster/compose/plates.mjs`                  |
| type step                                                   | 字号档                                           | `docs/reference/operations.md`, `README.md`                                      |
| type sizes (house class)                                    | 字号 (四档字号)                                  | `src/overview/house.typ`, `src/house.json`                                       |
| palette                                                     | 配色                                             | `docs/reference/model.md` (Parts and palette)                                    |
| the overview's page (16:9)                                  | 版面 (页面 is the Archify page)                  | `docs/reference/model.md` (Overview)                                             |
| text metrics (Archify's)                                    | 文字度量                                         | `docs/reference/operations.md`                                                   |
| row wrapping                                                | 折行                                             | `docs/reference/operations.md`, `src/poster/compose/plates.mjs`                  |
| crossing, bend, unused column                               | 交叉, 弯折, 空列                                 | `docs/reference/operations.md`                                                   |
| route defect                                                | 布线缺陷                                         | `docs/reference/operations.md`, `docs/product-contract.md`                       |
| lane (beside the cards)                                     | 侧道                                             | `docs/reference/operations.md`                                                   |
| diagonal, shared segment, touching label                    | 斜线, 共用线段, 相触的标签                       | `docs/reference/operations.md`                                                   |
| reject (a layout)                                           | 拒绝 (as in `model.json`: measure 拒绝 任何重叠) | `docs/reference/operations.md`                                                   |
| centring, tier-label column                                 | 居中, 层级标签列                                 | `docs/reference/operations.md`                                                   |
| blank rectangle, blank band, hole, centre of mass           | 空白矩形, 空白带, 空洞, 重心                     | `src/poster/compose/gates.mjs`                                                   |
| missed gate                                                 | 未通过的检查                                     | `src/poster/compose/gates.mjs`; this work's `model.json` (plates)                |
| text run                                                    | 文字串                                           | `docs/reference/operations.md`                                                   |
| title page, contents                                        | 扉页, 目录                                       | `docs/reference/operations.md`; 目录 from `src/edition/words.mjs`                |
| index (the parts by name, closing the edition)              | 索引                                             | `src/edition/words.mjs`, `docs/reference/operations.md`                          |
| page images                                                 | 各页图像                                         | `docs/reference/operations.md`, `src/edition/typeset.mjs`                        |
| figure files (a plate's figure and key alone)               | 单独成图                                         | `src/edition/typeset.mjs`, `docs/reference/operations.md`                        |
| transparent ground                                          | 透明底                                           | `docs/reference/operations.md`, `src/edition/typeset.mjs`                        |
| admit (a view)                                              | 接纳                                             | `src/plan/views.mjs`                                                             |
| native diagram                                              | 原生图                                           | `src/map/explainer.mjs`                                                          |
| scaffold, starting draft                                    | 生成初稿, 初稿 (`archpub scaffold` kept)         | `docs/reference/operations.md`                                                   |
| finalize (the explainer)                                    | 定稿                                             | `src/map/explainer.mjs`                                                          |
| receipts (Archify's)                                        | 回执                                             | `src/map/explainer.mjs`                                                          |
| strict writing (checks)                                     | 严格写作检查                                     | `src/map/guide.mjs`                                                              |
| showcase (quality)                                          | showcase (kept)                                  | `src/map/guide.mjs`                                                              |
| temporary clone                                             | 临时克隆                                         | `src/map/guide.mjs`                                                              |
| tracked file; Git object store                              | 已跟踪文件; Git 对象库                           | `src/sources/scope.mjs`, `src/sources/git.mjs`                                   |
| lock (the edition's, as a lockfile)                         | 锁文件                                           | `docs/reference/model.md`                                                        |
| shifted, moved, touched, gone (a cited range)               | 偏移, 移动, 触及, 消失                           | `src/sources/worklist.mjs`                                                       |
| rasterizer (deleted at this pin)                            | 栅格化器                                         | this work's `guide/guide.archify.md`                                             |
| details, status (of a component)                            | 详情, 状态                                       | `docs/reference/operations.md`                                                   |
| host path, user name                                        | 主机路径, 用户名                                 | `docs/reference/operations.md`                                                   |
| marks (`edition.marks`, retired in 0.15.0)                  | 画法                                             | `src/model/edition.mjs` (the refusal of the retired field)                       |
| strip (the files a part owns, a region of its card)         | 条带                                             | `docs/reference/model.md`, `src/poster/strip.mjs`                                |
| one scale for the edition                                   | 全册同一比例                                     | `src/poster/strip.mjs`                                                           |
| indigo, persimmon, soot, patina (palettes)                  | 靛蓝, 柿漆, 松烟, 铜绿                           | `src/house.json`                                                                 |
| contrast, lightness, chroma, hue                            | 对比度, 明度, 彩度, 色相                         | `src/model/edition.mjs`                                                          |
| age band, the three age bands                               | 新旧分档, 新旧三档                               | `src/facts/ages.mjs`; the rendering is this work's                               |
| last change (of a file)                                     | 最近一次改动                                     | `src/sources/bind.mjs`                                                           |
| measured fact, fact                                         | 测得的事实, 事实                                 | `src/facts/catalogue.mjs`; 测得, 事实 from `src/locale.mjs`                      |
| property, subject, unit (of a fact)                         | 属性, 所属对象, 单位                             | `src/facts/catalogue.mjs`                                                        |
| share (a file's, of its part's bytes)                       | 占比                                             | `src/facts/edition.mjs`                                                          |
| data (the pinned edition as data)                           | 数据                                             | `src/pinned/data.mjs`; 数据 from `src/locale.mjs`                                |
| reader file                                                 | 读者文件                                         | `src/pinned/reader.mjs`; 读者文件 from `src/locale.mjs`                          |
| evidence table, row of evidence                             | 证据表, 一行证据                                 | `src/pinned/evidence.mjs`; 证据表 from `src/locale.mjs`                          |
| shallow clone                                               | 浅克隆                                           | `src/sources/bind.mjs`                                                           |
| count (of the files a relation cites)                       | 文件数                                           | `src/poster/lines.mjs`, `src/locale.mjs`                                         |
| colophon page (an acceptance adds it)                       | 验收页                                           | `src/edition/colophon.mjs`; titled 验收记录 in `src/edition/words.mjs`           |
| acceptance record                                           | 验收记录                                         | `src/edition/words.mjs` (colophon)                                               |
| acceptance slip, slip                                       | 签条                                             | `src/edition/colophon.typ`                                                       |
| acceptance mark, round mark                                 | 印记, 圆形印记                                   | `src/edition/colophon.typ`; the rendering is this work's                         |
| cinnabar                                                    | 朱砂色                                           | `src/edition/colophon.typ`                                                       |
| in-toto Statement; subject, predicate                       | in-toto Statement (kept); 对象, 谓词             | `src/delivery.mjs`                                                               |
| sign, signature, signer                                     | 签名, 签名者                                     | `src/delivery.mjs`                                                               |
| signing key, fingerprint                                    | 签名密钥, 指纹                                   | `src/edition/words.mjs`, `src/delivery.mjs`                                      |
| key (a plate's)                                             | 图例                                             | `docs/reference/operations.md`, `src/overview/house.typ`                         |
| mark, label (of a key's entry)                              | 标记, 标签                                       | `src/overview/house.typ`                                                         |
| baseline                                                    | 基线                                             | `src/overview/house.typ`                                                         |
| hub (the part a view's relations lead to)                   | 枢纽                                             | `src/facts/view.mjs`; the rendering is this work's                               |
| arrowhead                                                   | 箭头                                             | `src/poster/lines.mjs`                                                           |
| written without spaces between words                        | 词间不留空格                                     | `src/locale.mjs`                                                                 |
| justified paragraph; flush left                             | 两端对齐的段落; 左对齐                           | `src/poster/spread.mjs`                                                          |
| measure (the width lines wrap to)                           | 行宽                                             | `src/poster/spread.mjs`                                                          |
| spread (a line to its measure)                              | 撑满                                             | `src/poster/spread.mjs`, `src/overview/house.typ`                                |
| slack (of a line short of its measure)                      | 余量                                             | `src/poster/spread.mjs`                                                          |
| pair kerning                                                | 字偶间距                                         | `src/poster/kerning.mjs`, `src/poster/text.mjs`                                  |
