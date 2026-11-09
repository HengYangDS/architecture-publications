# Architecture Publisher: concept renderings (zh-CN)

The renderings this work fixes before translation, used everywhere in `model.json` and `overview.typ`. Source names
the file at `548637cc` that defines or uses the term; the edition's own Chinese words come from
`src/edition/words.mjs` and `src/locale.mjs`. Renderings marked "approved" are the owner-approved shared renderings.

| English                                                     | 中文                                             | Source                                                                           |
| ----------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------------- |
| Architecture Publisher, archpub                             | Architecture Publisher, archpub (kept)           | `package.json`                                                                   |
| the publisher                                               | 出版工具                                         | `src/edition/words.mjs` (published → 出版工具)                                   |
| Architecture Model, model                                   | 架构模型, 模型                                   | `src/edition/words.mjs`                                                          |
| print edition, edition                                      | 图册 (the edition's name: 架构图册)              | `src/edition/words.mjs`                                                          |
| plate                                                       | 图版                                             | `src/edition/words.mjs`                                                          |
| overview                                                    | 总览                                             | `src/edition/words.mjs`                                                          |
| scope                                                       | 范围                                             | `src/edition/words.mjs`, `src/sources/scope.mjs`                                 |
| Where it lives                                              | 文件位置                                         | `src/edition/words.mjs`                                                          |
| claim (a statement the page cites)                          | 陈述                                             | `src/edition/words.mjs` (readingNote)                                            |
| each cited by its SHA-256                                   | 各附 SHA-256                                     | `src/edition/words.mjs` (readValue)                                              |
| view                                                        | 视图                                             | `src/locale.mjs`, `src/plan/views.mjs`                                           |
| component                                                   | 组件                                             | `src/locale.mjs`                                                                 |
| relation                                                    | 关系                                             | `src/locale.mjs`                                                                 |
| group                                                       | 分组                                             | `src/locale.mjs`                                                                 |
| words (the publisher's own)                                 | 用语                                             | `src/locale.mjs`, `src/edition/words.mjs`                                        |
| page (the Archify page)                                     | 页面                                             | `src/map/archify.mjs`                                                            |
| interactive page                                            | 交互页面                                         | `src/map/explainer.mjs`                                                          |
| guide                                                       | 导读                                             | `src/map/guide.mjs`                                                              |
| explainer                                                   | 讲解页                                           | `src/map/explainer.mjs`                                                          |
| panel                                                       | 面板                                             | `src/map/explainer.mjs`                                                          |
| draft                                                       | 草稿                                             | `src/map/guide.mjs`                                                              |
| author                                                      | 作者                                             | `src/model/load.mjs`, `src/overview/house.typ`                                   |
| reviewer                                                    | 审阅人                                           | `src/delivery.mjs`                                                               |
| acceptance, accept                                          | 验收 (approved)                                  | `src/delivery.mjs`                                                               |
| publish, publication                                        | 出版                                             | `src/delivery.mjs`                                                               |
| publication root                                            | 出版根目录                                       | `src/delivery.mjs`, `src/cli/run.mjs`                                            |
| release, released                                           | 发布 (approved)                                  | `package.json`, `src/edition/words.mjs`                                          |
| delivery                                                    | 交付物                                           | `src/build.mjs`, `src/delivery.mjs`                                              |
| manifest                                                    | 清单                                             | `src/build.mjs`                                                                  |
| package manifest                                            | 包清单                                           | `package.json`                                                                   |
| supply, vendored supply                                     | 物料, 随附物料                                   | `src/supply.mjs`                                                                 |
| supply manifest                                             | 物料清单                                         | `src/supply.mjs`                                                                 |
| in custody                                                  | 保管中                                           | this work's `overview.typ` only; the repository says "verify" (`src/supply.mjs`) |
| digest                                                      | 摘要                                             | `src/build.mjs`                                                                  |
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
| source catalog                                              | 来源目录                                         | `src/importers/model.mjs`                                                        |
| workspace (LikeC4)                                          | 工作空间                                         | `src/importers/likec4.mjs`                                                       |
| sandboxed worker                                            | 沙箱工作进程                                     | `src/importers/likec4.mjs`                                                       |
| child, child process                                        | 子进程                                           | `src/environment.mjs`                                                            |
| allowlisted environment                                     | 白名单环境                                       | `src/environment.mjs`                                                            |
| permission model (Node)                                     | 权限模型                                         | `src/importers/likec4.mjs`                                                       |
| claim (a component's path claim)                            | 认领                                             | `src/sources/bind.mjs`, `src/model/schema.json`                                  |
| path rule                                                   | 路径规则                                         | `src/model/schema.json` (claim patterns); the phrase is this work's              |
| owner (of a file)                                           | 所属组件                                         | `src/sources/bind.mjs`                                                           |
| owner (of meaning, evidence, form, acceptance)              | 归属方 (各归一方)                                | composition (`overview.typ`)                                                     |
| owned                                                       | 已归属                                           | `src/sources/coverage.mjs`                                                       |
| uncovered                                                   | 未覆盖                                           | `src/sources/coverage.mjs`                                                       |
| excluded                                                    | 已排除                                           | `src/sources/scope.mjs`                                                          |
| coverage                                                    | 覆盖                                             | `src/sources/coverage.mjs`                                                       |
| bind, binding                                               | 绑定                                             | `src/sources/bind.mjs`                                                           |
| pin, pinned revision                                        | 固定, 固定的修订                                 | `src/build.mjs`, `src/map/guide.mjs`                                             |
| re-pin                                                      | 重新固定                                         | `src/sources/worklist.mjs`                                                       |
| worklist                                                    | 工作清单                                         | `src/sources/worklist.mjs`                                                       |
| revision                                                    | 修订                                             | `src/edition/words.mjs` (foot)                                                   |
| repository                                                  | 仓库 (approved)                                  | `src/edition/words.mjs`                                                          |
| commit                                                      | 提交 (approved)                                  | `src/sources/worklist.mjs`                                                       |
| checkout                                                    | 检出 (approved)                                  | `src/build.mjs`, `src/map/guide.mjs`                                             |
| clone                                                       | 克隆                                             | `src/map/guide.mjs`                                                              |
| fetch                                                       | 拉取                                             | `src/sources/git.mjs`                                                            |
| diff                                                        | 比较                                             | `src/sources/worklist.mjs`                                                       |
| glob                                                        | glob (kept)                                      | `src/sources/scope.mjs`                                                          |
| cite, citation                                              | 引用                                             | `src/build.mjs`, `src/sources/worklist.mjs`                                      |
| cited range                                                 | 引用区间                                         | `src/map/guide.mjs`                                                              |
| validate                                                    | 校验                                             | `src/model/load.mjs`                                                             |
| verify                                                      | 核验                                             | `src/supply.mjs`, `src/delivery.mjs`                                             |
| check                                                       | 检查 (`archpub check` kept)                      | `src/cli/run.mjs`, `src/overview/checks.mjs`                                     |
| refuse, refusal                                             | 拒绝                                             | `src/refusal.mjs`                                                                |
| degrade                                                     | 降级                                             | this work's `overview.typ` only                                                  |
| problem                                                     | 问题                                             | `src/refusal.mjs`                                                                |
| caller                                                      | 调用方                                           | `src/refusal.mjs`                                                                |
| reading plan, plan                                          | 阅读规划, 规划                                   | `src/plan/views.mjs`                                                             |
| layout, lay out                                             | 布局                                             | `src/layout/grid.mjs`                                                            |
| layout engine                                               | 布局引擎                                         | this work's `model.json` kinds; engine in `src/poster/plate.mjs`                 |
| grid                                                        | 网格                                             | `src/layout/grid.mjs`                                                            |
| column lattice, one column lattice                          | 列栅格, 同一套列栅格                             | `src/layout/placement.mjs`                                                       |
| row                                                         | 行                                               | `src/layout/rows.mjs`                                                            |
| tier                                                        | 层级                                             | `src/layout/rows.mjs`, `src/model/schema.json`                                   |
| layer                                                       | 分层                                             | `src/layout/rows.mjs`                                                            |
| placement, place                                            | 摆放                                             | `src/layout/placement.mjs`                                                       |
| position                                                    | 位置                                             | `src/layout/placement.mjs`                                                       |
| card                                                        | 卡片                                             | `src/edition/words.mjs` (readingNote)                                            |
| wire                                                        | 连线                                             | `src/layout/channels.mjs`                                                        |
| bus                                                         | 总线                                             | `src/layout/channels.mjs`                                                        |
| corridor                                                    | 走廊                                             | `src/layout/channels.mjs`                                                        |
| channel                                                     | 通道                                             | `src/layout/channels.mjs`                                                        |
| channel solver, route                                       | 通道求解器, 布线                                 | `src/layout/channel-solver/search.mjs`                                           |
| neatness measure, measure                                   | 整洁度量, 度量                                   | `src/layout/measure.mjs`                                                         |
| overlap                                                     | 重叠                                             | `src/layout/measure.mjs`, `src/overview/checks.mjs`                              |
| medium, media                                               | 媒介                                             | `src/kinds.mjs`                                                                  |
| compose, composition, composer                              | 编排, 编排器                                     | `src/poster/compose/plates.mjs`, `src/overview/lint.mjs`                         |
| body (the edition's)                                        | 正文区                                           | `src/overview/house.typ`                                                         |
| balance gate                                                | 平衡门槛                                         | `src/poster/compose/gates.mjs`                                                   |
| typeface, face                                              | 字体                                             | `src/poster/text.mjs`                                                            |
| house class                                                 | 版式类                                           | `src/overview/house.typ`                                                         |
| house faces                                                 | 版式字体                                         | `src/overview/glyphs.mjs`                                                        |
| tokens (house tokens)                                       | 版式设计令牌                                     | `src/overview/house.typ`, `src/house.json`                                       |
| typeset, set                                                | 排版                                             | `src/edition/words.mjs` (typeset → 排版)                                         |
| record (the edition's)                                      | 图册记录                                         | `src/edition/record.mjs`                                                         |
| render                                                      | 渲染                                             | `src/edition/typeset.mjs`                                                        |
| break lines                                                 | 断行                                             | `src/breaks.mjs`                                                                 |
| lint (of a composition)                                     | 代码规范                                         | `src/overview/lint.mjs`                                                          |
| text box                                                    | 文本框                                           | `src/overview/checks.mjs`                                                        |
| glyph                                                       | 字形                                             | `src/overview/glyphs.mjs`                                                        |
| kind                                                        | 类型                                             | `src/kinds.mjs`                                                                  |
| icon                                                        | 图标                                             | `src/icons.mjs`                                                                  |
| command line                                                | 命令行                                           | `src/cli/run.mjs`                                                                |
| exits (detail), exit code; usage (exit 2)                   | 退出码; 用法错误                                 | `src/cli/run.mjs`                                                                |
| external tool                                               | 外部工具                                         | this work's `model.json` kinds; external in `src/kinds.mjs`                      |
| delivery store                                              | 交付物存储                                       | this work's `model.json` kinds; root in `src/delivery.mjs`                       |
| OpenSpec change                                             | OpenSpec 正式变更 (approved)                     | `openspec/` (outside the scope)                                                  |
| work (a publication)                                        | 作品                                             | this work's `guide/guide.archify.md`                                             |
| summary (a view's)                                          | 概述 (摘要 is digest)                            | `docs/reference/model.md` (Views)                                                |
| reading (a plate's: summary and where each component lives) | 说明栏                                           | `docs/reference/operations.md`, `src/poster/compose/plates.mjs`                  |
| type step                                                   | 字号档                                           | `docs/reference/operations.md`, `README.md`                                      |
| type sizes (house class)                                    | 字号 (四档字号)                                  | `docs/reference/model.md` (Overview)                                             |
| palette                                                     | 配色                                             | `docs/reference/model.md` (Overview)                                             |
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
| missed gate                                                 | 未通过的门槛                                     | `src/poster/compose/gates.mjs`; this work's `model.json` (plates)                |
| text run                                                    | 文字串                                           | `docs/reference/operations.md`                                                   |
| title page, contents                                        | 扉页, 目录                                       | `docs/reference/operations.md`; 目录 from `src/edition/words.mjs`                |
| page images                                                 | 各页图像                                         | `docs/reference/operations.md`, `src/edition/typeset.mjs`                        |
| admit (a view)                                              | 接纳                                             | `src/plan/views.mjs`                                                             |
| native diagram                                              | 原生图                                           | `src/map/explainer.mjs`                                                          |
| scaffold, starting draft                                    | 生成初稿, 初稿 (`archpub scaffold` kept)         | `docs/reference/operations.md`                                                   |
| finalize (the explainer)                                    | 定稿                                             | `src/map/explainer.mjs`                                                          |
| receipts (Archify's)                                        | 回执                                             | `src/map/explainer.mjs`                                                          |
| strict writing (checks)                                     | 严格写作检查                                     | `src/map/guide.mjs`                                                              |
| showcase (quality)                                          | showcase (kept)                                  | `src/map/guide.mjs`                                                              |
| temporary clone                                             | 临时克隆                                         | `src/map/guide.mjs`                                                              |
| tracked file; Git object store                              | 已跟踪文件; Git 对象库                           | `src/sources/scope.mjs`, `src/sources/git.mjs`                                   |
| house rule                                                  | 版式规则                                         | `src/overview/lint.mjs`                                                          |
| lock (the edition's, as a lockfile)                         | 锁                                               | `docs/reference/model.md`                                                        |
| shifted, moved, touched, gone (a cited range)               | 偏移, 移动, 触及, 消失                           | `src/sources/worklist.mjs`                                                       |
| rasterizer (deleted at this pin)                            | 栅格化器                                         | this work's `guide/guide.archify.md`                                             |
| details, status (of a component)                            | 详情, 状态                                       | `docs/reference/operations.md`                                                   |
| host path, user name                                        | 主机路径, 用户名                                 | `docs/reference/operations.md`                                                   |
