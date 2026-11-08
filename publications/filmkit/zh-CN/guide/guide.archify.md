# filmkit 怎样从受版本管理的源文件重建带旁白的影片？ {#guide}

filmkit 从影片自己的仓库重建它的中文版和英文版。[](source:readme-what)它用锁定版本的本地语音合成模型朗读每份脚本，再为每个语言版拼接音轨、加字幕、渲染画面并打包。[](source:readme-what)每一步都记下所读内容的 SHA-256。记录若绑定了其他字节，后面的步骤会拒绝它。[](source:candidate-inputs)[](source:render-gate)

- [引擎不存放任何影片的内容](block:p-context)：脚本、配音设定、页面和画面合成都留在影片仓库里。[](source:readme-engine)
- [任何语音模型加载之前，先检查字词](block:p-words)；拒绝时列出每一项失败。[](source:narrate-gate)
- [录音只有完整收尾才能进入音轨](block:p-takes)，除非影片为它的衔接声明了尾音淡出。[](source:abrupt)
- [画面只有通过门禁才会渲染](block:p-picture)，门禁须针对当前的画面合成、时间线、样式表、字体和引擎版本。[](source:render-gate)

@answer scope="filmkit v0.16.0 · 提交 d6de895 · 其源码与自身文档"
@meta locale=zh-CN style=editorial
@source readme-what title="filmkit 做什么" path="README.md" lines=3:3
@source readme-engine title="引擎不带任何影片的内容" path="README.md" lines=5:5
@source readme-requirements title="运行要求" path="README.md" lines=9:12
@source readme-layout title="影片的目录结构" path="README.md" lines=18:26
@source readme-words title="概念与读音" path="README.md" lines=59:62
@source readme-neither title="两项检查都不声明的影片" path="README.md" lines=66:66
@source readme-gate title="画面门禁" path="README.md" lines=78:78
@source readme-metrics title="用影片的字体测量文字" path="README.md" lines=80:80
@source readme-balance title="每一帧的平衡" path="README.md" lines=82:82
@source readme-install title="在影片中安装引擎" path="README.md" lines=160:170
@source readme-commands title="命令" path="README.md" lines=176:192
@source readme-endings title="完整收尾" path="README.md" lines=196:198
@source readme-dev title="开发" path="README.md" lines=220:220
@source agents-contract title="引擎契约" path="AGENTS.md" lines=10:16
@source changelog-pin title="影片保留原有的锁定版本" path="CHANGELOG.md" lines=160:160
@source film-root title="查找影片" path="src/filmkit/repository.py" lines=28:50
@source film-load title="检查声明" path="src/filmkit/film.py" lines=379:394
@source edition-places title="语言版写到哪里" path="src/filmkit/production.py" lines=125:141
@source renditions title="四部交付成片" path="src/filmkit/production.py" lines=52:61
@source program-level title="统一的节目响度" path="src/filmkit/specification.py" lines=45:47
@source produce-actions title="制作动作" path="src/filmkit/produce.py" lines=63:89
@source narrate-gate title="语音合成之前的检查" path="src/filmkit/narration/narrate.py" lines=111:121
@source narrate-steps title="语音合成、对齐、转写" path="src/filmkit/narration/narrate.py" lines=54:108
@source concepts-doc title="概念检查" path="src/filmkit/concepts.py" lines=1:15
@source readings-doc title="读音检查" path="src/filmkit/narration/readings.py" lines=1:27
@source watch-list title="关注列表里的汉字" path="src/filmkit/narration/watched-characters.toml" lines=1:14
@source synthesis-plan title="每个段落的任务" path="src/filmkit/narration/synthesis.py" lines=176:194
@source synthesis-reuse title="复用或拒绝录音文件" path="src/filmkit/narration/synthesis.py" lines=197:225
@source one-model title="唯一运行语音合成模型的模块" path="src/filmkit/narration/group_generation.py" lines=1:4
@source thought-joins title="意群的请求、回执与衔接" path="src/filmkit/narration/thought_groups.py" lines=1:10
@source take-ending title="录音的收尾" path="src/filmkit/narration/take_edges.py" lines=159:186
@source retakes-doc title="绑定确切文本的重录" path="src/filmkit/narration/retakes.py" lines=1:9
@source run-on-doc title="连读录音" path="src/filmkit/narration/run_on.py" lines=1:8
@source audition-propose title="推荐的录音" path="src/filmkit/narration/audition.py" lines=86:112
@source transcription-doc title="转写只作替代指标" path="src/filmkit/narration/transcription.py" lines=1:10
@source selection title="选定录音文件" path="src/filmkit/narration/selection.py" lines=73:108
@source speech-refusals title="停顿上限与声明的术语" path="src/filmkit/narration/selection.py" lines=111:130
@source snapshots title="锁定版本的语音模型" path="src/filmkit/narration/snapshots.py" lines=58:86
@source supply-doc title="供给" path="src/filmkit/supply.py" lines=1:7
@source assembly-doc title="拼接" path="src/filmkit/soundtrack/assembly.py" lines=1:10
@source abrupt title="拒绝收尾突兀的录音" path="src/filmkit/soundtrack/assembly.py" lines=127:147
@source program-gain title="用一次增益达到节目响度" path="src/filmkit/soundtrack/assembly.py" lines=413:434
@source releases title="声明的尾音淡出" path="src/filmkit/soundtrack/policy.py" lines=159:170
@source captions-doc title="字幕定时" path="src/filmkit/captions/timing.py" lines=1:6
@source gate-doc title="画面门禁" path="src/filmkit/picture/gates.py" lines=1:36
@source frame-gates title="来自评审的规则" path="src/filmkit/picture/gates.py" lines=55:56
@source gate-check title="check-picture" path="src/filmkit/picture/gates.py" lines=368:440
@source candidate-inputs title="预置绑定的输入" path="src/filmkit/picture/rendering.py" lines=105:135
@source require-renderer title="唯一的渲染器版本" path="src/filmkit/picture/rendering.py" lines=191:201
@source stage title="画面的预置" path="src/filmkit/picture/rendering.py" lines=235:285
@source render-gate title="渲染须有通过的门禁" path="src/filmkit/picture/rendering.py" lines=471:498
@source render title="渲染画面" path="src/filmkit/picture/rendering.py" lines=501:555
@source validate title="校验画面" path="src/filmkit/picture/rendering.py" lines=586:596
@source equivalence-doc title="只在字幕上不同" path="src/filmkit/picture/equivalence.py" lines=1:28
@source tools-doc title="Node 工具运行器" path="src/filmkit/tools.py" lines=1:17
@source headless-doc title="无头运行的画面合成" path="src/filmkit/picture/headless-composition.mjs" lines=1:13
@source package-doc title="打包" path="src/filmkit/delivery/packaging.py" lines=1:24
@source delivered-check title="检查成片" path="src/filmkit/delivery/packaging.py" lines=464:495
@source package-film title="打包每部成片" path="src/filmkit/delivery/packaging.py" lines=530:565
@source package-inputs title="成片包绑定什么" path="src/filmkit/delivery/packaging.py" lines=225:236
@source player-doc title="播放器页面" path="src/filmkit/delivery/player.py" lines=1:5
@source verification-doc title="核验" path="src/filmkit/delivery/verification.py" lines=1:12
@source verify-review title="核验所验收的评审" path="src/filmkit/delivery/verification.py" lines=302:365
@source verification-qualify title="一个语言版的检查" path="src/filmkit/delivery/verification.py" lines=368:397
@source reproduction-doc title="复现" path="src/filmkit/delivery/reproduction.py" lines=1:24
@source documents-doc title="交付到 Documents 文件夹" path="src/filmkit/delivery/documents_folder.py" lines=1:27
@source round-doc title="一轮评审" path="src/filmkit/review/round.py" lines=1:11
@source human-listening title="人工试听保持独立" path="src/filmkit/review/round.py" lines=49:53
@source measurement-doc title="评审测量" path="src/filmkit/review/measurement.py" lines=1:22

## filmkit 读取什么，又把什么留给影片？ {#p-context}

影片就是存放 `content/film.toml` 的文件夹；引擎按 `FILMKIT_ROOT` 或工作目录找到它。[](source:film-root)影片在自己的 Python 项目里锁定引擎的一个发布标签。[](source:readme-install)

@diagram architecture id=context-map source=context.architecture.json title="filmkit 读取、运行和写出什么"

@steps id=context-steps
| step-ctx-film | 影片仓库 | 声明（含播放器配色），每个语言版的脚本、配音设定和旁白，以及画面的模板、脚本和样式。[](source:readme-layout) | context-map | ctx-film |
| step-ctx-engine | filmkit 引擎 | 每个动作只制作一个语言版，语言版由参数指定；任何工作开始前，先检查声明。渲染之前，`preflight` 报告每个过期或缺失的输入。[](source:produce-actions)[](source:film-load) | context-map | ctx-engine |
| step-ctx-supply | 供给步骤 | 唯一会访问网络的步骤。它按锁定的摘要检查浏览器构建和每个模型快照。[](source:supply-doc) | context-map | ctx-supply |
| step-ctx-models | 语音模型 | 语音合成模型负责朗读，强制对齐器为词定时，识别器负责转写，全部运行于 MLX。[](source:snapshots) | context-map | ctx-models |
| step-ctx-browser | HyperFrames、Chrome | 影片的 npm 包安装渲染器；除 HyperFrames 0.9.9 外，引擎拒绝其他任何版本。[](source:require-renderer) | context-map | ctx-browser |
| step-ctx-build | 构建文件夹 | 每个语言版的媒体和记录都写在影片的 `build/` 下，这个文件夹不纳入版本管理。[](source:edition-places) | context-map | ctx-build |
| step-ctx-documents | Documents 文件夹 | 交付用 rsync 同步 25 个交付项，再按各自源文件的 SHA-256 逐一检查。[](source:documents-doc) | context-map | ctx-documents |

## 一个语言版从脚本到交付成片，都经过什么？ {#p-route}

每条命令都在影片根目录运行，每个制作动作用 `--language zh|en` 指定语言版。[](source:readme-commands)

@workflow id=route-flow title="一个语言版，从脚本到交付成片"
| lane narration | 旁白 |
| lane sound | 声音 |
| lane picture | 画面 |
| lane delivery | 交付 |
| route-words | 检查字词 | security | narration | source:narrate-gate |
| route-narrate | 朗读每个意群 | backend | narration | source:synthesis-reuse |
| route-align | 对齐、转写 | backend | narration | source:narrate-steps |
| route-select | 选定录音 | security | sound | source:selection |
| route-assemble | 拼接音轨 | backend | sound | source:assembly-doc |
| route-gate | 检查画面 | security | picture | source:gate-check |
| route-render | 预置、渲染 | backend | picture | source:render |
| route-compare | 比对两份画面 | security | picture | source:equivalence-doc |
| route-package | 打包成片 | backend | delivery | source:package-film |
| route-verify | 核验每个输入 | security | delivery | source:verification-qualify |
| route-words > route-narrate | 通过 |
| route-narrate > route-align | |
| route-align > route-select | |
| route-select > route-assemble | |
| route-assemble > route-gate | |
| route-gate > route-render | 通过 | emphasis |
| route-render > route-compare | |
| route-compare > route-package | 通过 |
| route-package > route-verify | |

@steps id=route-steps
| step-route-words | 检查字词 | 旁白先做概念检查和读音检查，试运行也不例外；任何一项不通过，就停止。[](source:narrate-gate) | route-flow | route-words |
| step-route-narrate | 朗读每个意群 | 每个意群都是一条原生录音，出自配音设定的种子或重录。请求仍然一致的录音文件直接复用。[](source:synthesis-reuse) | route-flow | route-narrate |
| step-route-align | 对齐、转写 | 锁定版本的对齐器为每个词定时。转写结果只作读音的替代指标，不作认证。[](source:narrate-steps)[](source:transcription-doc) | route-flow | route-align |
| step-route-select | 选定录音 | `produce select` 把每份录音文件及其对齐结果，绑定到当前的脚本、配音设定和旁白参考录音。若录音文件违反影片的停顿上限，或声明术语读得与参照处不同，就拒绝这份录音文件。[](source:selection)[](source:speech-refusals) | route-flow | route-select |
| step-route-assemble | 拼接音轨 | 拼接步骤设计停顿，调平每个意群和章节，再用一次增益达到节目响度。若排好的音轨里有超出影片上限的无标点停顿，或声明术语读得与参照处不同，拼接步骤就拒绝这条音轨。[](source:assembly-doc)[](source:program-gain) | route-flow | route-assemble |
| step-route-gate | 检查画面 | `check-picture` 审查每一帧、每个标签的同步和动效，然后写出门禁记录。[](source:gate-doc) | route-flow | route-gate |
| step-route-render | 预置、渲染 | 带字幕和无字幕的画面各预置成一份文档；有了通过的门禁记录，才由 HyperFrames 渲染。[](source:stage)[](source:render-gate)[](source:render) | route-flow | route-render |
| step-route-compare | 比对两份画面 | 两份画面只能在字幕上不同：画面合成在每条字幕处和每半秒比对，解码后的帧则比对字幕带以外的区域。[](source:equivalence-doc) | route-flow | route-compare |
| step-route-package | 打包成片 | FFmpeg 把每部成片的画面（带字幕或无字幕）与音轨和章节封装在一起；每部成片都先检查，再链接到位。[](source:package-doc)[](source:package-film) | route-flow | route-package |
| step-route-verify | 核验每个输入 | 核验器只读取和解码。它检查来源、旁白、两份画面及其等效性、两个包、解码后的全部四部成片和评审。[](source:verification-doc) | route-flow | route-verify |

## 开始朗读之前，要检查什么？ {#p-words}

影片可以让自己的字词在任何朗读开始之前就能检查。[](source:readme-words)

@facts
| 概念 | 每个段落声明的概念在两个语言版中相同，并用认可的说法讲出。旁白、标题、字幕术语、发布文案、播放器摘要和画面源文件中，都不出现反例。[](source:concepts-doc) |
| 引文 | 有了源仓库的克隆，每条概念引文都必须出现在锁定提交下的对应文档里。[](source:concepts-doc) |
| 读音 | 关注列表里的每个汉字都落在一个已声明的词里，其读音必须是字典读音。字典按上下文另有读音的词，要记下原因。[](source:readings-doc)[](source:watch-list) |
| 名称 | 中文旁白里的每个拉丁字母单词，和每个至少含两个大写字母的英文单词，都要声明读法。[](source:readings-doc) |
| 术语 | 每种语言的文本规范化，都必须让每个声明的拉丁字母术语只有一种读法。凡是说到该术语的语言版，都必须包含它的参照处。[](source:readings-doc) |

@callout level=note title="一次拒绝列出每一项失败"
| 旁白在任何语音模型加载之前就停止，拒绝时一次列出所有失败。[](source:narrate-gate)两项检查都没声明的影片，照旧朗读。[](source:readme-neither) |

## 一个意群的录音怎样进入音轨？ {#p-takes}

如果一个意群的录音在最后一个音节中途结束，拼接步骤会拒绝它。[](source:readme-endings)

@diagram lifecycle id=take-life source=take.lifecycle.json title="一个意群的录音，从种子到音轨"

@steps id=take-steps
| step-take-narrated | 已朗读 | 意群的请求写明它的文本、朗读文本和种子。只有一个模块运行语音合成模型；每条录音与下一条之间，只靠补入的静音衔接。[](source:synthesis-plan)[](source:one-model)[](source:thought-joins) | take-life | take-narrated |
| step-take-judged | 已判定 | 录音最后 30 ms 安静，且最后一个音节渐渐消失而非戛然而止，才算自然收尾。[](source:take-ending) | take-life | take-judged |
| step-take-abrupt | 收尾突兀 | 拼接步骤列出每个收尾突兀的意群，并拒绝这个语言版。[](source:abrupt) | take-life | take-abrupt |
| step-take-auditioned | 已试音 | 试音用其他种子朗读，或者连读到下一个意群，再在静音处剪开。它在合格的录音中推荐差异单元最少的一条。绑定的重录保存其文本和朗读文本的 SHA-256。[](source:audition-propose)[](source:run-on-doc)[](source:retakes-doc) | take-life | take-auditioned |
| step-take-released | 尾音淡出 | 影片可以为某一处衔接声明不超过 0.3 s 的尾音淡出，拼接步骤让这段尾音渐隐进静音。[](source:releases) | take-life | take-released |
| step-take-selected | 已选定 | 选定步骤把每份录音文件及其对齐结果，绑定到当前的脚本、配音设定和旁白参考录音。[](source:selection) | take-life | take-selected |
| step-take-assembled | 已拼接 | 音轨的综合响度为 -16.5 LUFS，真峰值上限为 -1 dBTP。[](source:program-level)[](source:program-gain) | take-life | take-assembled |

@callout level=note title="录音为何会在音节中途结束"
| 在 mlx-audio 0.6.4 中，首个码本 id 为 0 的每一帧，都会让带参考上下文的录音结尾少掉 80 ms。[](source:readme-endings)修复已向上游提出，即 `Blaizzy/mlx-audio#1116`。 |

## 每份记录绑定什么？ {#p-records}

记录写明其步骤所读文件的 SHA-256；读取记录的步骤遇到其他字节就拒绝。[](source:candidate-inputs)[](source:render-gate)

@diagram erd id=records-erd source=records.erd.json title="每份记录绑定什么"

@steps id=records-steps
| step-rec-selection | narration-selected.json | 绑定脚本和配音设定，并按波形的 SHA-256 绑定每份录音文件。[](source:selection) | records-erd | rec-selection |
| step-rec-assembly | audio-assembly.json | 绑定脚本和它写出的音轨，以及设计停顿和节目响度。[](source:assembly-doc) | records-erd | rec-assembly |
| step-rec-stage | stage.json | 绑定脚本、时间线、拼接回执、音轨和来源清单，以及每个预置文件。[](source:candidate-inputs)[](source:stage) | records-erd | rec-stage |
| step-rec-gates | picture-gates.json | 绑定审查所依据的画面合成、时间线、样式表、字体和引擎版本。[](source:gate-check) | records-erd | rec-gates |
| step-rec-package | film-package.json | 绑定两份画面及其等效性记录、音轨、封面、脚本和章节，以及每部成片自身的 SHA-256。[](source:package-inputs)[](source:package-film) | records-erd | rec-package |

## 画面渲染之前，必须通过什么？ {#p-picture}

逐帧审查和动效审查在 canvas 替身上，无头运行影片自己的画面合成。[](source:headless-doc)

@sequence id=picture-flow title="从预置到校验通过的画面"
| actor pic-command | 制作命令 | frontend | source:produce-actions |
| actor pic-gate | 画面门禁 | security | source:gate-check |
| actor pic-tools | Node 工具运行器 | backend | source:tools-doc |
| actor pic-record | 门禁记录 | database | source:gate-doc |
| actor pic-render | 画面渲染 | backend | source:render |
| actor pic-hyperframes | HyperFrames | external | source:require-renderer |
| phase | 预置 |
| pic-command | pic-render | stage-picture |
| phase | 门禁 |
| pic-command | pic-gate | check-picture |
| pic-gate | pic-tools | 逐帧与动效审查 |
| pic-tools | pic-gate | 报告与轨迹 | return |
| pic-gate | pic-record | 通过或拒绝 |
| phase | 渲染 |
| pic-command | pic-render | render-picture |
| pic-render | pic-record | 读取记录 |
| pic-record | pic-render | 当前且通过 | return |
| pic-render | pic-hyperframes | 渲染预置文档 | emphasis |
| pic-hyperframes | pic-render | 画面 | return |
| phase | 校验 |
| pic-command | pic-render | validate-picture |

@steps id=picture-steps
| step-pic-stage | 画面渲染 | `stage-picture` 把时间线、脚本和样式内联进一份文档，并在 `stage.json` 中记下它的输入。[](source:stage) | picture-flow | pic-render | | pic-command-to-pic-render-1 |
| step-pic-gate | 画面门禁 | `check-picture` 用工具运行器执行逐帧审查和动效审查，再对它们的轨迹执行同步审查。[](source:gate-check)[](source:tools-doc) | picture-flow | pic-gate | | pic-command-to-pic-gate-1,pic-gate-to-pic-tools-1,pic-tools-to-pic-gate-1 |
| step-pic-record | 门禁记录 | 它绑定审查所依据的输入，并列出每个门禁发现项。片头声明的标题显示时间太短算一项，静止文字的对比度低于 4.5:1 也算一项。只要有一个门禁发现项，就拒绝渲染。[](source:gate-doc) | picture-flow | pic-record | | pic-gate-to-pic-record-1 |
| step-pic-render | HyperFrames | `render-picture` 若没有针对当前输入的通过记录，就拒绝。否则它渲染带字幕画面的完整超高清预置文档；加上 `--uncaptioned` 时，渲染无字幕画面的那一份。[](source:render-gate)[](source:render) | picture-flow | pic-hyperframes | | pic-render-to-pic-record-1,pic-record-to-pic-render-1,pic-render-to-pic-hyperframes-1,pic-hyperframes-to-pic-render-1 |
| step-pic-validate | 制作命令 | `validate-picture` 把画面绑定到它的回执和预置文档，并检查每一帧是否落在 60 fps 的网格上。[](source:validate) | picture-flow | pic-command | | pic-command-to-pic-render-3 |

@callout level=note title="可测量的规则，不是审美"
| 门禁拒绝的每一项逐帧发现项，都由 DDWG 评审转成交付影片必须遵守的规则。[](source:frame-gates)审美仍由评审判断。[](source:verification-doc) |

## 构建由哪些部件承担？ {#p-parts}

每个箭头都从一个部件指向它调用的部件。

@diagram architecture id=parts-map source=parts.architecture.json title="撑起一个语言版的部件"

@steps id=parts-steps
| step-part-narrate | 旁白命令 | 先做字词检查，再以独立进程依次运行语音合成、对齐和转写。[](source:narrate-steps) | parts-map | part-narrate |
| step-part-produce | 制作命令 | 调用某个动作的负责模块；拒绝时，报告该动作的名称和原因。[](source:produce-actions) | parts-map | part-produce |
| step-part-takes | 意群录音 | 每个意群的请求、回执和衔接，都按每份保留的记录重新检查。[](source:thought-joins) | parts-map | part-takes |
| step-part-sound | 音轨拼接 | 写出音轨、带字幕的时间线和拼接回执。[](source:assembly-doc) | parts-map | part-sound |
| step-part-gate | 画面门禁 | 写出门禁记录；只要还剩一个门禁发现项，就拒绝。[](source:gate-doc) | parts-map | part-gate |
| step-part-render | 画面渲染 | 预置、渲染并校验每份超高清画面（带字幕和无字幕各一份），并证明二者只在字幕上不同。[](source:render)[](source:equivalence-doc) | parts-map | part-render |
| step-part-package | 打包 | 派生观看包，写出全部四部成片，每部都先检查再链接到位。[](source:package-doc) | parts-map | part-package |
| step-part-verify | 核验 | 重新读取每份记录，解码全部四部成片；不写任何文件。[](source:verification-doc) | parts-map | part-verify |

## 交付的语言版包含什么，又怎样验收？ {#p-delivery}

交付把恰好 25 个交付项放进影片的 Documents 文件夹，再把它们读回。[](source:documents-doc)

@tree id=delivery-tree title="25 个交付项"
| dl-root | Documents 文件夹 | - |
| dl-entry | 语言选择页 | dl-root |
| dl-edition | zh 和 en 各一套 | dl-root |
| dl-uhd | 超高清母版 | dl-edition |
| dl-hd | 1080p 观看版 | dl-edition |
| dl-cover | 封面，PNG 和 JPEG | dl-edition |
| dl-subtitles | SRT 和 VTT | dl-edition |
| dl-transcript | 讲稿 | dl-edition |
| dl-chapters | 章节，JSON 和 FFmetadata | dl-edition |
| dl-player | 播放器页面 | dl-edition |

@steps id=delivery-steps
| step-dl-root | Documents 文件夹 | rsync 改动任何内容之前，真实浏览器先读回入口页和两个播放器，并播放每个播放器的全部四部成片。随后 rsync 复制字节不同的每个交付项，并把替换掉的每一项留作回滚副本。[](source:documents-doc) | delivery-tree | dl-root |
| step-dl-uhd | 超高清母版 | 一部带画面绘出的字幕，一部不带，各自复制自己那份渲染画面的视频流。全部四部成片都带相同的音轨、章节、封面和发布元数据标签。[](source:renditions)[](source:package-doc) | delivery-tree | dl-uhd |
| step-dl-hd | 1080p 观看版 | 每部都用 VideoToolbox 重新编码自己的画面，因此同一尺寸的两部成片，都以相同方式从各自画面制成。[](source:renditions) | delivery-tree | dl-hd |
| step-dl-player | 播放器页面 | 播放器由引擎渲染；影片只声明每个语言版的摘要和播放器的五种颜色。[](source:player-doc) | delivery-tree | dl-player |
| step-dl-chapters | 章节，JSON 和 FFmetadata | 每部成片的每条轨道都标明本语言版的语言。打包步骤原地写入章节轨的语言。[](source:delivered-check)[](source:package-doc) | delivery-tree | dl-chapters |

| 检查     | 读取什么                                                                                        | 通过意味着什么                                                                         |
| -------- | ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| 评审轮次 | 附有每部成片 SHA-256 的提示词，以及本轮的测量结果[](source:round-doc)[](source:measurement-doc) | 独立评审按每个声明的维度，为每个语言版打分 {good:已打分}                               |
| 核验     | 来源、旁白、渲染、包、解码后的成片和评审[](source:verification-qualify)[](source:verify-review) | 语言版绑定当前输入，其评审达到影片的评审下限 {good:已绑定}                             |
| 复现     | 发布清单和已发布资产[](source:reproduction-doc)                                                 | 重建结果保有已发布版本的解码音频、流、章节和标签，每一帧都达到 PSNR 下限 {good:已复现} |

## 已交付什么，还有什么未解决？ {#p-maturity}

引擎修改后，每部影片的输出字节保持不变，除非该发布版本另有说明。[](source:agents-contract)

| 方面           | 状态                              | 含义                                                                                                                                              |
| -------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| 平台           | Apple 芯片 {caution:仅一个平台}   | 语音模型运行于 MLX，1080p 成片用 VideoToolbox 编码。[](source:readme-requirements)                                                                |
| 样例影片       | 本地验收 {caution:不在 CI 中}     | 它的构建需要语音模型和浏览器构建，所以托管 CI 只运行可移植的证明。[](source:readme-dev)                                                           |
| 人工试听       | 单独进行 {caution:不计分}         | 评审依据自动化证据为音频打分；人工试听是之后的验收。[](source:human-listening)                                                                    |
| 录音收尾       | 有防护 {good:拒绝}                | 在 mlx-audio 的某个发布版本带上上游修复之前，试音负责保持完整收尾，拼接步骤拒绝收尾突兀的录音。[](source:readme-endings)[](source:abrupt)         |
| 文字宽度       | 实测 {good:影片自己的字体}        | 审查用影片自己的字体测量宽度；文字高度仍用估算值。[](source:readme-metrics)                                                                       |
| 静止时偏离中心 | 取代即拒绝 {caution:阶段内只记录} | 若阶段切换或下一个场景随后取代了这个状态，门禁就拒绝它。在本阶段之内，构图是已完成还是仍在搭建，只有该阶段的意图能说明。[](source:readme-balance) |
| 新的渲染器     | 锁定版本 {caution:由影片决定}     | 影片保持现有的 filmkit 锁定版本，直到它用新的发布版本制作、评审并验收一个语言版。[](source:changelog-pin)                                         |
