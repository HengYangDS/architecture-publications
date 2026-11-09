# filmkit concept renderings (zh-CN)

The renderings this edition fixes before translating, used everywhere in `zh/model.json` and `zh/overview.typ`. Source
names the file of `filmkit` at v0.16.0 (`d6de895`) that defines or uses the term. filmkit's own Chinese words come
from its player (`src/filmkit/delivery/player.py`) and its sample film (`examples/sample-film/`); the owner-approved
film editions are cited as `ethos-film` or `ddwg-film` with their file. An edition is one language version of a film
(中文版, 英文版); 版本 stays reserved for a software version. Commands, actions, flags, file names, record files
(`narration-selected`, `picture-gates`, `film-package` and the like) and product names stay in Latin type.

| English                                        | 中文                                 | Source                                                                                                         |
| ---------------------------------------------- | ------------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| edition; Chinese, English edition              | 语言版；中文版、英文版               | `README.md`; `src/filmkit/production.py`                                                                       |
| film                                           | 影片                                 | `src/filmkit/delivery/player.py`; `examples/sample-film/content/narration.md`                                  |
| the films (packaged, delivered); finished film | 成片                                 | `examples/sample-film/content/narration.md`; `src/filmkit/delivery/packaging.py`                               |
| UHD master                                     | 超高清母版                           | `src/filmkit/production.py`; `src/filmkit/delivery/player.py` (超高清 4K)                                      |
| 1080p film, viewing film                       | 1080p 观看版                         | `src/filmkit/delivery/player.py` (观看版 1080p)                                                                |
| tracked sources; sources                       | 受版本管理的源文件；源文件           | `examples/sample-film/content/narration.md`; `ethos-film` `picture/film.js` (受版本管理)                       |
| rebuild                                        | 重建                                 | `examples/sample-film/content/concepts.toml` (rebuild)                                                         |
| offline                                        | 不联网                               | `examples/sample-film/content/concepts.toml` (offline)                                                         |
| engine                                         | 引擎                                 | `README.md`                                                                                                    |
| declaration (`film.toml`)                      | 声明                                 | `src/filmkit/film.py`                                                                                          |
| file prefix                                    | 文件前缀                             | `README.md`                                                                                                    |
| player colours                                 | 播放器配色                           | `README.md`; `src/filmkit/film.py`                                                                             |
| source manifest; canonical sources             | 来源清单；来源                       | `src/filmkit/sources.py`                                                                                       |
| film repository                                | 影片仓库                             | `README.md`                                                                                                    |
| script                                         | 脚本                                 | `examples/sample-film/content/narration.md`; `README.md`                                                       |
| segment                                        | 段落                                 | `README.md`; `src/filmkit/concepts.py`                                                                         |
| thought (utterance group)                      | 意群                                 | `src/filmkit/narration/thought_groups.py`; `src/filmkit/narration/spoken_units.py`                             |
| narration; narrator                            | 旁白                                 | `examples/sample-film/content/narration.md`; `ethos-film` `content/film-script.json` (中文旁白)                |
| narrate                                        | 朗读                                 | `src/filmkit/narration/narrate.py`; `src/filmkit/narration/synthesis.py`                                       |
| voice (the narrator's)                         | 嗓音                                 | `examples/sample-film/content/narration.md`                                                                    |
| reference recording; narrator reference        | 参考录音；旁白参考录音               | `examples/sample-film/content/narration.md`; `README.md`                                                       |
| voice model (Qwen3-TTS)                        | 语音合成模型                         | `src/filmkit/narration/synthesis.py`; `src/filmkit/narration/voice_model.py`                                   |
| speech models                                  | 语音模型                             | `src/filmkit/supply.py`; `src/filmkit/narration/snapshots.py`                                                  |
| synthesis                                      | 语音合成                             | `src/filmkit/narration/synthesis.py`                                                                           |
| natively; native take                          | 一次读完；一次读完的录音             | `src/filmkit/narration/synthesis.py`; `src/filmkit/narration/thought_groups.py`                                |
| take (counted 条)                              | 录音                                 | `src/filmkit/narration/take_edges.py`                                                                          |
| recording (the audio file)                     | 录音文件                             | `src/filmkit/narration/thought_groups.py`; `src/filmkit/narration/receipts.py`                                 |
| seed                                           | 种子                                 | `examples/sample-film/content/narration.md`; `src/filmkit/narration/retakes.py`                                |
| retake                                         | 重录                                 | `src/filmkit/narration/retakes.py`                                                                             |
| cast                                           | 配音设定                             | `README.md`; `src/filmkit/narration/retakes.py`                                                                |
| audition                                       | 试音                                 | `src/filmkit/narration/audition.py`                                                                            |
| run-on take; read on                           | 连读录音；连读                       | `src/filmkit/narration/run_on.py`                                                                              |
| script edits                                   | 脚本修改                             | `src/filmkit/narration/script_edits.py`                                                                        |
| ends naturally; ends whole                     | 自然收尾；完整收尾                   | `src/filmkit/narration/take_edges.py`; `README.md`                                                             |
| abrupt                                         | 收尾突兀                             | `src/filmkit/soundtrack/assembly.py`                                                                           |
| release (declared, at a join)                  | 尾音淡出                             | `src/filmkit/soundtrack/policy.py`                                                                             |
| join (thought join)                            | 衔接                                 | `src/filmkit/narration/thought_groups.py`; `src/filmkit/soundtrack/policy.py`                                  |
| request fingerprint                            | 请求指纹                             | `src/filmkit/narration/synthesis.py`                                                                           |
| receipt (narration, render, assembly)          | 回执（旁白回执、渲染回执、拼接回执） | `src/filmkit/narration/receipts.py`; `src/filmkit/picture/rendering.py`                                        |
| record                                         | 记录                                 | `src/filmkit/picture/gates.py`                                                                                 |
| spoken text                                    | 朗读文本                             | `src/filmkit/narration/pronunciation.py`                                                                       |
| spoken units                                   | 朗读单元                             | `src/filmkit/narration/spoken_units.py`                                                                        |
| punctuation roles; thought spans               | 标点角色；意群跨度                   | `src/filmkit/narration/spoken_units.py`                                                                        |
| contract                                       | 契约                                 | `ddwg-film` `content/concepts.toml` (contract)                                                                 |
| pronunciation contract                         | 读音契约                             | `src/filmkit/narration/pronunciation.py`                                                                       |
| concept contract; concept                      | 概念契约；概念                       | `src/filmkit/concepts.py`                                                                                      |
| approved words; counterexample                 | 认可的说法；反例                     | `src/filmkit/concepts.py`                                                                                      |
| reading (of a character)                       | 读音                                 | `src/filmkit/narration/readings.py`                                                                            |
| spoken form (of a name)                        | 读法                                 | `src/filmkit/narration/readings.py`                                                                            |
| watch list; watched Chinese character          | 关注列表；关注列表里的汉字           | `src/filmkit/narration/watched-characters.toml`                                                                |
| term (declared Latin-script term)              | 术语（声明的拉丁字母术语）           | `src/filmkit/narration/terms.py`                                                                               |
| reference occurrence                           | 参照处                               | `src/filmkit/narration/terms.py`                                                                               |
| occurrence plan                                | 出现位置清单                         | `src/filmkit/narration/readings.py`                                                                            |
| word checks                                    | 字词检查                             | `src/filmkit/narration/narrate.py`                                                                             |
| dry run                                        | 试运行                               | `src/filmkit/narration/narrate.py`                                                                             |
| align; alignment; forced aligner               | 对齐；对齐结果；强制对齐器           | `src/filmkit/narration/alignment.py`                                                                           |
| transcribe; recognizer; recognition proxy      | 转写；识别器；识别的替代指标         | `src/filmkit/narration/transcription.py`                                                                       |
| select; selection                              | 选定；选定结果                       | `src/filmkit/narration/selection.py`                                                                           |
| heard pause; unmarked pause; pause limit       | 听得到的停顿；无标点停顿；停顿上限   | `src/filmkit/narration/flow.py`                                                                                |
| word boundary; steps between thoughts          | 词边界；意群之间的变化幅度           | `src/filmkit/narration/flow.py`                                                                                |
| designed pauses                                | 设计停顿                             | `src/filmkit/soundtrack/policy.py`                                                                             |
| assemble; assembly                             | 拼接                                 | `examples/sample-film/content/narration.md` (拼成); `src/filmkit/soundtrack/assembly.py`                       |
| soundtrack                                     | 音轨                                 | `examples/sample-film/content/narration.md`; `src/filmkit/soundtrack/assembly.py`                              |
| program level; gain                            | 节目响度；增益                       | `src/filmkit/specification.py`; `src/filmkit/soundtrack/assembly.py`                                           |
| timeline                                       | 时间线                               | `src/filmkit/picture/rendering.py`                                                                             |
| caption                                        | 字幕                                 | `src/filmkit/delivery/player.py` (字幕)                                                                        |
| cue                                            | 字幕条                               | `src/filmkit/captions/timing.py`                                                                               |
| subtitles (SRT, VTT files)                     | 字幕文件                             | `src/filmkit/delivery/packaging.py`                                                                            |
| transcript                                     | 讲稿                                 | `src/filmkit/delivery/player.py` (讲稿, 完整讲稿)                                                              |
| chapters; chapter track                        | 章节；章节轨                         | `src/filmkit/delivery/player.py`; `src/filmkit/delivery/track_language.py`                                     |
| cover                                          | 封面                                 | `src/filmkit/delivery/player.py` (封面)                                                                        |
| player                                         | 播放器                               | `src/filmkit/delivery/player.py`; `ddwg-film` `content/player.html`                                            |
| entry page; language page                      | 入口页；语言选择页                   | `src/filmkit/delivery/player.py` (选择语言); `src/filmkit/delivery/documents_folder.py`                        |
| picture                                        | 画面                                 | `src/filmkit/picture/gates.py`; `ethos-film` `content/film-script.json` (画面)                                 |
| composition (picture composition)              | 画面合成                             | `examples/sample-film/picture/film.js` (画面合成); `README.md`                                                 |
| gate; gate record                              | 门禁；门禁记录                       | `src/filmkit/picture/gates.py`                                                                                 |
| audit; frame, sync, motion audit               | 审查；逐帧、同步、动效审查           | `src/filmkit/picture/gates.py`; `src/filmkit/picture/sync_audit.py`                                            |
| ghosts, stalls, pops, jumps                    | 残影、停滞、突现、跳变               | `src/filmkit/picture/motion-audit.mjs`                                                                         |
| label; mark; at rest; contrast                 | 标签；标记；静止；对比度             | `src/filmkit/picture/sync_audit.py`; `src/filmkit/picture/text_trace.py`                                       |
| stage (verb, noun); staged picture             | 预置；预置画面                       | `src/filmkit/picture/rendering.py`                                                                             |
| render; renderer                               | 渲染；渲染器                         | `src/filmkit/picture/rendering.py`; `examples/sample-film/content/narration.md`                                |
| validate                                       | 校验                                 | `src/filmkit/picture/rendering.py`                                                                             |
| still picture; still scan                      | 静止画面；扫描                       | `src/filmkit/picture/still_scan.py`                                                                            |
| equivalence (captions only differ)             | 等效性                               | `src/filmkit/picture/equivalence.py`                                                                           |
| headless; canvas stand-in                      | 无头；canvas 替身                    | `src/filmkit/picture/headless-composition.mjs`; `src/filmkit/picture/metrics.py`                               |
| advance widths; faces, fonts                   | 步进宽度；字体                       | `src/filmkit/picture/metrics.py`                                                                               |
| whole turn; ink                                | 整圈弧线；墨迹                       | `src/filmkit/picture/whole-turns.mjs`; `src/filmkit/picture/gates.py`                                          |
| stylesheet                                     | 样式表                               | `src/filmkit/picture/gates.py`                                                                                 |
| Node tool runner; tool cache                   | Node 工具运行器；工具缓存            | `src/filmkit/tools.py`                                                                                         |
| package (verb); packaging                      | 打包                                 | `src/filmkit/delivery/packaging.py`; `examples/sample-film/content/narration.md`                               |
| film package; viewing package                  | 成片包；观看包                       | `src/filmkit/delivery/packaging.py`; `src/filmkit/delivery/verification.py`                                    |
| release metadata, release tags                 | 发布元数据标签                       | `src/filmkit/delivery/packaging.py`                                                                            |
| published release                              | 已发布版本                           | `src/filmkit/delivery/reproduction.py`; brief (release → 发布版本)                                             |
| verify; verification                           | 核验                                 | `src/filmkit/delivery/verification.py`; `ddwg-film` `content/concepts.toml` (verification)                     |
| narration custody                              | 旁白保管链                           | `src/filmkit/delivery/verification.py`                                                                         |
| reproduction                                   | 复现                                 | `src/filmkit/delivery/reproduction.py`                                                                         |
| deliver; delivery                              | 交付                                 | `src/filmkit/delivery/documents_folder.py`                                                                     |
| delivery members; read back                    | 交付项；读回                         | `src/filmkit/delivery/documents_folder.py`                                                                     |
| accept (a review)                              | 验收                                 | `src/filmkit/delivery/verification.py`; brief (acceptance → 验收)                                              |
| review; review round                           | 评审；评审轮次                       | `src/filmkit/review/round.py`                                                                                  |
| reviewer; independent reviewer                 | 评审人；独立评审人                   | `src/filmkit/review/prompts.py`                                                                                |
| review policy; review floors; dimensions       | 评审规则；评审下限；维度             | `README.md`; `src/filmkit/delivery/verification.py`                                                            |
| prompts                                        | 提示词                               | `src/filmkit/review/prompts.py`                                                                                |
| set-aside                                      | 封存                                 | `src/filmkit/review/round.py`                                                                                  |
| supply; digests; snapshot                      | 供应；摘要；快照                     | `src/filmkit/supply.py`; `src/filmkit/narration/snapshots.py`                                                  |
| browser build                                  | 浏览器构建                           | `src/filmkit/supply.py`                                                                                        |
| media probe; frame cadence                     | 媒体探测；帧节奏                     | `src/filmkit/media.py`                                                                                         |
| host tools                                     | 主机工具                             | `README.md`                                                                                                    |
| production command; production action          | 制作命令；制作动作                   | `src/filmkit/produce.py`                                                                                       |
| narration command                              | 旁白命令                             | `src/filmkit/narration/narrate.py`                                                                             |
| adapter                                        | 适配器                               | `ethos-film` `content/narration.md`                                                                            |
| film author                                    | 影片作者                             | `README.md` (guide)                                                                                            |
| build folder (`build/`); Documents folder      | 构建文件夹；Documents 文件夹         | `README.md`; `src/filmkit/delivery/documents_folder.py`                                                        |
| part (of the build, the guide's parts map)     | 部件                                 | guide (parts); the model's components stay 组件                                                                |
| release tag (the engine tag a film pins)       | 发布标签                             | `README.md`                                                                                                    |
| release manifest; published assets             | 发布清单；已发布资产                 | `src/filmkit/delivery/reproduction.py`                                                                         |
| release prose (synopsis, comment, description) | 发布文案                             | `README.md`; `src/filmkit/concepts.py`                                                                         |
| quotation (of a concept)                       | 引文                                 | `src/filmkit/concepts.py`                                                                                      |
| normalization (per language)                   | 文本规范化                           | `README.md`; `src/filmkit/narration/readings.py`                                                               |
| transcript (the recognizer's output)           | 转写结果                             | `src/filmkit/narration/transcription.py`; 讲稿 stays the delivered transcript                                  |
| differing units                                | 差异单元                             | `src/filmkit/narration/audition.py`                                                                            |
| in-context take; codebook id                   | 带参考上下文的录音；码本 id          | `README.md`                                                                                                    |
| integrated loudness; true-peak ceiling         | 综合响度；真峰值上限                 | `src/filmkit/specification.py`                                                                                 |
| mux                                            | 封装                                 | `src/filmkit/delivery/packaging.py`                                                                            |
| caption band                                   | 字幕带                               | `src/filmkit/picture/equivalence.py`                                                                           |
| finding; gated finding                         | 问题；门禁问题                       | `src/filmkit/picture/gates.py`                                                                                 |
| off-centre                                     | 偏离中心                             | `README.md`                                                                                                    |
| stage (of a scene); stage cut                  | 阶段；阶段切换                       | `README.md`; distinct from 预置 (staging the picture)                                                          |
| finished composition; build-up                 | 已完成的构图；仍在搭建               | `README.md`                                                                                                    |
| verifier                                       | 核验器                               | `src/filmkit/delivery/verification.py`                                                                         |
| taste; aesthetic judgment                      | 审美                                 | `src/filmkit/delivery/verification.py`; `src/filmkit/review/measurement.py`                                    |
| human listening                                | 人工试听                             | `src/filmkit/review/round.py`                                                                                  |
| sample film (page)                             | 样例影片                             | `examples/sample-film/` (its own title 示例影片; Archify's strict qualification rule refuses 示例 on the page) |
| portable proof; hosted CI; local acceptance    | 可移植的证明；托管 CI；本地验收      | `README.md`                                                                                                    |
| Apple silicon                                  | Apple 芯片                           | `README.md`                                                                                                    |
| PSNR floor                                     | PSNR 下限                            | `src/filmkit/delivery/reproduction.py`                                                                         |
