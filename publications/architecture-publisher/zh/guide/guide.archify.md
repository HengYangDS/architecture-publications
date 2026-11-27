# Architecture Publisher 如何把架构模型变成图册和页面？ {#guide}

`archpub` 读取一个模型，按固定的提交绑定组件认领的文件，再规划视图。每个视图都布局在同一套网格上，编排成一幅图版；图册由 Typst 排版，另交付一个 Archify 页面。[](source:contract-processing)清单把每个产物绑定到各自的输入；交付物要先由一位具名审阅者验收，才能出版。[](source:contract-product)[](source:contract-acceptance)

- [模型是含义的唯一来源](block:p-model)：出版工具绝不从代码推断架构。[](source:model-meaning)[](source:contract-meaning)
- [对 Git 只读不写](block:p-files)：每个文件都取自固定的提交，检出目录始终不变。[](source:model-repo)
- [有重叠的布局绝不画出](block:p-layout)；任何布局都画不出的视图会被拒绝，不会缩小。[](source:contract-layout-floor)
- [只出版已验收的交付物](block:p-accept)，也绝不覆盖另一份不同的交付物。[](source:contract-acceptance)

@answer scope="Architecture Publisher v0.21.0 · 提交 888880d · 源码与项目自身的文档 · 更换提交的计数测于 2026-11-18"
@meta locale=zh-CN style=editorial
@source contract-product title="产品" path="docs/product-contract.md" lines=13:21
@source contract-meaning title="含义与形式归谁" path="docs/product-contract.md" lines=38:43
@source contract-processing title="一次构建的六步" path="docs/product-contract.md" lines=73:86
@source contract-bytes title="相同输入，相同字节" path="docs/product-contract.md" lines=88:90
@source contract-guide title="导读与自动生成的页面" path="docs/product-contract.md" lines=135:145
@source contract-layout-floor title="卡片、连线，绝无重叠" path="docs/product-contract.md" lines=158:165
@source contract-acceptance title="验收与出版" path="docs/product-contract.md" lines=177:181
@source contract-counts title="只计数，不拒绝" path="docs/product-contract.md" lines=192:194
@source model-meaning title="含义的唯一来源" path="docs/reference/model.md" lines=11:17
@source model-fields title="顶层字段" path="docs/reference/model.md" lines=61:89
@source model-unknown title="未知字段" path="docs/reference/model.md" lines=108:109
@source model-claims title="最具体的认领规则" path="docs/reference/model.md" lines=173:190
@source model-repo title="按提交读取" path="docs/reference/model.md" lines=192:200
@source model-version-one title="从早期版本转换" path="docs/reference/model.md" lines=243:256
@source model-coverage title="覆盖路径与 glob" path="docs/reference/model.md" lines=269:275
@source model-repin title="更换提交的待办清单" path="docs/reference/model.md" lines=297:309
@source model-shifted title="偏移与被触及的引用" path="docs/reference/model.md" lines=311:314
@source model-overview title="模型写明的总览" path="docs/reference/overview.md" lines=11:17
@source model-groups title="分组" path="docs/reference/model.md" lines=482:488
@source model-views title="视图" path="docs/reference/model.md" lines=492:504
@source model-views-plan title="声明的视图与规划的视图" path="docs/reference/model.md" lines=516:519
@source ops-check title="archpub check" path="docs/reference/operations.md" lines=88:100
@source ops-needs title="出版工具的依赖" path="docs/reference/operations.md" lines=51:61
@source ops-build title="archpub build" path="docs/reference/operations.md" lines=101:103
@source ops-migrate title="导入、生成初稿与迁移" path="docs/reference/operations.md" lines=117:119
@source cli-exit title="退出码与拒绝" path="docs/reference/command-line.md" lines=40:46
@source ops-rows title="行、摆放与通道" path="docs/reference/operations.md" lines=137:150
@source ops-overlap title="布局绝不重叠" path="docs/reference/operations.md" lines=152:157
@source ops-gates title="四项平衡检查" path="docs/reference/operations.md" lines=189:195
@source ops-page title="自动生成的页面" path="docs/reference/operations.md" lines=280:289
@source ops-page-grid title="页面中的图用同一套网格" path="docs/reference/operations.md" lines=291:296
@source ops-overview title="总览" path="docs/reference/operations.md" lines=355:371
@source ops-guide title="导读" path="docs/reference/operations.md" lines=375:392
@source ops-guide-clone title="按提交核验来源" path="docs/reference/operations.md" lines=394:402
@source ops-scaffold title="导读初稿" path="docs/reference/operations.md" lines=404:407
@source ops-delivery title="交付物中的文件" path="docs/reference/operations.md" lines=414:430
@source ops-manifest title="清单" path="docs/reference/operations.md" lines=436:454
@source ops-accept title="archpub accept" path="docs/reference/operations.md" lines=458:462
@source ops-publish title="archpub publish" path="docs/reference/operations.md" lines=510:514
@source readme-layout title="布局即网格" path="README.md" lines=57:59
@source build-prepare title="一次构建的路线" path="src/build.mjs" lines=187:307
@source overview-warnings title="检查对总览发出的警告" path="src/build.mjs" lines=121:162
@source overview-unreached title="总览未指明的视图" path="src/build.mjs" lines=298:307
@source build-artifacts title="每个产物的哈希摘要" path="src/build.mjs" lines=461:478
@source manifest-record title="清单记录" path="src/manifest.mjs" lines=102:167
@source build-rename title="重命名就位" path="src/build.mjs" lines=579:594
@source load-top title="模型的字段" path="src/model/schema.json" lines=7:17
@source load-problems title="一遍报出全部问题" path="src/model/load.mjs" lines=61:72
@source load-files title="认领规则与被引用的文件" path="src/model/load.mjs" lines=140:178
@source load-version title="第 1 版模型" path="src/model/load.mjs" lines=180:190
@source load-views title="tiers 或 members" path="src/model/load.mjs" lines=394:420
@source paths-coverage title="检查覆盖范围" path="src/model/paths.mjs" lines=37:77
@source git-read title="只读的 Git" path="src/sources/git.mjs" lines=8:31
@source git-commit title="固定的提交" path="src/sources/git.mjs" lines=68:78
@source scope-glob title="由 Git 匹配 glob" path="src/sources/scope.mjs" lines=29:51
@source scope-at title="某个提交上的范围" path="src/sources/scope.mjs" lines=86:128
@source bind-owner title="最具体的认领规则" path="src/sources/bind.mjs" lines=172:177
@source bind-refuse title="files_unresolved" path="src/sources/bind.mjs" lines=201:220
@source bind-read title="一批读出哈希摘要" path="src/sources/bind.mjs" lines=221:238
@source views-plan title="规划视图" path="src/plan/views.mjs" lines=128:156
@source views-undrawn title="没有视图画出的部分" path="src/plan/views.mjs" lines=158:176
@source views-admit title="逐一接纳视图" path="src/plan/views.mjs" lines=198:221
@source guide-read title="读取草稿" path="src/map/guide.mjs" lines=190:221
@source guide-page title="草稿即页面" path="src/map/guide.mjs" lines=223:292
@source guide-clone title="临时克隆" path="src/map/guide.mjs" lines=312:332
@source explainer-page title="每个视图一个面板" path="src/map/explainer.mjs" lines=213:230
@source explainer-deliver title="用 Archify 定稿" path="src/map/explainer.mjs" lines=406:417
@source page-held title="Archify 写出的页面，留待交付" path="src/map/explainer.mjs" lines=286:381
@source typeset-version title="Typst 0.15.1" path="src/overview/typeset.mjs" lines=46:63
@source typeset-stage title="暂存版式类、模型和绘制总览的文件" path="src/overview/typeset.mjs" lines=102:128
@source typeset-problems title="Typst 的诊断转为拒绝" path="src/overview/typeset.mjs" lines=179:215
@source overview-check title="图册排入之前先检查总览" path="src/overview/typeset.mjs" lines=217:281
@source overview-read title="读取模型写明的总览" path="src/model/overview.mjs" lines=86:163
@source overview-forms title="总览里可以写什么" path="src/model/overview.mjs" lines=1:10
@source drawn-layout title="版面怎样布局" path="src/overview/drawn.typ" lines=3:11
@source drawn-fit title="两档间距各排一遍" path="src/overview/drawn.typ" lines=763:780
@source contract-plate-floor title="图版质量底线" path="docs/product-contract.md" lines=149:154
@source ops-plate title="图版" path="docs/reference/operations.md" lines=179:188
@source ops-reading title="图版的宽度与说明栏" path="docs/reference/operations.md" lines=206:234
@source ops-edition title="图册" path="docs/reference/operations.md" lines=236:253
@source house-reading title="说明栏过高时的排法" path="src/overview/house.typ" lines=597:633
@source ops-edition-text title="文字、日期与各页图像" path="docs/reference/operations.md" lines=255:278
@source ops-refusal-paths title="拒绝指向何处" path="docs/reference/refusals.md" lines=11:15
@source plates-compositions title="图版尝试的每种编排" path="src/poster/compose/plates.mjs" lines=159:170
@source plates-line-warnings title="构建对图版连线发出的警告" path="src/poster/compose/plates.mjs" lines=81:113
@source plates-admit title="正文区容得下的视图" path="src/poster/compose/plates.mjs" lines=210:222
@source plates-width title="图版宽度规则" path="src/poster/compose/plates.mjs" lines=284:339
@source plates-gates title="平衡检查只记录，不拒绝" path="src/poster/compose/gates.mjs" lines=1:24
@source edition-typeset title="一遍排版，一个 PDF" path="src/edition/typeset.mjs" lines=23:27
@source edition-images title="各页图像" path="src/edition/typeset.mjs" lines=153:174
@source edition-width title="默认宽度" path="src/delivery.json" lines=3:3
@source edition-figures title="单独输出每幅图" path="src/edition/typeset.mjs" lines=175:215
@source checks-boxes title="文字在界内且不相叠" path="src/overview/checks.mjs" lines=4:58
@source checks-lines title="文字不被线和圆环压住" path="src/overview/checks.mjs" lines=93:137
@source glyphs-overview title="随附字体画不出的字符" path="src/overview/glyphs.mjs" lines=43:68
@source edition-overview title="总览排入图册" path="src/edition/typeset.mjs" lines=80:93
@source supply-verify title="按哈希摘要核验物料" path="src/supply.mjs" lines=21:39
@source delivery-verify title="核验交付物" path="src/delivery.mjs" lines=26:54
@source delivery-compare title="比较两份交付物" path="src/delivery.mjs" lines=70:123
@source evidence-table title="证据表" path="src/pinned/evidence.mjs" lines=19:72
@source guide-pinned title="按固定的提交读取导读" path="src/projection.mjs" lines=70:107
@source delivery-names title="会让两个文件同名的 id" path="src/projection.mjs" lines=37:68
@source facts-edition title="为图册测得的事实" path="src/facts/edition.mjs" lines=5:10
@source delivery-accept title="记录验收" path="src/delivery.mjs" lines=168:236
@source delivery-publish title="出版一份副本" path="src/delivery.mjs" lines=334:375
@source worklist-fates title="每个文件的去向" path="src/sources/worklist.mjs" lines=5:12
@source worklist-citation title="引用区间的变化" path="src/sources/worklist.mjs" lines=63:67
@source worklist-repin title="待办清单" path="src/sources/worklist.mjs" lines=97:110
@source model-smallest title="最小模型" path="docs/reference/model.md" lines=26:28
@source model-minimal title="最小的模型" path="docs/reference/model.md" lines=33:58
@source changelog-first title="第一个版本" path="CHANGELOG.md" lines=1545:1551
@source changelog-040 title="0.4.0 版本" path="CHANGELOG.md" lines=965:970
@source changelog-0210 title="0.21.0 版本" path="CHANGELOG.md" lines=10:72
@source model-cards title="每个组件一张卡片" path="docs/reference/model.md" lines=316:356
@source model-ages title="新旧三档" path="docs/reference/model.md" lines=358:363
@source model-count title="连线上的引用文件数" path="docs/reference/model.md" lines=365:371
@source model-palette title="内置配色与自带配色" path="docs/reference/model.md" lines=381:393
@source model-palette-rules title="自带配色要过的规则" path="docs/reference/model.md" lines=402:413
@source model-no-strip title="卡片何时不画条带" path="docs/reference/model.md" lines=329:339
@source model-palette-overview title="总览用同一套配色" path="docs/reference/model.md" lines=425:426
@source ops-strip-box title="卡片所占的方框" path="docs/reference/operations.md" lines=198:204
@source ops-acceptance-scope title="验收说明什么" path="docs/reference/operations.md" lines=464:465
@source ops-colophon title="验收页" path="docs/reference/operations.md" lines=467:485
@source ops-statement title="验收记录" path="docs/reference/operations.md" lines=487:492
@source ops-sign title="为验收记录签名" path="docs/reference/operations.md" lines=494:497
@source ops-verify title="archpub verify" path="docs/reference/operations.md" lines=499:508
@source ops-earlier-records title="旧版本的验收记录" path="docs/reference/operations.md" lines=516:518
@source manifest-version title="清单第 9 版" path="src/manifest.mjs" lines=17:18
@source style-choice title="选定图册的配色" path="src/style.mjs" lines=9:25
@source ages-bands title="所有图册共用的三档" path="src/facts/ages.mjs" lines=1:10
@source bind-times title="每个文件最近一次改动" path="src/sources/bind.mjs" lines=49:65
@source edition-read title="读取 edition 对象" path="src/model/edition.mjs" lines=277:310
@source strip-marks title="条带画的是什么" path="src/poster/strip.mjs" lines=5:14
@source strip-lengths title="全册条带同一比例" path="src/poster/strip.mjs" lines=47:57
@source placement-narrowest title="列宽不小于最长的条带" path="src/layout/placement.mjs" lines=210:217
@source delivery-statement title="一份 in-toto Statement" path="src/delivery.mjs" lines=11:18
@source delivery-sign title="对记录的原始字节签名" path="src/delivery.mjs" lines=151:159
@source delivery-check title="核验一次验收" path="src/delivery.mjs" lines=313:332
@source colophon-page title="验收页上的内容" path="src/edition/colophon.mjs" lines=46:86
@source ops-key-line title="图例所在的线" path="docs/reference/operations.md" lines=257:260
@source house-key title="按基线定位的图例" path="src/overview/house.typ" lines=572:575
@source strip-key title="画条带时的图例" path="src/poster/strip.mjs" lines=186:195
@source strip-hub title="图例里表示枢纽的线" path="src/poster/strip.mjs" lines=255:265
@source words-leads title="枢纽线旁的用语" path="src/locale.mjs" lines=98:98
@source locale-unspaced title="词间不留空格的语言" path="src/locale.mjs" lines=238:245
@source text-paragraph title="详情按段落断行" path="src/poster/text.mjs" lines=302:306
@source spread-lines title="哪些详情要撑满行宽" path="src/poster/spread.mjs" lines=3:9
@source spread-limit title="撑满一行可以消去的余量" path="src/breaks.mjs" lines=85:95
@source text-kerning title="专用字体及其字偶间距" path="src/poster/text.mjs" lines=19:24
@source kerning-read title="从字体读出的字偶间距" path="src/poster/kerning.mjs" lines=1:5

## 模型里有什么，什么时候会被拒绝？ {#p-model}

模型由作者编写，也可以用 `archpub import likec4` 从 LikeC4 工作空间生成，或用 `archpub migrate` 从早期版本的模型转换。[](source:model-meaning)[](source:ops-migrate)加载器一遍就报出所有错误和各自的 JSON 路径；模型无效，就什么也不构建。[](source:load-problems)

按模型格式，最小的模型只有三个组件、两个关系和它们的类型。[](source:model-smallest)[](source:model-minimal)它可以构建，但它的图版会让图册正文区大半空白。[](source:model-smallest)

@code id=minimal-model source=model-minimal language=json

@diagram class id=model-map source=model.class.json

@steps id=model-steps
| step-model-file | model.json | 必须包含 `format`、`version` 3、`id`、`title`、`question`、`components` 和 `relations`；`overview` 写明总览页的内容，`guide` 以相对模型的路径指向导读草稿。[](source:load-top)[](source:model-fields)`edition` 选定图册的配色。[](source:edition-read) | model-map | model-file |
| step-model-components | components[] | 每个组件认领它拥有的路径：以 `/` 结尾的目录，或单个文件。同一路径不得认领两次。[](source:load-files)[](source:model-claims) | model-map | model-components |
| step-model-relations | relations[] | 每个关系连接两个组件，作为证据引用的都是单个文件。[](source:load-files) | model-map | model-relations |
| step-model-views | views[] | 每个视图必须声明 `tiers` 或 `members`，两者只能选一个。[](source:load-views)[](source:model-views) | model-map | model-views |
| step-model-coverage | coverage{} | 列出模型描述的路径和它排除的路径，后者各附理由；路径可以是 glob。[](source:paths-coverage)[](source:model-coverage) | model-map | model-coverage |

@facts
| 第 1 或第 2 版模型 | 拒绝，并给出转换所需的命令。[](source:load-version)[](source:model-version-one) |
| 未知字段 | 拒绝，因此拼错的字段不会悄悄消失。[](source:model-unknown) |
| `marks` 字段或未知的配色 | 拒绝，代码为 `model_field_retired` 或 `model_palette_unknown`，并指出 `/edition` 下的 JSON 路径。[](source:edition-read) |
| id 为 `model`、`manifest`、`acceptance` 或 `colophon` | 以 `delivery_name_taken` 拒绝，因为交付物里会有两个文件同名。[](source:delivery-names) |
| 无效模型 | 退出码 1，并给出每处错误的代码、JSON 路径和说明。[](source:cli-exit) |

## 按固定的提交，每个文件怎样找到所属组件？ {#p-files}

带 `--repo` 时，构建经 Git 读取模型所指提交上的每个文件，绝不抓取、不提示，也不改动检出目录。[](source:model-repo)[](source:git-read)

@sequence id=bind-flow title="按模型的提交绑定文件"
| actor bind-builder | 交付物构建器 | backend | source:build-prepare |
| actor bind-files | 文件绑定 | security | source:bind-owner |
| actor bind-git | Git 对象库 | database | source:git-read |
| phase | 解析 |
| bind-builder | bind-files | 绑定文件 |
| bind-files | bind-git | rev-parse 模型的 revision |
| bind-git | bind-files | 固定的提交 | return |
| phase | 划定范围与归属 |
| bind-files | bind-git | 在该提交上 ls-tree |
| bind-git | bind-files | 每个已跟踪文件 | return |
| bind-files | bind-git | 对每个 glob 执行 diff-tree |
| bind-git | bind-files | 匹配到的文件 | return |
| phase | 读取 |
| bind-files | bind-git | cat-file --batch |
| bind-git | bind-files | 已归属和被引用的文件 | return |
| bind-files | bind-git | log --name-only |
| bind-git | bind-files | 每个文件最近一次改动 | return |
| bind-files | bind-builder | 哈希摘要、大小、日期、所属组件 | return |

@steps id=bind-steps
| step-bind-commit | 文件绑定 | 把模型的 `revision` 解析为提交；缺少该提交的检出目录会被拒绝。[](source:git-commit) | bind-flow | bind-files | | bind-builder-to-bind-files-1,bind-files-to-bind-git-1,bind-git-to-bind-files-1 |
| step-bind-scope | Git 对象库 | 列出该提交上的每个已跟踪文件，并用 Git 自己的 pathspec 匹配每个 glob，区分大小写。[](source:scope-at)[](source:scope-glob) | bind-flow | bind-git | | bind-files-to-bind-git-2,bind-git-to-bind-files-2,bind-files-to-bind-git-3,bind-git-to-bind-files-3 |
| step-bind-owner | 文件绑定 | 范围内的文件如果被某条认领规则直接认领，就按那条规则归属；否则按包含它的最深一级已认领目录归属。[](source:bind-owner)[](source:model-claims) | bind-flow | bind-files |
| step-bind-refuse | 文件绑定 | 某条认领规则没有匹配到任何文件，或该提交缺少某个关系文件，就以 `files_unresolved` 拒绝构建。[](source:bind-refuse) | bind-flow | bind-files |
| step-bind-read | 交付物构建器 | 所有已归属和被引用的文件一次批量读出，记下 SHA-256、大小、最近改动日期、所属组件和引用它的关系。[](source:bind-read)再读一遍历史，就知道每个文件最近一次改动在何时；遇到浅克隆，就以 `source_history_unavailable` 拒绝。[](source:bind-times) | bind-flow | bind-builder | | bind-files-to-bind-git-4,bind-git-to-bind-files-4,bind-files-to-bind-git-5,bind-git-to-bind-files-5,bind-files-to-bind-builder-1 |

本作品里，一个组件认领 `src/map/`，另一个认领 `src/map/guide.mjs`。后者更具体，所以不管各条认领规则顺序如何，这个文件都归后者。[](source:model-claims)

## 一次构建要画哪些视图？ {#p-plan}

每个视图都画成图册里的一幅图版。视图要能在图版上布局，才会留在规划中。[](source:model-views)[](source:views-admit)

@diagram workflow id=plan-flow source=plan.workflow.json

@steps id=plan-steps
| step-plan-declared | 声明了视图？ | 模型声明了视图，就按声明的顺序采用这些视图。[](source:views-plan)[](source:model-views-plan) | plan-flow | plan-declared |
| step-plan-admit | 逐一接纳声明的视图 | 每个视图都必须能在图册正文区内布局；拒绝时会列出所有放不下的视图。[](source:views-admit) | plan-flow | plan-admit |
| step-plan-whole | 涵盖全部组件的视图 | 没有声明视图时，出版工具先尝试用一个视图画出整个模型。[](source:views-plan) | plan-flow | plan-whole |
| step-plan-groups | 声明了分组？ | 一幅图版容不下的模型，先画成每组一张卡片，再为每组画一个视图。[](source:model-groups) | plan-flow | plan-groups |
| step-plan-refused | 规划被拒绝 | 没有分组时，构建以 `plan_requires_structure` 停止，并要求声明分组或视图。[](source:views-plan) | plan-flow | plan-refused |

`archpub check` 还会列出所有规划视图都没有画到的组件和关系。这些只作报告，绝不因此拒绝模型。[](source:views-undrawn)[](source:contract-counts)这条命令还报告构建将写出的数据里各类内容的数量；加 `--json` 时，这些数量放在 `data` 下。[](source:ops-check)[](source:ops-manifest)

## 视图怎样布局才不会重叠？ {#p-layout}

图版和页面中的图使用同一套网格。图版按自己的字号档设定这套网格，页面则用 Archify 的文字度量。[](source:readme-layout)[](source:ops-plate)[](source:ops-page-grid)卡片占一个方框，宽度取文字和条带中较宽者，摆放和各项平衡检查都按方框进行。[](source:ops-strip-box)

@diagram architecture id=layout-map source=layout.architecture.json

@steps id=layout-steps
| step-lay-rows | 行 | 声明了层级，各层级就按顺序成为各行。否则，每个关系要么指向下方，要么留在同一行内。[](source:ops-rows) | layout-map | lay-rows |
| step-lay-placement | 摆放 | 在各行内精确求解卡片的位置，使交叉、弯折和空列的加权和最小。[](source:ops-rows)每一列都不窄于该视图最长的条带。[](source:placement-narrowest) | layout-map | lay-placement |
| step-lay-wires | 连线 | 在行间把关系走成总线、走廊、卡片旁的侧道和直箭头。[](source:ops-rows) | layout-map | lay-wires |
| step-lay-solver | 通道求解器 | 为每条通道选交叉最少的布线；在图版上，再选布线缺陷最少的。[](source:ops-overlap) | layout-map | lay-solver |
| step-lay-measure | 整洁度量 | 出现斜线、共用线段、穿过卡片的连线或相触的标签，该布局即被拒绝。[](source:ops-overlap) | layout-map | lay-measure |

@callout level=note title="拒绝，绝不缩小"
| 折行、宽度和字号档怎么选都放不下，视图才会被拒绝。文字绝不缩小，任何内容也不会被裁切。[](source:readme-layout)[](source:contract-layout-floor) |

## 视图如何成为图册中的一页？ {#p-edition}

每个视图就是一幅图版，即按图册正文区布局的一幅图，图中文字都不小于 14 px。[](source:ops-plate)Typst 0.15.1 用版式类把图册排成一个 PDF，每页 1600 × 900 pt。[](source:ops-edition)[](source:ops-needs)

图版把每个组件画成一张卡片。有检出目录可读时，卡片上有一道条带，条长就是组件拥有的文件大小，全册用同一比例。[](source:model-cards)[](source:model-no-strip)模型可以在 `edition` 对象里选定配色。[](source:model-cards)文件大小、占比和新旧分档在规划视图之前测一次，各幅图版都读这份结果。[](source:facts-edition)

@diagram workflow id=edition-flow source=edition.workflow.json

@steps id=edition-steps
| step-ed-compose | 编排每个视图 | 图版逐一尝试每种字号档、折行、居中方式和层级标签列，从中先取交叉最少的，再取布线缺陷最少的。[](source:plates-compositions)[](source:ops-plate)图版先按不带详情的卡片编排。带上详情后，视图若仍能以同样的宽高和字号档布局，布线也不变差，卡片才排出全部详情。[](source:model-cards) | edition-flow | ed-compose |
| step-ed-fits | 正文区内放得下？ | 所有编排都无法把视图布局在正文区内时，就以 `plate_unfittable` 拒绝；文字绝不缩小。[](source:plates-admit)[](source:contract-plate-floor)画条带时，只要有视图在 320 px 这一档放不下，全册就改用更短的条带重新规划。[](source:strip-lengths) | edition-flow | ed-fits |
| step-ed-width | 选定宽度 | 图宽在正文区的 100%、80%、65% 中取布线不变差的最窄一档。有概述的视图要为说明栏让出五分之一；这样布线变差时，图保持全宽，概述排在图上方。[](source:plates-width)[](source:ops-reading)仍然变差时，图占满整个正文区，概述排在图版页头，最多三行。[](source:ops-reading) | edition-flow | ed-width |
| step-ed-gates | 做四项平衡检查 | 度量图版的最大空白矩形、空白带、空洞和重心。未通过的检查只记录，供审阅者查看，不拒绝。[](source:plates-gates)[](source:ops-gates) | edition-flow | ed-gates |
| step-ed-typeset | 一遍排版 | 版式类把扉页、目录、总览、每幅图版和索引排入一个 PDF，符合 PDF/A-3a 与 PDF/UA-1。[](source:edition-typeset)[](source:ops-edition)目录链接到总览和每幅图版，每幅图版的页头也链接回总览。索引为每个组件写一小段，列出类型、详情、关系和路径。其中图版、相关组件和路径都是链接。[](source:ops-edition) | edition-flow | ed-typeset |
| step-ed-text | 文字与度量一致？ | Typst 排出的文字串比引擎度量的宽，或标题超出所在行，都会被拒绝。图上方的概述若有一行被 Typst 排得宽过 32 em，也会被拒绝。[](source:ops-edition-text)说明栏高过正文区时只放概述，连概述也放不下才拒绝。[](source:house-reading)页头的概述超过三行，以 `edition_reading_too_long` 拒绝。[](source:ops-reading) | edition-flow | ed-text |
| step-ed-images | PDF 与各页图像 | Typst 把总览页和每幅图版页按各宽度渲染为 PNG；构建未指定其他宽度时为 3840 px。[](source:edition-images)[](source:edition-width)[](source:ops-edition-text)每幅图版的图连同图例还单独输出两份：一份透明底的 PNG，一份 SVG。[](source:edition-figures)[](source:ops-delivery) | edition-flow | ed-images |
| step-ed-refused | 图册被拒绝 | 图版被拒绝时指明对应的视图；Typst 拒绝时指明 Typst 报告的那一行。[](source:ops-refusal-paths)[](source:typeset-problems) | edition-flow | ed-refused |

清单为每幅图版记录：所占正文区比例、说明栏、单独成图的文件，以及未通过的平衡检查。[](source:ops-manifest)

@facts
| 条带 | 组件拥有的每个文件占一段，段宽按文件占组件字节数的比例。最大的组件画成 320 px 长；有视图容不下时，全册改用 208 px。[](source:strip-marks)[](source:strip-lengths)构建没有读取检出目录，或模型没有认领文件时，每张卡片都不画条带，也不发警告。[](source:model-no-strip) |
| 新旧三档 | 每一段按文件的新旧上色，共分三档：固定的提交之前一周内改过、三个月内改过，或更早。所有图册都用这三档。[](source:model-ages)[](source:ages-bands) |
| 文件数 | 关系连线靠近起点处标着一个数字，是这条关系引用的文件数。构建只检查被引用的文件是否存在，不管它能否证明这条关系。[](source:model-count)数字沿连线放在哪里都会碰到其他标记时，构建发 `citation_count_touches` 警告，图版照常生成。[](source:plates-line-warnings) |
| `edition.palette` | 默认靛蓝，另有柿漆、松烟、铜绿三套内置配色。模型自带配色须合乎对比度、明度、彩度和色相规则，否则以 `model_palette_rejected` 拒绝。[](source:model-palette)[](source:model-palette-rules) |

图册把图版上每个文字串都排在引擎度量出的位置，度量时计入字体的字偶间距。图版的图例排在正文区下方。[](source:ops-edition-text)

@facts id=edition-text-facts
| 图例 | 每幅图版都带图例，说明图中画了什么。[](source:ops-edition)图例按基线定位，每幅图版的基线都在 850 pt 处，每个标记都对准旁边标签的中线。图例宽过正文区就排成两行；两行也排不下，就以 `edition_key_too_long` 拒绝。[](source:ops-key-line)[](source:house-key) |
| 枢纽 | 图册画条带时，图版的图例用一条线表示枢纽，也就是视图里各关系通向的那个组件。这条线与通向枢纽的连线一样粗，末端带同样的箭头，标签写明粗线通向哪个组件。[](source:strip-key)[](source:strip-hub)[](source:words-leads)通向枢纽的关系连线画成两倍粗。[](source:model-count) |
| 详情 | 简体和繁体中文，词间都不留空格。中文图册因此把组件的详情排成两端对齐的段落。[](source:locale-unspaced)文字允许的位置都可以断行。末行若只剩一个字，就把上一行最后一个单位带下来。[](source:text-paragraph) |
| 撑满的行 | 每条详情除末行外，各行都撑满详情断行所用的行宽。某一行的余量摊到每个可拉开处若超过十分之一 em，就保持左对齐；其他语言的详情一律左对齐。[](source:spread-lines)[](source:spread-limit) |
| 字偶间距 | 引擎度量 Source Sans 3 和 Source Serif 4 时，计入这两款字体自带的字偶间距，与 Typst 的排法一致。[](source:text-kerning)[](source:ops-edition-text)读取字体的库读不到存放这些间距的查找表，所以引擎自己从 GPOS 表里读出。[](source:kerning-read) |

## 页面如何生成、如何检查？ {#p-page}

页面是一个独立的 `<model id>.html`，由随附的 Archify 3.3.0 交付。[](source:ops-needs)模型在 `guide` 中指定草稿时，这份草稿就是页面。[](source:contract-guide)[](source:ops-guide)

@sequence id=page-flow title="作者的草稿：检查并交付"
| actor page-guide | 导读 | backend | source:guide-page |
| actor page-clone | 临时克隆 | database | source:guide-clone |
| actor page-archify | 随附 Archify | security | source:explainer-deliver |
| phase | 校验并交付 |
| page-guide | page-clone | 按模型的提交克隆 |
| page-guide | page-archify | 定稿，含严格写作检查 | emphasis |
| page-archify | page-clone | 核验每个引用区间 |
| page-archify | page-guide | 页面，留待写入 | return |
| phase | 被拒绝时 |
| page-guide | page-archify | 单独校验 |
| page-archify | page-guide | 全部检查结果 | return |

@steps id=page-steps
| step-page-read | 导读 | 读取草稿，以及草稿中 `@diagram`、`@chart` 和 `@image` 行指定的每个文件；符号链接、其他路径或缺失的文件都会被拒绝。[](source:guide-read)[](source:ops-guide)不论构建哪些媒介，都会读取导读。带 `--repo` 时，导读引用的路径在固定的提交上不是文件，就以 `guide_file_missing` 拒绝。[](source:guide-pinned)Archify 读取草稿前，出版工具先为每张图布局；图文件写了应由出版工具设定的字段，一律拒绝。[](source:guide-read)[](source:ops-guide) | page-flow | page-guide |
| step-page-repo | 导读 | 草稿指定的仓库 URL 或提交与模型不同，就会被拒绝。[](source:guide-page) | page-flow | page-guide |
| step-page-clone | 临时克隆 | 与检出目录共享对象，`origin` 指向模型的 URL，`HEAD` 指向模型的提交；用完即删除。[](source:guide-clone)[](source:ops-guide-clone) | page-flow | page-clone | | page-guide-to-page-clone-1 |
| step-page-validate | 随附 Archify | 按本次构建的质量校验草稿，质量为 showcase 时加做严格写作检查，并按该提交核验每个引用区间。[](source:guide-page)[](source:ops-guide-clone) | page-flow | page-archify | | page-guide-to-page-archify-1,page-archify-to-page-clone-1 |
| step-page-deliver | 随附 Archify | Archify 在同一次运行里把页面写成一个独立的 `<model id>.html`，并检查写出的页面。[](source:explainer-deliver)构建保留 Archify 写出的页面，写入交付物时不作改动。[](source:page-held)草稿和 Archify 的回执不进入交付物。[](source:explainer-deliver) | page-flow | page-archify | | page-archify-to-page-guide-1 |
| step-page-refused | 随附 Archify | 只有 Archify 拒绝页面时，才再单独校验一次，拒绝信息因此列出全部检查结果。`archpub check` 只校验页面，不交付。[](source:guide-page)[](source:build-prepare) | page-flow | page-archify | | page-guide-to-page-archify-2,page-archify-to-page-guide-2 |

没有草稿时，出版工具为每个视图写一个面板，每个面板都有一幅按同一套网格布局的原生图。[](source:ops-page)[](source:explainer-page)`archpub scaffold guide` 把这样的页面写成一份初稿。[](source:ops-scaffold)

## 总览怎样画出、怎样检查，又怎样排入图册？ {#p-overview}

总览是一页 16:9 的版面，图册把它排在目录之后。模型用四个字段写明这一页说什么：`claim`、`lead`、主线 `course` 和可选的区块 `blocks`。主线由步骤组成，各字段都不写位置、尺寸和字体。[](source:model-overview)[](source:overview-read)出版工具用版式类画出这一页，配色随图册。[](source:drawn-layout)[](source:model-palette-overview)

@diagram workflow id=overview-flow source=overview.workflow.json

@steps id=overview-steps
| step-ov-statement | 写明的总览有效？ | 区块可以是一条副线、列表、表格、一组列表，或带标题的文字。[](source:overview-forms)`overview` 里若写文件名，加载器就以 `model_overview_composition_retired` 拒绝。写法不合格式时，以 `model_overview_invalid` 拒绝，并指出 JSON 路径。[](source:overview-read) | overview-flow | ov-statement |
| step-ov-typst | Typst 0.15.1 在 PATH 中？ | 其他任何版本都会被拒绝，因为总览的字节取决于 Typst 的版本。[](source:typeset-version) | overview-flow | ov-typst |
| step-ov-stage | 暂存并绘制 | 把版式类、绘制总览的 Typst 文件、共用名称表、换成图册配色的版式设计令牌和模型复制到同一个根目录，Typst 不得离开该目录。[](source:typeset-stage)[](source:ops-overview)主线横贯版面上部，其余区块按写明的顺序排在其后，各占半宽或三分之一宽。[](source:drawn-layout)版面按原定间距排不下时，改用更紧的一档，只收窄间隙，字号不变。两档都排不下，就以 `overview_too_tall` 拒绝，并指出第一个放不下的区块。[](source:drawn-fit)[](source:ops-overview) | overview-flow | ov-stage |
| step-ov-boxes | 读回文本框和线条 | Typst 交回每段文字的文本框，以及画出的每条线和每个圆环。[](source:overview-check) | overview-flow | ov-boxes |
| step-ov-check | 文字在界内且无遮挡？ | 文字与左右边缘保持 48 pt，与上下边缘保持 16 pt，不压其他文字，也不被线或圆环压住。[](source:checks-boxes)[](source:checks-lines)[](source:ops-overview)随附字体画不出的字符，以 `overview_glyph_missing` 拒绝。[](source:glyphs-overview) | overview-flow | ov-check |
| step-ov-compile | 排入图册 | 检查通过后，图册才把这一页就地排入，文字仍保留为文字。[](source:edition-overview)[](source:ops-overview)总览页以 `images/00-overview.png` 交付。步骤或区块指明视图时，名称后排出该视图的图版编号，在图册里是链接。[](source:ops-overview)版面上没有任何内容指明某个视图时，图册以 `overview_view_unreached` 拒绝；有一行未能撑满行宽时，检查以 `overview_line_loose` 警告。[](source:overview-unreached)[](source:overview-warnings) | overview-flow | ov-compile |
| step-ov-refused | 总览被拒绝 | 拒绝时给出代码（例如 `overview_text_outside`、`overview_text_overlap` 和 `overview_text_over_line`）、相关文字及其位置。[](source:checks-boxes)[](source:checks-lines)出现 Typst 警告也会被拒绝。[](source:typeset-problems) | overview-flow | ov-refused |

## 清单绑定了什么？ {#p-manifest}

交付物包含图册 `<model id>.pdf`、各页图像、`figures/` 下每幅图版单独成图的文件、页面 `<model id>.html` 和 `manifest.json`。每份交付物还有 `model.json`、数据 `<model id>.json` 和读者文件 `<model id>.md`。[](source:ops-delivery)清单不含主机路径或用户名，图册的日期取自固定的提交。在同一平台上，相同的模型与出版工具版本重建出的每个字节都相同。[](source:ops-manifest)[](source:contract-bytes)

验收时，再在旁边写入 `acceptance.json` 和 `colophon.pdf`；审阅者签名时，还有 `acceptance.sig`。这三个文件都不进清单，产物也一概不变。[](source:ops-delivery)[](source:ops-accept)

@diagram erd id=manifest-erd source=manifest.erd.json

@steps id=manifest-steps
| step-mf-manifest | manifest.json | 第 9 版。写明出版工具版本、模型的文件名、哈希摘要和大小、质量、媒介，以及图册的配色。`sources` 里是绑定状态和所记文件的数量。[](source:manifest-record)[](source:manifest-version) | manifest-erd | erd-manifest |
| step-mf-evidence | evidence[] | 证据表在数据里；清单在 `data` 下写明数据文件及其各项数量。每一行是一个路径：模型认领或引用的，或者只有导读引用的。行内记有状态、哈希摘要、大小、最近改动日期、所属组件、引用它的关系和引用区间。[](source:evidence-table)[](source:ops-manifest)已归属和被引用文件的这些行，就是图册的锁文件。[](source:model-repo) | manifest-erd | erd-evidence |
| step-mf-supplies | supplies{} | 本次构建运行的每项随附物料的哈希摘要，各自对照物料清单检查。[](source:manifest-record)[](source:supply-verify) | manifest-erd | erd-supplies |
| step-mf-artifacts | artifacts[] | 交付物中每个文件的路径、大小和 SHA-256。[](source:build-artifacts) | manifest-erd | erd-artifacts |
| step-mf-acceptance | acceptance.json | 验收时写入：一份 in-toto Statement，对象是清单和验收页，各附 SHA-256。[](source:delivery-accept)[](source:ops-statement) | manifest-erd | erd-acceptance |

清单还保存每个视图和图版（连同度量），并为模型写明的总览记下哈希摘要。[](source:ops-manifest)清单在 `reader` 下写明读者文件及其大小和陈述数。[](source:manifest-record)

清单在 `style` 里记下配色的 id、中英文名称和解析后的各色。图册画条带时，还记下新旧各档时限、固定的提交所记日期，以及最大组件画多长。[](source:ops-manifest)[](source:style-choice)

## 谁来验收交付物，又怎样出版？ {#p-accept}

构建只能说明交付物来自它的输入。验收要由一位具名审阅者完成，测试和检查都不能代替。[](source:contract-acceptance)验收只记下谁在何时验收了哪些字节，并不证明架构正确。[](source:ops-acceptance-scope)

@diagram lifecycle id=delivery-life source=delivery.lifecycle.json

@steps id=delivery-steps
| step-life-delivered | 构建就位 | 构建写入 `--out` 旁的一个新目录。只有每个产物和清单都写完，这个目录才重命名就位，所以被拒绝的构建不会留下任何东西。[](source:ops-build)[](source:build-rename) | delivery-life | life-delivered |
| step-life-accepted | 已验收的构建 | `archpub accept` 对照清单核验每个产物，排出验收页，再写入验收记录，只做一次。[](source:delivery-accept)[](source:ops-accept) | delivery-life | life-accepted |
| step-life-changed | delivery_changed | 与清单不符的产物会被拒绝：验收时查一次，`archpub verify` 和出版时各再查一次。[](source:delivery-verify) | delivery-life | life-changed |
| step-life-published | 已出版的副本 | `archpub publish` 只复制已验收的交付物，连同验收页、验收记录和签名，放到对应的模型 id 和版本之下。副本要先核验。[](source:delivery-publish)[](source:ops-publish) | delivery-life | life-published |
| step-life-conflict | publish_conflict | 同一版本下若已有一份不同的交付物，就拒绝；若完全相同，则什么也不改变。[](source:ops-publish) | delivery-life | life-conflict |

@facts
| 验收记录 | `acceptance.json` 是一份 in-toto Statement，对象是 `manifest.json` 和 `colophon.pdf`，各附 SHA-256。谓词写明审阅者、UTC 时间和模型。[](source:ops-statement)[](source:delivery-statement) |
| 验收页 | `colophon.pdf` 只有一页，开本和语言都随图册。朱砂色的圆形印记上有“验收”二字、日期，以及审阅者的姓名或印章用名。旁边的签条列出验收记录的各项内容。[](source:ops-colophon)[](source:colophon-page) |
| 签名 | 可选。`archpub accept --sign` 用 ssh-keygen 对验收记录的原始字节签名，写入 `acceptance.sig`；记录里写明密钥指纹。[](source:ops-sign)[](source:delivery-sign) |
| `archpub verify` | 检查每个产物、验收记录和验收页。记录写明了签名者，就必须有签名文件；没有写明，就不能有。加上 `--allowed-signers`，还会核验签名确属这位审阅者。[](source:ops-verify)[](source:delivery-check) |
| `archpub compare` | 先让两份交付物各自对照清单核验，再列出内容不同的文件。各页图像和单独成图的文件列在所属图版之下，其余文件列为全册的文件。验收记录、签名和验收页不参与比较；这条命令也不写入任何文件。[](source:delivery-compare) |
| 旧版验收记录 | `verify` 和 `publish` 遇到旧版本写下的记录，会以 `acceptance_version_unsupported` 拒绝。删掉它，对未改动的交付物重新验收即可。[](source:ops-earlier-records) |

## Architecture Publisher 怎样走到今天？ {#p-history}

Architecture Publisher 的变更日志始于 2026 年 9 月 18 日的 0.1.0-alpha.0。[](source:changelog-first)10 月 30 日发布的 0.4.0 让它成为通用的出版工具，能把模型出版成多种媒介。[](source:changelog-040)下图从这一版起列出十九个版本，至 11 月 27 日的 0.21.0 为止；除 0.13.1 外，每版都改变了作者或审阅者看到的东西。[](source:changelog-0210)

@diagram timeline id=history source=history.timeline.json title="Architecture Publisher 怎样走到今天"

## 更换固定的提交会带来哪些变化？ {#p-repin}

把 `repository.revision` 改到更晚的提交之前，先运行 `archpub check --against <commit>`。更换提交的待办清单在两个提交上分别解析模型的认领规则，绝不拒绝这次检查。[](source:model-repin)[](source:worklist-repin)

@diagram tree id=worklist-tree source=worklist.tree.json

@steps id=worklist-steps
| step-wl-components | 每个组件 | 已归属文件的修改、移动（附新路径所归组件）和删除，以及认领规则新纳入的文件。[](source:model-repin) | worklist-tree | wl-components |
| step-wl-relations | 每个关系 | 发生变化的被引用文件，以 Git 重命名检测的结果为准。[](source:worklist-fates) | worklist-tree | wl-relations |
| step-wl-refused | 在更晚的提交上被拒绝 | 届时匹配不到任何文件的认领规则，以及届时已消失的关系文件；在那个提交上构建，两者都会被拒绝。[](source:model-repin) | worklist-tree | wl-refused |
| step-wl-uncovered | 新增未覆盖文件 | 在更晚的提交上，范围内任何认领规则都覆盖不到的文件。[](source:model-repin) | worklist-tree | wl-uncovered |
| step-wl-citations | 引用区间 | 草稿和其中的图所引用的每个区间：不变、偏移、随文件移动、被改动触及，或消失。[](source:worklist-citation)[](source:model-repin) | worklist-tree | wl-citations |

| 本作品从 4be4dd7 换到 7018b02  | 数量 |
| ------------------------------ | ---- |
| 固定之后的提交                 | 96   |
| 被修改的已归属文件（共 73 个） | 31   |
| 被删除的已归属文件             | 1    |
| 有文件被修改的组件             | 15   |
| 被引用文件有变化的关系         | 36   |
| 被拒绝的认领规则或关系文件     | 0    |
| 新增未覆盖文件                 | 11   |

没有被拒绝的认领规则或关系文件。新增未覆盖文件共十一个：十个是新文件，一个是移入 `src/facts/` 的文件。`src/facts/` 下四个，组成新组件“测得的事实”；`src/pinned/` 下五个，组成“数据与读者文件”；其余两个归交付物构建器。

@callout level=warning title="Archify 只检查区间是否存在"
| 更换固定的提交后，引用一旦偏移，就会指向其他文字。要把它移到新区间，并重读每个被触及的引用。[](source:model-shifted) |

- [ ] 修改 `repository.revision` 之前，先运行 `archpub check --against <commit>`。[](source:model-repin)
- [ ] 为每个新增未覆盖文件加上认领规则，并复查每个文件有变化的关系。[](source:model-repin)
- [ ] 把每个偏移的引用移到新区间，并重读每个被触及的引用。[](source:model-shifted)
- [ ] 按新提交重新检查并构建，不留任何未覆盖文件。[](source:ops-check)
