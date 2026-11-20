# Film Kit 怎样从受版本管理的源文件重建带旁白的影片？ {#guide}

Film Kit 从影片自己的仓库重建中文版和英文版。[](source:readme-what)先用锁定版本的本地语音合成模型朗读每份脚本，再为每个语言版拼接音轨、加字幕、渲染画面并打包。[](source:readme-what)每一步都记下所读内容的 SHA-256。记录绑定的字节一旦对不上，后面的步骤就拒绝它。[](source:candidate-inputs)[](source:render-gate)

- [引擎不存放任何影片的内容](block:p-context)：脚本、配音设定、页面和画面合成都留在影片仓库里。[](source:readme-engine)
- [任何语音模型加载之前，先检查字词](block:p-words)；拒绝时列出每一个失败项。[](source:narrate-gate)
- [录音只有自然收尾才能进入音轨](block:p-takes)，除非影片为它的衔接声明了尾音淡出。[](source:abrupt)
- [画面只有通过门禁才会渲染](block:p-picture)，而且门禁针对的必须是当前的画面合成、时间线、样式表、字体和引擎版本。[](source:render-gate)

@answer scope="Film Kit v0.24.1 · 提交 db7a837 · 源码及项目自带文档"
@meta locale=zh-CN style=editorial
@source readme-what title="Film Kit 做什么" path="README.md" lines=3:3
@source spec-rate title="帧率" path="src/filmkit/specification.py" lines=25:30
@source spec-sound title="采样率与节目响度" path="src/filmkit/specification.py" lines=33:47
@source sample-declaration title="样例影片的声明" path="examples/sample-film/content/film.toml" lines=6:23
@source changelog-010 title="0.1.0 的发布" path="CHANGELOG.md" lines=521:525
@source changelog-019 title="0.19.0 的改动" path="CHANGELOG.md" lines=234:249
@source changelog-020 title="0.20.0 的改动" path="CHANGELOG.md" lines=217:233
@source changelog-0211 title="0.21.1 的改动" path="CHANGELOG.md" lines=186:192
@source changelog-0212 title="0.21.2 的发布" path="CHANGELOG.md" lines=180:184
@source changelog-0213 title="0.21.3 的发布" path="CHANGELOG.md" lines=167:178
@source changelog-0220 title="0.22.0 的改动" path="CHANGELOG.md" lines=145:165
@source changelog-0221 title="0.22.1 的发布" path="CHANGELOG.md" lines=120:143
@source changelog-0222 title="0.22.2 的修复" path="CHANGELOG.md" lines=112:118
@source changelog-0223 title="0.22.3 的新增" path="CHANGELOG.md" lines=106:110
@source changelog-0230 title="0.23.0 的改动" path="CHANGELOG.md" lines=54:104
@source changelog-0231 title="0.23.1 的发布" path="CHANGELOG.md" lines=46:52
@source changelog-0240 title="0.24.0 的改动" path="CHANGELOG.md" lines=13:44
@source readme-engine title="引擎不带任何影片的内容" path="README.md" lines=5:5
@source readme-requirements title="运行要求" path="README.md" lines=9:12
@source readme-layout title="影片的目录结构" path="README.md" lines=18:26
@source readme-levels title="响度匹配的容差" path="README.md" lines=58:58
@source readme-words title="概念与读音" path="README.md" lines=74:77
@source readme-neither title="两项检查都不声明的影片" path="README.md" lines=81:81
@source readme-gate title="画面门禁" path="README.md" lines=113:113
@source readme-metrics title="用影片的字体测量文字" path="README.md" lines=115:115
@source readme-balance title="每一帧的平衡" path="README.md" lines=117:117
@source readme-install title="在影片中安装引擎" path="README.md" lines=251:263
@source readme-commands title="命令" path="README.md" lines=267:286
@source readme-endings title="完整收尾" path="README.md" lines=290:292
@source readme-dev title="开发" path="README.md" lines=316:316
@source agents-contract title="引擎契约" path="AGENTS.md" lines=10:16
@source changelog-pin title="影片保留原有的锁定版本" path="CHANGELOG.md" lines=421:421
@source film-root title="查找影片" path="src/filmkit/repository.py" lines=28:50
@source film-load title="检查声明" path="src/filmkit/film.py" lines=516:538
@source edition-places title="语言版写到哪里" path="src/filmkit/production.py" lines=163:179
@source renditions title="四部交付成片" path="src/filmkit/production.py" lines=87:99
@source program-level title="统一的节目响度" path="src/filmkit/specification.py" lines=45:47
@source produce-actions title="制作动作" path="src/filmkit/produce.py" lines=106:146
@source preflight-draft title="preflight 对草稿的要求" path="src/filmkit/preflight.py" lines=132:155
@source preflight-doc title="preflight 检查什么" path="src/filmkit/preflight.py" lines=1:40
@source narrate-gate title="语音合成之前的检查" path="src/filmkit/narration/narrate.py" lines=120:130
@source narrate-steps title="语音合成、对齐、转写" path="src/filmkit/narration/narrate.py" lines=63:117
@source concepts-doc title="概念检查" path="src/filmkit/concepts.py" lines=1:15
@source readings-doc title="读音检查" path="src/filmkit/narration/readings.py" lines=1:27
@source watch-list title="关注列表里的汉字" path="src/filmkit/narration/watched-characters.toml" lines=1:14
@source synthesis-plan title="每个段落的任务" path="src/filmkit/narration/synthesis.py" lines=256:274
@source synthesis-reuse title="复用或拒绝录音文件" path="src/filmkit/narration/synthesis.py" lines=277:305
@source narration-processes title="旁白的多个进程" path="src/filmkit/narration/processes.py" lines=1:21
@source one-model title="唯一运行语音合成模型的模块" path="src/filmkit/narration/group_generation.py" lines=1:4
@source thought-joins title="意群的请求、旁白记录与衔接" path="src/filmkit/narration/thought_groups.py" lines=1:10
@source take-ending title="录音的收尾" path="src/filmkit/narration/take_edges.py" lines=191:218
@source take-fall title="戛然而止的收尾" path="src/filmkit/narration/take_edges.py" lines=20:29
@source retakes-doc title="绑定确切文本的重录" path="src/filmkit/narration/retakes.py" lines=1:9
@source run-on-doc title="连读录音" path="src/filmkit/narration/run_on.py" lines=1:8
@source audition-propose title="推荐的录音" path="src/filmkit/narration/audition.py" lines=73:88
@source audition-doc title="试音凭什么认定录音合格" path="src/filmkit/narration/audition.py" lines=1:19
@source judgment-doc title="同一套录音判定" path="src/filmkit/narration/judgment.py" lines=1:44
@source judgment-units title="录音必须读出它的文本" path="src/filmkit/narration/judgment.py" lines=89:96
@source reading-units title="按读音比较的单元" path="src/filmkit/narration/recognition.py" lines=8:25
@source judge-doc title="判定旁白" path="src/filmkit/narration/judge.py" lines=1:18
@source converge-doc title="自行收敛的旁白" path="src/filmkit/narration/converge.py" lines=1:42
@source transcription-doc title="转写结果只是旁证" path="src/filmkit/narration/transcription.py" lines=1:17
@source selection title="选定录音文件" path="src/filmkit/narration/selection.py" lines=73:108
@source speech-refusals title="停顿上限与声明的术语" path="src/filmkit/narration/selection.py" lines=111:121
@source snapshots title="锁定版本的语音模型" path="src/filmkit/narration/snapshots.py" lines=58:86
@source supply-doc title="下载安装" path="src/filmkit/supply.py" lines=1:7
@source assembly-doc title="拼接" path="src/filmkit/soundtrack/assembly.py" lines=1:10
@source abrupt title="拒绝收尾突兀的录音" path="src/filmkit/soundtrack/assembly.py" lines=157:180
@source program-gain title="用一次增益达到节目响度" path="src/filmkit/soundtrack/assembly.py" lines=495:516
@source segment-level title="段落响度向所在章节看齐" path="src/filmkit/soundtrack/level.py" lines=171:199
@source clip-levels title="先匹配段落响度，再匹配章节响度" path="src/filmkit/soundtrack/assembly.py" lines=576:595
@source assembly-record title="拼接记录里的段落条目" path="src/filmkit/soundtrack/assembly.py" lines=424:444
@source releases title="声明的尾音淡出" path="src/filmkit/soundtrack/policy.py" lines=159:170
@source sound-gate title="声音门禁" path="src/filmkit/soundtrack/gates.py" lines=1:13
@source captions-doc title="字幕的起止时间" path="src/filmkit/captions/timing.py" lines=1:10
@source gate-doc title="画面门禁" path="src/filmkit/picture/gates.py" lines=1:42
@source frame-gates title="来自评审的规则" path="src/filmkit/picture/gates.py" lines=65:66
@source gate-check title="check-picture" path="src/filmkit/picture/gates.py" lines=418:498
@source detail-gates-doc title="细节检测的问题与例外" path="src/filmkit/picture/detail_gates.py" lines=1:16
@source candidate-inputs title="组装时绑定的输入" path="src/filmkit/picture/rendering.py" lines=84:114
@source rendering-doc title="组装、渲染与校验" path="src/filmkit/picture/rendering.py" lines=1:18
@source require-renderer title="唯一的 canvas 版本" path="src/filmkit/picture/renderer.py" lines=120:126
@source renderer-doc title="引擎的渲染器" path="src/filmkit/picture/renderer.py" lines=1:32
@source renderer-pin title="指定构建版本的 canvas" path="src/filmkit/picture/renderer.py" lines=51:70
@source receipt-renderer title="别的渲染器留下的渲染记录" path="src/filmkit/picture/renderer.py" lines=178:190
@source render-receipt title="渲染记录写明什么" path="src/filmkit/picture/renderer.py" lines=308:342
@source encoding title="画面的编码" path="src/filmkit/picture/encoding.py" lines=1:22
@source faces-doc title="字体只由一处读取" path="src/filmkit/picture/faces.py" lines=1:15
@source browser-doc title="各项检查所用的浏览器" path="src/filmkit/picture/browser.py" lines=1:7
@source stage title="画面的组装" path="src/filmkit/picture/rendering.py" lines=214:271
@source render-gate title="渲染须有通过的门禁" path="src/filmkit/picture/rendering.py" lines=383:410
@source render title="渲染画面" path="src/filmkit/picture/rendering.py" lines=413:429
@source validate title="校验画面" path="src/filmkit/picture/rendering.py" lines=470:495
@source equivalence-doc title="只在字幕上不同" path="src/filmkit/picture/equivalence.py" lines=1:40
@source derivation-doc title="派生的无字幕画面" path="src/filmkit/picture/derivation.py" lines=1:47
@source derivation-way title="派生还是渲染" path="src/filmkit/picture/derivation.py" lines=101:118
@source qualification-doc title="鉴定渲染器" path="src/filmkit/picture/qualification.py" lines=1:35
@source tools-doc title="Node 工具运行器" path="src/filmkit/tools.py" lines=1:26
@source durations-doc title="耗时记录" path="src/filmkit/durations.py" lines=1:41
@source headless-doc title="无头运行的画面合成" path="src/filmkit/picture/headless-composition.mjs" lines=1:13
@source detail-audit-doc title="细节检测" path="src/filmkit/picture/detail-audit.mjs" lines=1:16
@source package-doc title="打包" path="src/filmkit/delivery/packaging.py" lines=1:31
@source delivered-check title="检查成片" path="src/filmkit/delivery/packaging.py" lines=547:591
@source package-film title="打包每部成片" path="src/filmkit/delivery/packaging.py" lines=628:663
@source package-inputs title="成片包绑定什么" path="src/filmkit/delivery/packaging.py" lines=275:287
@source player-doc title="播放器页面" path="src/filmkit/delivery/player.py" lines=1:5
@source verification-doc title="核验" path="src/filmkit/delivery/verification.py" lines=1:18
@source verify-captions title="字幕文本须排印好" path="src/filmkit/delivery/verification.py" lines=79:94
@source verify-spotlight title="读回 Spotlight 导入的内容" path="src/filmkit/delivery/verification.py" lines=341:371
@source verify-review title="能通过核验的评审" path="src/filmkit/delivery/verification.py" lines=374:437
@source verification-qualify title="一个语言版的检查" path="src/filmkit/delivery/verification.py" lines=460:495
@source reproduction-doc title="复现" path="src/filmkit/delivery/reproduction.py" lines=1:27
@source documents-doc title="交付到影片的交付文件夹" path="src/filmkit/delivery/folder.py" lines=1:45
@source round-doc title="一轮评审" path="src/filmkit/review/round.py" lines=1:11
@source human-listening title="人工试听单独进行" path="src/filmkit/review/round.py" lines=49:53
@source measurement-doc title="评审测量" path="src/filmkit/review/measurement.py" lines=1:22
@source clarity-doc title="人声清晰度" path="src/filmkit/review/clarity.py" lines=1:21

## Film Kit 读取什么，又把什么留给影片？ {#p-context}

影片就是存放 `content/film.toml` 的文件夹；引擎按 `FILMKIT_ROOT` 或工作目录找到它。[](source:film-root)影片在自己的 Python 项目里锁定引擎的一个发布标签。[](source:readme-install)

@facts
| 帧率 | 60 fps；脚本声明其他帧率，引擎就拒绝 |
| 采样率 | 48 kHz |
| 节目响度 | -16.5 LUFS，真峰值不超过 -1 dBTP |
| 每个语言版的成片 | 4 部：超高清母版和 1080p 观看版，各有带字幕和无字幕两种 |

这些规格由引擎固定，影片只能照用。[](source:spec-rate)[](source:spec-sound)[](source:renditions)其余的都由影片在 `content/film.toml` 里声明，下面是仓库自带样例影片的声明。[](source:sample-declaration)

@code id=declaration source=sample-declaration language=toml

@diagram architecture id=context-map source=context.architecture.json title="Film Kit 读取、运行和写出什么"

@steps id=context-steps
| step-ctx-film | 影片仓库 | 声明（含播放器配色），每个语言版的脚本、配音设定和旁白，以及画面的模板、代码和样式。[](source:readme-layout) | context-map | ctx-film |
| step-ctx-engine | Film Kit 引擎 | 每个动作只做一个语言版，语言版由参数指定；开工之前先检查声明。[](source:produce-actions)[](source:film-load)渲染之前，`preflight` 报告所有过期或缺失的输入，其中包括声音门禁记录和几何检查记录。影片声明了草稿，才需要草稿的静止画面扫描；检查结果写成该语言版的就绪记录。[](source:preflight-doc)被扫描的草稿必须由引擎的渲染器绘制。[](source:preflight-draft) | context-map | ctx-engine |
| step-ctx-supply | 下载安装步骤 | 只有这一步会联网。指定构建版本的浏览器和每个模型快照，都按锁定的摘要检查。[](source:supply-doc) | context-map | ctx-supply |
| step-ctx-models | 语音模型 | 语音合成模型负责朗读，强制对齐器标出每个词的时间，识别器负责转写，全部运行于 MLX。[](source:snapshots) | context-map | ctx-models |
| step-ctx-browser | canvas、Chrome | 绘制画面用的 canvas 由影片的 npm 包安装，版本只能是 `@napi-rs/canvas` 1.1.1，引擎一律拒绝其他版本。[](source:require-renderer)[](source:renderer-pin)指定构建版本的浏览器只供检查：几何检查、整圈弧线门禁、封面检查和播放器检查。[](source:browser-doc) | context-map | ctx-browser |
| step-ctx-build | 构建文件夹 | 每个语言版的媒体和记录都写在影片的 `build/` 下，这个文件夹不纳入版本管理。[](source:edition-places) | context-map | ctx-build |
| step-ctx-documents | 交付文件夹 | 交付步骤用 rsync 同步 25 个交付项，再按各自源文件的 SHA-256 逐一检查。引擎不指定主机上的任何文件夹。文件夹名称由影片用 `delivery_folder` 这个键声明。[](source:documents-doc) | context-map | ctx-documents |

## 一个语言版从脚本到交付成片，要经过哪些步骤？ {#p-route}

每条命令都在影片根目录运行，每个制作动作都用 `--language zh|en` 指定语言版。[](source:readme-commands)

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
| route-render | 组装、渲染 | backend | picture | source:render |
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
| step-route-words | 检查字词 | 旁白命令先做概念检查和读音检查，试运行也不例外；任何一项不通过，就停止。[](source:narrate-gate) | route-flow | route-words |
| step-route-narrate | 朗读每个意群 | 每个意群都由模型一次读完，得到一条录音，种子或重录取自配音设定。请求仍然一致的录音文件直接复用。[](source:synthesis-reuse) | route-flow | route-narrate |
| step-route-align | 对齐、转写 | 锁定版本的对齐器标出每个词的起止时间。转写结果只是读音的旁证，不能证明读音正确。[](source:narrate-steps)[](source:transcription-doc)每份录音文件的转写结果按波形、语言和识别器标识缓存。[](source:transcription-doc) | route-flow | route-align |
| step-route-select | 选定录音 | `produce select` 把每份录音文件及其对齐结果，绑定到当前的脚本、配音设定和旁白参考录音。若录音文件超出影片的停顿上限，或已声明术语读得与参照处不同，就拒绝这份录音文件。[](source:selection)[](source:speech-refusals) | route-flow | route-select |
| step-route-assemble | 拼接音轨 | 拼接步骤设计停顿，匹配每个意群、段落和章节的响度，并用一次增益达到节目响度。若排好的音轨里有超出影片上限的无标点停顿，或已声明术语读得与参照处不同，拼接步骤就拒绝这条音轨。[](source:assembly-doc)[](source:clip-levels)[](source:program-gain)随后 `produce check-sound` 检查拼好的音轨。段落清晰度低于影片声明的下限、收尾突兀或被截断、短语戛然而止，都会被拒绝。[](source:sound-gate) | route-flow | route-assemble |
| step-route-gate | 检查画面 | `check-picture` 检测每一帧、每个标签的同步和动效，还检测单条线、逐步画出的线条和名称这三类细节，然后写出门禁记录。[](source:gate-doc)[](source:detail-gates-doc) | route-flow | route-gate |
| step-route-render | 组装、渲染 | 带字幕画面和无字幕画面各自组装；门禁记录写明通过之后，引擎的渲染器才在原生 canvas 上绘制带字幕的那一份。[](source:stage)[](source:render-gate)[](source:render)[](source:renderer-doc)影片声明软件捕获时，无字幕画面由带字幕画面派生：用 x264 重新编码一次，把字幕带所在的行涂成底色。其他情况下，无字幕画面也由渲染器绘制，加 `--native` 时同样如此。[](source:derivation-doc)派生得到的这一对画面依据派生记录比对，不解码任何画面。[](source:equivalence-doc) | route-flow | route-render |
| step-route-compare | 比对两份画面 | 渲染出的两份画面只能在字幕上不同：画面合成在每条字幕处、每隔半秒比对一次，解码后各帧只比对字幕带以外的行。随后逐帧扫描两份画面，找出只持续一帧的故障。同一次扫描还测量边缘细条：每帧最密集的一块里，相差超过 40 级的采样有多少。超出限值的帧会被拒绝。[](source:equivalence-doc) | route-flow | route-compare |
| step-route-package | 打包成片 | FFmpeg 把每部成片的画面（带字幕或无字幕）与音轨和章节封装在一起；每部成片都先检查，再链接到位。[](source:package-doc)[](source:package-film) | route-flow | route-package |
| step-route-verify | 核验每个输入 | 核验器读取并解码，检查范围包括来源、旁白、两份画面及二者的等效性、两个包、解码后的全部四部成片和评审。主机上有 `mdimport` 时，还读回 Spotlight 从每部成片导入的关键词和作者。[](source:verification-doc)[](source:verify-spotlight) | route-flow | route-verify |

## 开始朗读之前，要检查什么？ {#p-words}

影片可以要求在朗读开始之前，先检查它的字词。[](source:readme-words)

@facts
| 概念 | 每个段落声明的概念在两个语言版中相同，都要用认可的说法讲到。旁白、标题、字幕术语、发布文案、播放器摘要和画面源文件里，都不能出现声明为反例的说法。[](source:concepts-doc) |
| 引文 | 本地有来源仓库的克隆时，每条概念引文都必须能在锁定提交的对应文档里找到。[](source:concepts-doc) |
| 读音 | 关注列表中每个汉字都必须落在声明过的词里，这个词的读音必须是字典读音。字典按上下文读成别的音时，这个词要记下原因。[](source:readings-doc)[](source:watch-list) |
| 名称 | 中文旁白里的每个拉丁字母单词，和每个至少含两个大写字母的英文单词，都要声明读法。[](source:readings-doc) |
| 术语 | 每种语言的文本规范化，都必须让每个声明的拉丁字母术语只有一种读法。凡是说到该术语的语言版，都必须包含它的参照处。[](source:readings-doc) |

@callout level=note title="一次拒绝，列出全部失败项"
| 旁白命令在任何语音模型加载之前就停止，拒绝时一次列出所有失败项。[](source:narrate-gate)两项检查都没声明的影片，照旧朗读。[](source:readme-neither) |

## 一个意群的录音怎样进入音轨？ {#p-takes}

如果一个意群的录音在最后一个音节中途结束，拼接步骤会拒绝它。[](source:readme-endings)

@diagram lifecycle id=take-life source=take.lifecycle.json title="一个意群的录音，从种子到音轨"

@steps id=take-steps
| step-take-narrated | 已朗读 | 意群的请求写明它的文本、朗读文本和种子。只有一个模块运行语音合成模型；每条录音与下一条之间，只靠补入的静音衔接。[](source:synthesis-plan)[](source:one-model)[](source:thought-joins) | take-life | take-narrated |
| step-take-judged | 已判定 | 录音最后 30 ms 安静，且最后一个音节渐渐消失而非戛然而止，才算自然收尾。[](source:take-ending)最后一个响亮音节落到静音有多快，以及落下之前的浊音程度，都取 1 ms 帧网格上各相位的中位数。声音落下后若再次升起并渐渐消失，那是塞音除阻之前的闭塞，除阻才算收尾。[](source:take-fall) | take-life | take-judged |
| step-take-abrupt | 收尾突兀 | 拼接步骤列出每个收尾突兀的意群，并拒绝这个语言版。[](source:abrupt) | take-life | take-abrupt |
| step-take-auditioned | 已试音 | 试音换其他种子朗读，或者连读到下一个意群，再在静音处剪开。各判定项都不拒绝的录音才会被推荐，其中读出指定短语的优先。绑定的重录保存自身文本和朗读文本的 SHA-256。[](source:audition-propose)[](source:run-on-doc)[](source:retakes-doc) | take-life | take-auditioned |
| step-take-released | 尾音淡出 | 影片可以为某一处衔接声明不超过 0.3 s 的尾音淡出，拼接步骤让这段尾音渐隐进静音。[](source:releases) | take-life | take-released |
| step-take-selected | 已选定 | 选定步骤把每份录音文件及其对齐结果，绑定到当前的脚本、配音设定和旁白参考录音。[](source:selection) | take-life | take-selected |
| step-take-assembled | 已拼接 | 脚本的 `voice_performance` 可以声明 `segment_level_tolerance_db`，取值 0.1 到 3.0。[](source:readme-levels)段落内各意群响度匹配后的中位数，若与所在章节的中位数相差超过容差，拼接步骤就把该段落调到容差边缘。[](source:segment-level)这一步排在章节的响度匹配之前，只用一次不超过 2 dB 的静态增益，并让段落峰值低于 -1 dBFS。[](source:clip-levels)[](source:segment-level)音轨的综合响度为 -16.5 LUFS，真峰值上限为 -1 dBTP。[](source:program-level)[](source:program-gain) | take-life | take-assembled |

@facts
| 判定项 | 试音、`judge` 和 `converge` 共用同一套录音判定，共八个判定项：长度、收尾、短语结尾、开头、无标点停顿、已声明术语、差异单元和清晰度。[](source:judgment-doc)[](source:audition-doc) |
| 字词相符 | 录音转写结果按读音比较，不得有任何单元与文本不同；其余限值都取自影片的声明或引擎常量。[](source:judgment-units)[](source:judgment-doc)按读音比较时，读音相同的汉字算同一个单元，拉丁字母单元只比较其中的字母和数字。[](source:reading-units) |
| 清晰度 | 影片为单个意群声明了清晰度合格线，才判定录音的清晰度；只声明下限时，清晰度只记录、不判定。[](source:judgment-doc) |
| 选择 | 各判定项都不拒绝的录音里，先比余量，取最大者；余量相同再比收尾，取最安静者；仍相同就取最小种子。[](source:judgment-doc) |
| 收敛 | `python -m filmkit.narration.converge` 不需要影片作者给出试音目标文件、短语或种子，就把一个语言版的旁白定下来。[](source:converge-doc)它先朗读尚缺的部分，判定每个意群，再为被拒绝的意群生成候选录音，种子与试音相同。绑定通过判定且余量最大的候选录音，然后重新朗读、重新判定，最后再试连读录音。[](source:converge-doc)仍被拒绝的意群会被列为“按现有文本读不出合格录音”，任何判定项都不会为它放宽。[](source:converge-doc) |

@callout level=note title="录音为何会在音节中途结束"
| 在 mlx-audio 0.6.4 及更早版本中，首个码本 id 为 0 的每一帧，都会让带参考上下文的录音结尾少掉 80 ms。[](source:readme-endings)mlx-audio 0.6.5 已修复这个故障（`Blaizzy/mlx-audio#1116`），引擎现在锁定 0.6.6。影片若在自己的锁文件里保留更早的 mlx-audio，仍会遇到这个故障。[](source:readme-endings) |

## 每份记录绑定什么？ {#p-records}

每份记录写明这一步所读文件的 SHA-256；读取这份记录的步骤发现字节对不上，就拒绝。[](source:candidate-inputs)[](source:render-gate)

@diagram erd id=records-erd source=records.erd.json title="每份记录绑定什么"

@steps id=records-steps
| step-rec-selection | narration-selected.json | 绑定脚本和配音设定，并按波形的 SHA-256 绑定每份录音文件。[](source:selection) | records-erd | rec-selection |
| step-rec-assembly | audio-assembly.json | 绑定脚本和它写出的音轨，以及设计好的停顿和节目响度。[](source:assembly-doc)它把每个段落的增益记为 `segment_gain_db`。[](source:assembly-record) | records-erd | rec-assembly |
| step-rec-stage | stage.json | 绑定脚本、时间线、拼接记录、音轨和来源清单，以及组装出的每个文件。[](source:candidate-inputs)[](source:stage)它还写明渲染器注册的字体和画面所用的语言。[](source:stage) | records-erd | rec-stage |
| step-rec-gates | picture-gates.json | 绑定检测所依据的画面合成、时间线、样式表、字体和引擎版本。[](source:gate-check) | records-erd | rec-gates |
| step-rec-package | film-package.json | 绑定两份画面及其等效性记录、音轨、封面、脚本、章节和影片的 `VERSION`，以及每部成片自身的 SHA-256。[](source:package-inputs)[](source:package-film) | records-erd | rec-package |

@callout level=note title="耗时记录不绑定任何内容"
| 每个制作动作和每次旁白运行结束时都写一份耗时记录：哪条命令、用了多少秒、各环节各用多少秒。[](source:durations-doc)[](source:changelog-0230)记录还写明命令开始和结束时主机的 1 分钟平均负载，任何检查都不读取这一项。[](source:durations-doc)没有别的记录绑定它。`python -m filmkit.durations` 打印每个语言版的各条记录、各命令秒数之和，以及构建用时。[](source:durations-doc) |

## 画面渲染之前，必须通过什么？ {#p-picture}

逐帧检测、动效检测和细节检测用 canvas 替身，无头运行影片自己的画面合成。[](source:headless-doc)[](source:detail-audit-doc)

@sequence id=picture-flow title="从组装到校验通过的画面"
| actor pic-command | 制作命令 | frontend | source:produce-actions |
| actor pic-gate | 画面门禁 | security | source:gate-check |
| actor pic-tools | Node 工具运行器 | backend | source:tools-doc |
| actor pic-record | 门禁记录 | database | source:gate-doc |
| actor pic-render | 画面渲染 | backend | source:render |
| actor pic-renderer | 原生渲染器 | backend | source:renderer-doc |
| phase | 组装 |
| pic-command | pic-render | stage-picture |
| phase | 门禁 |
| pic-command | pic-gate | check-picture |
| pic-gate | pic-tools | 逐帧、动效与细节检测 |
| pic-tools | pic-gate | 报告与绘制记录 | return |
| pic-gate | pic-record | 通过或拒绝 |
| phase | 渲染 |
| pic-command | pic-render | render-picture |
| pic-render | pic-record | 读取记录 |
| pic-record | pic-render | 对应当前输入且通过 | return |
| pic-render | pic-renderer | 绘制组装好的画面 | emphasis |
| pic-renderer | pic-render | 画面与渲染记录 | return |
| phase | 校验 |
| pic-command | pic-render | validate-picture |

@steps id=picture-steps
| step-pic-stage | 画面渲染 | `stage-picture` 把时间线、脚本和样式内联进一份文档，并在 `stage.json` 中记下它的输入。[](source:stage)画面数据另存为 `film.json`，记录里还写明字体和语言。[](source:rendering-doc)[](source:stage) | picture-flow | pic-render | | pic-command-to-pic-render-1 |
| step-pic-gate | 画面门禁 | `check-picture` 用工具运行器同时执行逐帧检测、动效检测和细节检测，再对逐帧检测的绘制记录执行同步检测。[](source:gate-check)[](source:tools-doc) | picture-flow | pic-gate | | pic-command-to-pic-gate-1,pic-gate-to-pic-tools-1,pic-tools-to-pic-gate-1 |
| step-pic-record | 门禁记录 | 绑定检测所依据的输入，并列出每个门禁问题。已声明的标题在片头显示时间太短算一个，静止文字的对比度低于 4.5:1 也算一个。只要有一个门禁问题，就拒绝渲染。[](source:gate-doc)细节检测的问题和大幅偏离中心的时段，影片可以声明为例外并写明理由，门禁记录照此列出。[](source:detail-gates-doc) | picture-flow | pic-record | | pic-gate-to-pic-record-1 |
| step-pic-render | 原生渲染器 | `render-picture` 找不到当前输入的通过记录就拒绝，否则渲染组装好的完整超高清带字幕画面。[](source:render-gate)[](source:render)渲染器在 `@napi-rs/canvas` 的 canvas 上绘制，文字交给主机自带的文字渲染器；每一帧都送进 x264，全片分四段，再以流复制合并。[](source:renderer-doc)加 `--uncaptioned` 时，影片若声明软件捕获，且带字幕画面由指定构建版本的 canvas 绘制，无字幕画面就由带字幕画面派生。其余情况渲染它自己组装的那份无字幕画面，加 `--native` 时也一样。[](source:derivation-doc)[](source:derivation-way) | picture-flow | pic-renderer | | pic-render-to-pic-record-1,pic-record-to-pic-render-1,pic-render-to-pic-renderer-1,pic-renderer-to-pic-render-1 |
| step-pic-validate | 制作命令 | `validate-picture` 把画面绑定到它的渲染记录和组装好的文档，并检查每一帧是否落在 60 fps 网格上。派生的无字幕画面则绑定到它的派生记录。[](source:validate)渲染记录写明 canvas 包、渲染时加载的原生库、文字渲染器和全部所绘帧的摘要。[](source:render-receipt)记录里的 canvas 包、版本或文字渲染器不是引擎所用的，或关键帧偏离 2 s 网格，都拒绝。[](source:receipt-renderer)[](source:validate)[](source:encoding) | picture-flow | pic-command | | pic-command-to-pic-render-3 |

@callout level=note title="可测量的规则，不是审美"
| 门禁拒绝的每一项逐帧问题，都由 DDWG 评审转成了交付影片必须遵守的规则。[](source:frame-gates)审美仍由评审判断。[](source:verification-doc) |

## 构建靠哪些部件完成？ {#p-parts}

每个箭头都从一个部件指向它调用的部件。

@diagram architecture id=parts-map source=parts.architecture.json title="撑起一个语言版的部件"

@steps id=parts-steps
| step-part-narrate | 旁白命令 | 先做字词检查，再以独立进程依次运行语音合成、对齐和转写。[](source:narrate-steps) | parts-map | part-narrate |
| step-part-produce | 制作命令 | 调用负责该动作的模块；遇到拒绝时，报告动作名称和原因。[](source:produce-actions) | parts-map | part-produce |
| step-part-takes | 意群录音 | 每个意群的请求、旁白记录和衔接，都对照留存的每份记录重新检查。[](source:thought-joins)需要生成的段落分给语音合成模型的多个进程：主机每 16 GB 内存一个，最多三个。[](source:narration-processes) | parts-map | part-takes |
| step-part-judgment | 录音判定 | 按影片对录音的全部判定项，判定一个意群的一条录音；未通过哪几项，一次列全。[](source:judgment-doc)`python -m filmkit.narration.judge` 判定语言版旁白记录里的每个意群，并在旁白记录旁边写出 `judgment.json`。[](source:judge-doc) | parts-map | part-judgment |
| step-part-sound | 音轨拼接 | 写出音轨、带字幕的时间线和拼接记录。[](source:assembly-doc)每个字幕条的文本是对应短语的排印稿，直引号已换成弯引号。[](source:captions-doc)声音门禁按评审的测法读取段落清晰度。整条音轨的保留帧里，只取中心落在该段落内的帧。[](source:sound-gate)[](source:clarity-doc) | parts-map | part-sound |
| step-part-gate | 画面门禁 | 写出门禁记录；只要还剩一个门禁问题，就拒绝。[](source:gate-doc) | parts-map | part-gate |
| step-part-render | 画面渲染 | 组装并渲染带字幕的超高清画面，渲染或派生无字幕的那一份，校验两份画面，并证明二者只在字幕上不同。[](source:render)[](source:equivalence-doc)`qualify-renderer` 把组装好的带字幕画面再渲染一次，比对两次渲染的结果，所有行都参与比对。[](source:qualification-doc)第二次渲染换一个分段数，两次渲染所绘帧的摘要必须相同。[](source:qualification-doc)一个读者读出全部 `@font-face` 规则，供检测用的文字宽度表和渲染器共用；canvas 无法照办的规则，它也点名拒绝。[](source:faces-doc) | parts-map | part-render |
| step-part-renderer | 原生渲染器 | 在原生 canvas 上绘制组装好的画面，不用浏览器，每一帧都送进 x264 编码器。[](source:renderer-doc)引擎锁定 `@napi-rs/canvas` 1.1.1；在 Apple 芯片上，还锁定它原生库的 SHA-256。[](source:renderer-pin) | parts-map | part-renderer |
| step-part-package | 打包 | 派生观看包，写出全部四部成片，每部都先检查再链接到位。每部成片和每个页面都写明影片的版本号。[](source:package-doc) | parts-map | part-package |
| step-part-verify | 核验 | 重新读取每份记录，解码全部四部成片；它只写一个文件，即每个语言版的耗时记录。[](source:verification-doc)字幕条的文本若没有排印好，就拒绝。[](source:verify-captions) | parts-map | part-verify |

## 交付的语言版包含什么，又怎样验收？ {#p-delivery}

交付步骤把恰好 25 个交付项放进影片的交付文件夹，再把它们读回。[](source:documents-doc)

@tree id=delivery-tree title="25 个交付项"
| dl-root | 交付文件夹 | - |
| dl-entry | 入口页（选择语言） | dl-root |
| dl-edition | zh 和 en 各一套 | dl-root |
| dl-uhd | 超高清母版 | dl-edition |
| dl-hd | 1080p 观看版 | dl-edition |
| dl-cover | 封面，PNG 和 JPEG | dl-edition |
| dl-subtitles | SRT 和 VTT | dl-edition |
| dl-transcript | 讲稿 | dl-edition |
| dl-chapters | 章节，JSON 和 FFmetadata | dl-edition |
| dl-player | 播放器页面 | dl-edition |

@steps id=delivery-steps
| step-dl-root | 交付文件夹 | 文件夹由 `--destination` 指定；否则取影片声明的名称，放在 `FILMKIT_DELIVERY_ROOT` 所指根目录之下，没有该设置就放在用户的视频文件夹下。不该用作交付文件夹的目的地一律拒绝，例如影片根目录或它里面的文件夹。rsync 改动任何内容之前，真实浏览器先读回入口页和两个播放器，并播放每个播放器的全部四部成片。随后 rsync 复制字节不同的每个交付项，并把替换掉的每一项留作回滚副本。[](source:documents-doc) | delivery-tree | dl-root |
| step-dl-uhd | 超高清母版 | 一部的字幕绘在画面上，一部不带字幕，各自复制自己那份画面的视频流。全部四部成片的音轨、章节、封面和发布元数据标签都相同。[](source:renditions)[](source:package-doc) | delivery-tree | dl-uhd |
| step-dl-hd | 1080p 观看版 | 每部都经软件解码，按每 2×2 像素块取平均，再用 x264 编码，每 2 s 强制一个关键帧。同一尺寸的两部成片，都以相同方式从各自画面制成。无字幕画面由派生得到时，无字幕的 1080p 观看版改为读取带字幕画面，并像派生时那样涂掉字幕带。[](source:renditions)任何成片都不得含 B 帧。[](source:delivered-check) | delivery-tree | dl-hd |
| step-dl-player | 播放器页面 | 播放器由引擎渲染；影片只声明每个语言版的摘要和播放器的五种颜色。[](source:player-doc) | delivery-tree | dl-player |
| step-dl-chapters | 章节，JSON 和 FFmetadata | 每部成片的每条轨道都标明所属语言版的语言。打包步骤原地写入章节轨的语言。[](source:delivered-check)[](source:package-doc) | delivery-tree | dl-chapters |

| 检查     | 读取什么                                                                                                                                         | 通过意味着什么                                                                             |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| 评审轮次 | 附有每部成片 SHA-256 的提示词，以及本轮的测量结果[](source:round-doc)[](source:measurement-doc)                                                  | 独立评审按每个声明的维度，为每个语言版打分 {good:已打分}                                   |
| 核验     | 来源、旁白、渲染、包、解码后的成片、Spotlight 导入的内容和评审[](source:verification-qualify)[](source:verify-spotlight)[](source:verify-review) | 语言版绑定当前输入，评审达到影片的评审下限 {good:已绑定}                                   |
| 复现     | 发布清单和已发布资产[](source:reproduction-doc)                                                                                                  | 重建结果的解码音频、流、章节和标签都与已发布版本一致，每一帧都达到 PSNR 下限 {good:已复现} |

## Film Kit 怎样走到今天？ {#p-history}

Film Kit 在 2026 年 10 月 30 日发布 v0.1.0，11 月 19 日发布 v0.24.0。[](source:changelog-010)[](source:changelog-0240)时间线列出改变影片制作方式的二十个版本，最近三个是 v0.23.0、v0.23.1 和 v0.24.0。[](source:changelog-0230)[](source:changelog-0231)[](source:changelog-0240)时间线上还有补丁版本 v0.21.1 和 v0.21.2，它们只更新了仓库工具链和锁定的依赖包。[](source:changelog-0211)[](source:changelog-0212)v0.21.3 也是如此，没有列入时间线。[](source:changelog-0213)

v0.22.1 把渲染器换成 HyperFrames 0.9.46，样例影片的十二部成片解码后各帧不变。[](source:changelog-0221)这个版本也没有列入时间线。仓库里没有带日期的路线图，还没做的事列在本页最后。

@diagram timeline id=history source=history.timeline.json title="Film Kit 怎样走到今天"

## 已交付什么，还有什么未解决？ {#p-maturity}

引擎改动不会改变任何影片的输出字节，除非该发布版本另有说明。[](source:agents-contract)

| 方面           | 状态                            | 含义                                                                                                                                                                                                                                                                   |
| -------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 平台           | Apple 芯片 {caution:仅一个平台} | 语音模型运行于 MLX，所以引擎需要 Apple 芯片的 Mac。[](source:readme-requirements)                                                                                                                                                                                      |
| 样例影片       | 本地验收 {caution:不在 CI 中}   | 构建它需要语音模型和指定构建版本的浏览器，所以托管 CI 只运行可移植的证明。[](source:readme-dev)                                                                                                                                                                        |
| 人工试听       | 单独进行 {caution:不计分}       | 评审依据自动化证据为音频打分；人工试听是之后的验收。[](source:human-listening)                                                                                                                                                                                         |
| 录音收尾       | 有防护 {good:拒绝}              | mlx-audio 0.6.5 已包含上游的修复，引擎锁定 0.6.6。录音仍可能因别的原因在最后一个音节中途结束，所以仍靠试音保证自然收尾，拼接步骤拒绝收尾突兀的录音。[](source:readme-endings)[](source:abrupt)                                                                         |
| 文字宽度       | 实测 {good:影片自己的字体}      | 检测时用影片自己的字体测量文字宽度；文字高度仍用估算值。[](source:readme-metrics)                                                                                                                                                                                      |
| 静止时偏离中心 | 一律拒绝 {good:不论后续}        | 偏离中心超过 50 px、持续不少于 2 s 的静止状态，门禁一律拒绝。不论画面随后在它之上继续扩展，还是停在本阶段之内，或被阶段切换、下一个场景取代，都不例外。[](source:readme-balance)                                                                                       |
| 新的渲染器     | 锁定版本 {caution:由影片决定}   | 影片继续锁定现有的 `filmkit` 版本，直到用新的发布版本制作、评审并验收一个语言版。[](source:changelog-pin)采用 v0.24.0 的影片要声明 `@napi-rs/canvas` 1.1.1 并重新渲染画面：渲染记录里没有写明 canvas，校验就拒绝。[](source:readme-install)[](source:receipt-renderer) |
