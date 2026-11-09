# Architecture Publisher 如何把架构模型变成图册和页面？ {#guide}

`archpub` 读取一个模型，按固定的修订绑定组件认领的文件，再规划视图。每个视图都布局在同一套网格上，编排成一幅图版；图册由 Typst 排版，另交付一个 Archify 页面。[](source:contract-processing)清单把每个产物绑定到各自的输入；交付物要先由一位具名审阅人验收，才能出版。[](source:contract-product)[](source:contract-acceptance)

- [模型是含义的唯一来源](block:p-model)：出版工具绝不从代码推断架构。[](source:model-meaning)[](source:contract-meaning)
- [对 Git 只读不写](block:p-files)：每个文件都取自固定的提交，检出始终不变。[](source:model-repo)
- [有重叠的布局绝不绘出](block:p-layout)；任何布局都画不出的视图会被拒绝，不会缩小。[](source:contract-layout-floor)
- [只出版已验收的交付物](block:p-accept)，也绝不覆盖另一份不同的交付物。[](source:contract-acceptance)

@answer scope="Architecture Publisher v0.10.1 · 提交 1861b7c · 源码与项目自身的文档 · 重新固定的计数测于 2026-11-08"
@meta locale=zh-CN style=editorial
@source contract-product title="产品" path="docs/product-contract.md" lines=13:21
@source contract-meaning title="含义与形式归谁" path="docs/product-contract.md" lines=23:28
@source contract-processing title="一次构建的六步" path="docs/product-contract.md" lines=51:63
@source contract-bytes title="相同输入，相同字节" path="docs/product-contract.md" lines=65:67
@source contract-guide title="导读与生成的页面" path="docs/product-contract.md" lines=92:101
@source contract-layout-floor title="卡片、连线，绝无重叠" path="docs/product-contract.md" lines=114:121
@source contract-acceptance title="验收与出版" path="docs/product-contract.md" lines=133:137
@source contract-counts title="只计数，不拒绝" path="docs/product-contract.md" lines=143:145
@source model-meaning title="含义的唯一来源" path="docs/reference/model.md" lines=11:17
@source model-fields title="顶层字段" path="docs/reference/model.md" lines=56:79
@source model-unknown title="未知字段" path="docs/reference/model.md" lines=81:83
@source model-claims title="最具体的认领" path="docs/reference/model.md" lines=143:160
@source model-repo title="按修订读取" path="docs/reference/model.md" lines=162:170
@source model-version-one title="从第 1 版转换" path="docs/reference/model.md" lines=188:199
@source model-coverage title="覆盖路径与 glob" path="docs/reference/model.md" lines=212:218
@source model-repin title="重新固定工作清单" path="docs/reference/model.md" lines=240:252
@source model-shifted title="偏移与被触及的引用" path="docs/reference/model.md" lines=254:257
@source model-overview title="总览编排" path="docs/reference/model.md" lines=261:266
@source model-house title="版式类提供什么" path="docs/reference/model.md" lines=279:288
@source model-groups title="分组" path="docs/reference/model.md" lines=332:338
@source model-views title="视图" path="docs/reference/model.md" lines=342:354
@source model-views-plan title="声明的视图与规划的视图" path="docs/reference/model.md" lines=366:370
@source ops-check title="archpub check" path="docs/reference/operations.md" lines=61:73
@source ops-build title="archpub build" path="docs/reference/operations.md" lines=74:76
@source ops-migrate title="导入、生成初稿与迁移" path="docs/reference/operations.md" lines=91:97
@source ops-exit title="退出码与拒绝" path="docs/reference/operations.md" lines=102:108
@source ops-rows title="行、摆放与通道" path="docs/reference/operations.md" lines=115:128
@source ops-overlap title="布局绝不重叠" path="docs/reference/operations.md" lines=130:135
@source ops-gates title="四道平衡门槛" path="docs/reference/operations.md" lines=167:173
@source ops-page title="生成的页面" path="docs/reference/operations.md" lines=226:235
@source ops-page-grid title="页面中的图用同一套网格" path="docs/reference/operations.md" lines=237:242
@source ops-overview title="总览" path="docs/reference/operations.md" lines=303:317
@source ops-guide title="导读" path="docs/reference/operations.md" lines=321:328
@source ops-guide-clone title="按修订核验来源" path="docs/reference/operations.md" lines=330:338
@source ops-scaffold title="导读初稿" path="docs/reference/operations.md" lines=340:342
@source ops-delivery title="交付物中的文件" path="docs/reference/operations.md" lines=349:359
@source ops-manifest title="清单" path="docs/reference/operations.md" lines=361:380
@source ops-accept title="archpub accept" path="docs/reference/operations.md" lines=384:386
@source ops-publish title="archpub publish" path="docs/reference/operations.md" lines=388:392
@source readme-layout title="布局即网格" path="README.md" lines=93:98
@source build-prepare title="一次构建的路线" path="src/build.mjs" lines=127:178
@source build-composition title="缺失的编排" path="src/build.mjs" lines=106:125
@source build-artifacts title="每个产物的摘要" path="src/build.mjs" lines=338:355
@source build-manifest title="清单记录" path="src/build.mjs" lines=420:489
@source build-rename title="重命名就位" path="src/build.mjs" lines=490:506
@source load-top title="模型的字段" path="src/model/load.mjs" lines=36:48
@source load-problems title="一遍报出全部问题" path="src/model/load.mjs" lines=54:63
@source load-files title="认领与被引用的文件" path="src/model/load.mjs" lines=119:157
@source load-version title="第 1 版模型" path="src/model/load.mjs" lines=159:169
@source load-views title="tiers 或 members" path="src/model/load.mjs" lines=382:411
@source paths-coverage title="检查覆盖范围" path="src/model/paths.mjs" lines=35:75
@source git-read title="只读的 Git" path="src/sources/git.mjs" lines=8:31
@source git-commit title="固定的提交" path="src/sources/git.mjs" lines=68:78
@source scope-glob title="由 Git 匹配 glob" path="src/sources/scope.mjs" lines=29:51
@source scope-at title="某个提交上的范围" path="src/sources/scope.mjs" lines=86:128
@source bind-owner title="最具体的认领" path="src/sources/bind.mjs" lines=82:87
@source bind-refuse title="files_unresolved" path="src/sources/bind.mjs" lines=110:129
@source bind-read title="一批读出摘要" path="src/sources/bind.mjs" lines=130:149
@source views-plan title="规划视图" path="src/plan/views.mjs" lines=128:156
@source views-undrawn title="没有视图画出的部分" path="src/plan/views.mjs" lines=158:176
@source views-admit title="逐一接纳视图" path="src/plan/views.mjs" lines=198:221
@source guide-read title="读取草稿" path="src/map/guide.mjs" lines=131:161
@source guide-page title="草稿即页面" path="src/map/guide.mjs" lines=163:215
@source guide-clone title="临时克隆" path="src/map/guide.mjs" lines=244:264
@source explainer-page title="每个视图一个面板" path="src/map/explainer.mjs" lines=211:222
@source explainer-deliver title="用 Archify 定稿" path="src/map/explainer.mjs" lines=292:303
@source typeset-version title="Typst 0.15.1" path="src/overview/typeset.mjs" lines=34:50
@source typeset-stage title="暂存编排" path="src/overview/typeset.mjs" lines=73:109
@source typeset-problems title="拒绝指向编排中的行" path="src/overview/typeset.mjs" lines=130:161
@source contract-plate-floor title="图版质量底线" path="docs/product-contract.md" lines=105:110
@source ops-plate title="图版" path="docs/reference/operations.md" lines=157:166
@source ops-reading title="图版的宽度与说明栏" path="docs/reference/operations.md" lines=180:194
@source ops-edition title="图册" path="docs/reference/operations.md" lines=196:207
@source ops-edition-text title="文字、日期与各页图像" path="docs/reference/operations.md" lines=208:224
@source ops-refusal-paths title="拒绝指向何处" path="docs/reference/operations.md" lines=396:401
@source plates-compositions title="图版尝试的每种编排" path="src/poster/compose/plates.mjs" lines=99:110
@source plates-admit title="正文区容得下的视图" path="src/poster/compose/plates.mjs" lines=149:160
@source plates-width title="图版宽度规则" path="src/poster/compose/plates.mjs" lines=203:234
@source plates-gates title="门槛只记录，不拒绝" path="src/poster/compose/gates.mjs" lines=1:24
@source edition-typeset title="一遍排版，一个 PDF" path="src/edition/typeset.mjs" lines=11:14
@source edition-images title="各页图像" path="src/edition/typeset.mjs" lines=120:141
@source lint-rules title="编排不得做什么" path="src/overview/lint.mjs" lines=3:20
@source checks-boxes title="文字在界内且不相叠" path="src/overview/checks.mjs" lines=22:56
@source supply-verify title="按摘要核验物料" path="src/supply.mjs" lines=21:39
@source delivery-verify title="核验交付物" path="src/delivery.mjs" lines=11:36
@source delivery-accept title="记录验收" path="src/delivery.mjs" lines=52:77
@source delivery-publish title="出版一份副本" path="src/delivery.mjs" lines=79:136
@source worklist-fates title="每个文件的去向" path="src/sources/worklist.mjs" lines=5:12
@source worklist-citation title="引用区间的变化" path="src/sources/worklist.mjs" lines=63:67
@source worklist-repin title="工作清单" path="src/sources/worklist.mjs" lines=97:110

## 模型里有什么，什么时候会被拒绝？ {#p-model}

模型由作者编写，也可以用 `archpub import likec4` 从 LikeC4 工作空间生成，或用 `archpub migrate` 从第 1 版模型转换。[](source:model-meaning)[](source:ops-migrate)加载器一遍就报出所有问题和各自的 JSON 路径；模型无效，就什么也不构建。[](source:load-problems)

@diagram class id=model-map source=model.class.json

@steps id=model-steps
| step-model-file | model.json | 必须包含 `format`、`version` 3、`id`、`title`、`question`、`components` 和 `relations`；`overview` 和 `guide` 指向模型旁边的文件。[](source:load-top)[](source:model-fields) | model-map | model-file |
| step-model-components | components[] | 每个组件认领它拥有的路径：以 `/` 结尾的目录，或单个文件。同一路径不会被认领两次。[](source:load-files)[](source:model-claims) | model-map | model-components |
| step-model-relations | relations[] | 每个关系连接两个组件，并引用单个文件作为证据。[](source:load-files) | model-map | model-relations |
| step-model-views | views[] | 每个视图必须声明 `tiers` 或 `members`，两者只能选一个。[](source:load-views)[](source:model-views) | model-map | model-views |
| step-model-coverage | coverage{} | 列出模型描述的路径和它排除的路径，后者各附理由；路径可以是 glob。[](source:paths-coverage)[](source:model-coverage) | model-map | model-coverage |

@facts
| 第 1 或第 2 版模型 | 拒绝，并给出转换所需的命令。[](source:load-version)[](source:model-version-one) |
| 未知字段 | 拒绝，因此拼错的字段不会悄悄消失。[](source:model-unknown) |
| 无效模型 | 退出码 1，并给出每个问题的代码、JSON 路径和说明。[](source:ops-exit) |

## 按固定的修订，每个文件怎样找到所属组件？ {#p-files}

带 `--repo` 时，构建经 Git 读取模型所指修订上的每个文件，绝不拉取、不提示，也不改动检出。[](source:model-repo)[](source:git-read)

@sequence id=bind-flow title="按模型的修订绑定文件"
| actor bind-builder | 交付物构建器 | backend | source:build-prepare |
| actor bind-files | 文件绑定 | security | source:bind-owner |
| actor bind-git | Git 对象库 | database | source:git-read |
| phase | 解析 |
| bind-builder | bind-files | 绑定文件 |
| bind-files | bind-git | rev-parse 修订 |
| bind-git | bind-files | 固定的提交 | return |
| phase | 划定范围与归属 |
| bind-files | bind-git | 在该提交上 ls-tree |
| bind-git | bind-files | 每个已跟踪文件 | return |
| bind-files | bind-git | 对每个 glob 执行 diff-tree |
| bind-git | bind-files | 匹配到的文件 | return |
| phase | 读取 |
| bind-files | bind-git | cat-file --batch |
| bind-git | bind-files | 已归属和被引用的文件 | return |
| bind-files | bind-builder | 摘要、所属组件、关系 | return |

@steps id=bind-steps
| step-bind-commit | 文件绑定 | 把模型的修订解析为提交；缺少该提交的检出会被拒绝。[](source:git-commit) | bind-flow | bind-files | | bind-builder-to-bind-files-1,bind-files-to-bind-git-1,bind-git-to-bind-files-1 |
| step-bind-scope | Git 对象库 | 列出该提交上的每个已跟踪文件，并用 Git 自己的 pathspec 匹配每个 glob，区分大小写。[](source:scope-at)[](source:scope-glob) | bind-flow | bind-git | | bind-files-to-bind-git-2,bind-git-to-bind-files-2,bind-files-to-bind-git-3,bind-git-to-bind-files-3 |
| step-bind-owner | 文件绑定 | 范围内的文件如果被直接认领，就归那项认领；否则归包含它的最深一级已认领目录。[](source:bind-owner)[](source:model-claims) | bind-flow | bind-files |
| step-bind-refuse | 文件绑定 | 某项认领没有任何文件，或该提交缺少某个关系文件，就以 `files_unresolved` 拒绝构建。[](source:bind-refuse) | bind-flow | bind-files |
| step-bind-read | 交付物构建器 | 所有已归属和被引用的文件一次批量读出，连同 SHA-256、所属组件和引用它的关系一并记录。[](source:bind-read) | bind-flow | bind-builder | | bind-files-to-bind-git-4,bind-git-to-bind-files-4,bind-files-to-bind-builder-1 |

本作品里，一个组件认领 `src/map/`，另一个认领 `src/map/guide.mjs`。后者更具体，所以不管各项认领顺序如何，这个文件都归后者。[](source:model-claims)

## 一次构建要画哪些视图？ {#p-plan}

每个视图都画成图册里的一幅图版。视图要能在图版上布局，才会留在规划中。[](source:model-views)[](source:views-admit)

@diagram workflow id=plan-flow source=plan.workflow.json

@steps id=plan-steps
| step-plan-declared | 声明了视图？ | 模型声明了视图，就按声明的顺序采用这些视图。[](source:views-plan)[](source:model-views-plan) | plan-flow | plan-declared |
| step-plan-admit | 逐一接纳声明的视图 | 每个视图都必须能在图册正文区内布局；拒绝时会列出所有布局不下的视图。[](source:views-admit) | plan-flow | plan-admit |
| step-plan-whole | 涵盖全部组件的视图 | 没有声明视图时，出版工具先尝试用一个视图画出整个模型。[](source:views-plan) | plan-flow | plan-whole |
| step-plan-groups | 声明了分组？ | 一幅图版容不下的模型，先画成每组一张卡片，再为每组画一个视图。[](source:model-groups) | plan-flow | plan-groups |
| step-plan-refused | 规划被拒绝 | 没有分组时，构建以 `plan_requires_structure` 停止，并要求声明分组或视图。[](source:views-plan) | plan-flow | plan-refused |

`archpub check` 还会列出所有规划视图都没有画到的组件和关系。这些只作报告，绝不因此拒绝模型。[](source:views-undrawn)[](source:contract-counts)

## 视图怎样布局才不会重叠？ {#p-layout}

图版和页面中的图使用同一套网格。图版按自己的字号档设定这套网格，页面则用 Archify 的文字度量。[](source:readme-layout)[](source:ops-plate)[](source:ops-page-grid)

@diagram architecture id=layout-map source=layout.architecture.json

@steps id=layout-steps
| step-lay-rows | 行 | 声明了层级，各层级就按顺序成为各行。否则，每个关系要么指向下方，要么留在同一行内。[](source:ops-rows) | layout-map | lay-rows |
| step-lay-placement | 摆放 | 在各行内精确摆放卡片，使交叉、弯折和空列的加权数最少。[](source:ops-rows) | layout-map | lay-placement |
| step-lay-wires | 连线 | 在行间把关系走成总线、走廊、卡片旁的侧道和直箭头。[](source:ops-rows) | layout-map | lay-wires |
| step-lay-solver | 通道求解器 | 为每条通道选交叉最少的布线；在图版上，再选布线缺陷最少的。[](source:ops-overlap) | layout-map | lay-solver |
| step-lay-measure | 整洁度量 | 出现斜线、共用线段、穿过卡片的连线或相触的标签，该布局即被拒绝。[](source:ops-overlap) | layout-map | lay-measure |

@callout level=note title="拒绝，绝不缩小"
| 只有无论怎样折行、选什么宽度和字号档都布局不下，视图才会被拒绝。文字绝不缩小，任何内容也不会被裁切。[](source:readme-layout)[](source:contract-layout-floor) |

## 视图如何成为图册中的一页？ {#p-edition}

每个视图就是一幅图版，即按图册正文区布局的一幅图，图中文字都不小于 14 px。[](source:ops-plate)Typst 0.15.1 用版式类把图册排成一个 PDF，每页 1600 × 900 pt。[](source:ops-edition)

@diagram workflow id=edition-flow source=edition.workflow.json

@steps id=edition-steps
| step-ed-compose | 编排每个视图 | 图版逐一尝试每种字号档、折行、居中方式和层级标签列，从中先取交叉最少的，再取布线缺陷最少的。[](source:plates-compositions)[](source:ops-plate) | edition-flow | ed-compose |
| step-ed-fits | 正文区内能布局？ | 所有编排都无法把视图布局在正文区内时，就以 `plate_unfittable` 拒绝；文字绝不缩小。[](source:plates-admit)[](source:contract-plate-floor) | edition-flow | ed-fits |
| step-ed-width | 选定宽度 | 图宽在正文区的 100%、80%、65% 中取连线不变差的最窄一档。有概述的视图要为说明栏让出五分之一。[](source:plates-width)[](source:ops-reading) | edition-flow | ed-width |
| step-ed-gates | 度量四道门槛 | 度量图版的最大空白矩形、空白带、空洞和重心。未通过的门槛只记录，供审阅人查看，不拒绝。[](source:plates-gates)[](source:ops-gates) | edition-flow | ed-gates |
| step-ed-typeset | 一遍排版 | 版式类把扉页、目录、总览和每幅图版排入一个 PDF，符合 PDF/A-3a 与 PDF/UA-1。[](source:edition-typeset)[](source:ops-edition) | edition-flow | ed-typeset |
| step-ed-text | 文字与度量一致？ | 以下情况都会被拒绝：Typst 排出的文字串比引擎度量的宽；标题超出所在行；说明栏高过正文区。[](source:ops-edition-text)[](source:ops-reading) | edition-flow | ed-text |
| step-ed-images | PDF 与各页图像 | Typst 把总览页和每幅图版页按各宽度渲染为 PNG；构建未指定其他宽度时为 2400 px。[](source:edition-images)[](source:ops-edition-text) | edition-flow | ed-images |
| step-ed-refused | 图册被拒绝 | 图版被拒绝时指明对应的视图；Typst 拒绝时指明 Typst 报告的那一行。[](source:ops-refusal-paths)[](source:typeset-problems) | edition-flow | ed-refused |

清单为每幅图版记录：所占正文区比例、说明栏，以及未通过的门槛。[](source:ops-manifest)

## 页面如何生成、如何检查？ {#p-page}

页面是一个独立的 `<model id>.html`，由随附的 Archify 3.2.0 交付。模型在 `guide` 中指定草稿时，这份草稿就是页面。[](source:contract-guide)[](source:ops-guide)

@sequence id=page-flow title="作者的草稿：检查并交付"
| actor page-guide | 导读 | backend | source:guide-page |
| actor page-clone | 临时克隆 | database | source:guide-clone |
| actor page-archify | 随附 Archify | security | source:explainer-deliver |
| phase | 校验 |
| page-guide | page-clone | 按模型的修订克隆 |
| page-guide | page-archify | 校验，并严格检查写作 |
| page-archify | page-clone | 核验每个引用区间 |
| page-archify | page-guide | 通过 | return |
| phase | 交付 |
| page-guide | page-clone | 再次克隆 |
| page-guide | page-archify | 讲解页定稿 | emphasis |
| page-archify | page-guide | 页面 | return |

@steps id=page-steps
| step-page-read | 导读 | 读取草稿，以及草稿中 `@diagram`、`@chart` 和 `@image` 行指定的每个文件；符号链接、其他路径或缺失的文件都会被拒绝。[](source:guide-read)[](source:ops-guide) | page-flow | page-guide |
| step-page-repo | 导读 | 草稿指定的仓库 URL 或修订与模型不同，就会被拒绝。[](source:guide-page) | page-flow | page-guide |
| step-page-clone | 临时克隆 | 与检出共享对象，`origin` 指向模型的 URL，`HEAD` 指向模型的修订；用完即删除。[](source:guide-clone)[](source:ops-guide-clone) | page-flow | page-clone | | page-guide-to-page-clone-1,page-guide-to-page-clone-2 |
| step-page-validate | 随附 Archify | 按本次构建的质量校验草稿，质量为 showcase 时严格检查写作，并按该修订核验每个引用区间。[](source:guide-page)[](source:ops-guide-clone) | page-flow | page-archify | | page-guide-to-page-archify-1,page-archify-to-page-clone-1,page-archify-to-page-guide-1 |
| step-page-deliver | 随附 Archify | 把页面写成一个独立的 `<model id>.html`；草稿和 Archify 的回执不进入交付物。[](source:explainer-deliver) | page-flow | page-archify | | page-guide-to-page-archify-2,page-archify-to-page-guide-2 |

没有草稿时，出版工具为每个视图写一个面板，每个面板都有一幅按同一套网格布局的原生图。[](source:ops-page)[](source:explainer-page)`archpub scaffold guide` 把这样的页面写成一份初稿。[](source:ops-scaffold)

## 总览怎样检查，又怎样排入图册？ {#p-overview}

总览是一页 16:9 的版面，由作者用 Typst 和版式类编排，图册把它排在目录之后。版面、字体、四档字号和配色都由版式类决定。[](source:model-overview)[](source:model-house)

@diagram workflow id=overview-flow source=overview.workflow.json

@steps id=overview-steps
| step-ov-composition | 编排存在？ | 模型可能指定了不存在的编排。这时构建以 `overview_composition_missing` 被拒绝，并给出查找过的路径。[](source:build-composition) | overview-flow | ov-composition |
| step-ov-typst | Typst 0.15.1 在 PATH 中？ | 其他任何版本都会被拒绝，因为总览的字节取决于 Typst 的版本。[](source:typeset-version) | overview-flow | ov-typst |
| step-ov-stage | 暂存并检查代码规范 | 把编排、版式类和模型复制到同一个根目录，Typst 不得离开该目录。包、插件，以及自行指定的字号、字体或颜色，都会被拒绝。[](source:typeset-stage)[](source:lint-rules) | overview-flow | ov-stage |
| step-ov-boxes | 读取文本框 | 版式类排出的每段文字都记下自己的文本框，构建时再从 Typst 读回。[](source:ops-overview) | overview-flow | ov-boxes |
| step-ov-check | 文字在界内且不相叠？ | 文字与左右边缘保持 48 pt，与上下边缘保持 16 pt，也绝不压在其他文字上。[](source:checks-boxes) | overview-flow | ov-check |
| step-ov-compile | 排入图册 | 这时图册才把编排就地排入，文字仍保留为文字。总览页以 `images/00-overview.png` 交付。[](source:ops-overview) | overview-flow | ov-compile |
| step-ov-refused | 总览被拒绝 | 每次拒绝都指明编排中的行；出现 Typst 警告也会被拒绝。[](source:typeset-problems) | overview-flow | ov-refused |

## 清单绑定了什么？ {#p-manifest}

交付物包含图册 `<model id>.pdf`、各页图像、页面 `<model id>.html` 和 `manifest.json`。[](source:ops-delivery)清单不含主机路径或用户名，图册的日期取自该修订的提交。在同一平台上，相同的模型与版本能重建每个字节。[](source:ops-manifest)[](source:contract-bytes)

@diagram erd id=manifest-erd source=manifest.erd.json

@steps id=manifest-steps
| step-mf-manifest | manifest.json | 写明出版工具的版本、模型的摘要和大小、质量与媒介。[](source:build-manifest) | manifest-erd | erd-manifest |
| step-mf-records | sources.records[] | 每个已归属或被引用的文件，附摘要、所属组件和引用它的关系。这份记录就是图册的锁。[](source:bind-read)[](source:model-repo) | manifest-erd | erd-records |
| step-mf-supplies | supplies{} | 本次构建运行的每项随附物料的摘要，各自对照物料清单检查。[](source:build-manifest)[](source:supply-verify) | manifest-erd | erd-supplies |
| step-mf-artifacts | artifacts[] | 交付物中每个文件的路径、大小和 SHA-256。[](source:build-artifacts) | manifest-erd | erd-artifacts |
| step-mf-acceptance | acceptance.json | 由审阅人事后写入，用 SHA-256 指明清单。[](source:delivery-accept) | manifest-erd | erd-acceptance |

清单还保存每个视图和图版（连同度量）、总览编排的摘要，以及每个组件和关系的详情、状态与文件。[](source:ops-manifest)

## 谁来验收交付物，又怎样出版？ {#p-accept}

构建只能说明交付物来自它的输入。验收要由一位具名审阅人完成，测试和检查都不能代替。[](source:contract-acceptance)

@diagram lifecycle id=delivery-life source=delivery.lifecycle.json

@steps id=delivery-steps
| step-life-delivered | 构建就位 | 构建写入 `--out` 旁的一个新目录。只有每个产物和清单都写完，这个目录才重命名就位，所以被拒绝的构建不会留下任何东西。[](source:ops-build)[](source:build-rename) | delivery-life | life-delivered |
| step-life-accepted | 已验收的构建 | `archpub accept` 对照清单核验每个产物，再记录审阅人，只记录一次。[](source:delivery-accept)[](source:ops-accept) | delivery-life | life-accepted |
| step-life-changed | delivery_changed | 与清单不符的产物会被拒绝：验收时查一次，出版时再查一次。[](source:delivery-verify) | delivery-life | life-changed |
| step-life-published | 已出版的副本 | `archpub publish` 只复制已验收的交付物，放到对应的模型 id 和版本之下，并先核验这份副本。[](source:delivery-publish)[](source:ops-publish) | delivery-life | life-published |
| step-life-conflict | publish_conflict | 同一版本下若是不同的交付物，就拒绝；若完全相同，则什么也不改变。[](source:ops-publish) | delivery-life | life-conflict |

## 更换固定的修订会带来哪些变化？ {#p-repin}

把 `repository.revision` 改到更晚的提交之前，先运行 `archpub check --against <commit>`。重新固定工作清单在两个提交上分别解析模型的认领，绝不拒绝这次检查。[](source:model-repin)[](source:worklist-repin)

@diagram tree id=worklist-tree source=worklist.tree.json

@steps id=worklist-steps
| step-wl-components | 每个组件 | 已归属文件的修改、移动（附新路径所归组件）和删除，以及认领新纳入的文件。[](source:model-repin) | worklist-tree | wl-components |
| step-wl-relations | 每个关系 | 发生变化的被引用文件，以 Git 重命名检测的结果为准。[](source:worklist-fates) | worklist-tree | wl-relations |
| step-wl-refused | 在更晚的提交上被拒绝 | 届时不拥有任何文件的认领，以及届时已消失的关系文件；在那个提交上构建，两者都会被拒绝。[](source:model-repin) | worklist-tree | wl-refused |
| step-wl-uncovered | 新增未覆盖文件 | 在更晚的提交上，范围内不归任何认领的文件。[](source:model-repin) | worklist-tree | wl-uncovered |
| step-wl-citations | 引用区间 | 草稿和其中的图所引用的每个区间：不变、偏移、随文件移动、被改动触及，或消失。[](source:worklist-citation)[](source:model-repin) | worklist-tree | wl-citations |

| 本作品从 5a26416 移到 548637c  | 数量 |
| ------------------------------ | ---- |
| 固定之后的提交                 | 27   |
| 被修改的已归属文件（共 66 个） | 23   |
| 被删除的已归属文件             | 9    |
| 有文件被修改的组件             | 13   |
| 被引用文件有变化的关系         | 26   |
| 被拒绝的认领或关系文件         | 5    |
| 新增未覆盖文件                 | 4    |

被拒绝项是栅格化器（已删除）的认领，以及这次发布删掉的四个关系文件。新文件中有三个组成了图册自己的组件，版式设计令牌则并入版式类。

@callout level=warning title="Archify 只检查区间是否存在"
| 重新固定后，偏移的引用会指向别的文字。要把它移到新区间，并重读每个被触及的引用。[](source:model-shifted) |

- [ ] 修改 `repository.revision` 之前，先运行 `archpub check --against <commit>`。[](source:model-repin)
- [ ] 为每个新增未覆盖文件加上认领，并复查每个文件有变化的关系。[](source:model-repin)
- [ ] 把每个偏移的引用移到新区间，并重读每个被触及的引用。[](source:model-shifted)
- [ ] 按新修订重新检查并构建，不留任何未覆盖文件。[](source:ops-check)
