// Film Kit: the work's overview, composed with the house class.
#import "/archpub/house.typ": *
#show: overview

// ── Masthead ───────────────────────────────────────────────────────────────
#masthead([Film Kit], [每个语言版都从影片自己的源文件重建], [Film Kit 是本地运行的引擎：带旁白的讲解影片，每个语言版的朗读、拼接、字幕、门禁、渲染和打包都由它完成，每一步都记下所读内容的 SHA-256。], read-from: [依据 119 个文件写成，每个文件都按 SHA-256 引用。], claim-x: 124pt)

// ── Band 1: one edition's route, from the declaration to a compared rebuild ──
#let ys = 250pt
#let tr = 20pt
#head(48pt, 132pt, [影片])
#head(170pt, 132pt, [旁白])
#head(420pt, 132pt, [声音])
#head(660pt, 132pt, [画面])
#head(900pt, 132pt, [打包])
#head(1030pt, 132pt, [验收])
#head(1390pt, 132pt, [重建])
#tx(48pt, 152pt, [film.toml #box[及其指定的文件]], w: 110pt, fill: soft)
#tx(170pt, 152pt, "filmkit.narration.narrate", w: 240pt, fill: soft)
#tx(420pt, 152pt, "produce select, assemble, refresh-captions", w: 230pt, fill: soft)
#tx(660pt, 152pt, "预置、检查、渲染并校验画面", w: 230pt, fill: soft)
#tx(900pt, 152pt, "package-metadata, package-film", w: 120pt, fill: soft)
#tx(1030pt, 152pt, "review.round, delivery.verification, documents_folder", w: 350pt, fill: soft)
#tx(1390pt, 152pt, "delivery.reproduction", w: 162pt, fill: soft)

// The trunk carries what both editions share; zh and en take every step between.
#seg((96pt, ys), (262pt, ys), w: 4pt, c: green)
#seg((1000pt, ys), (1440pt, ys), w: 4pt, c: green)
#seg((262pt, ys), (282pt, ys - tr), (980pt, ys - tr), (1000pt, ys), w: 2.2pt, c: green)
#seg((262pt, ys), (282pt, ys + tr), (980pt, ys + tr), (1000pt, ys), w: 2.2pt, c: green)
#tx(266pt, 218pt, "zh", fill: mid, style: "italic")
#tx(266pt, 292pt, "en", fill: mid, style: "italic")
#let trunk = ((96pt, "声明", "content/film.toml", "ring"), (206pt, "检查字词", "出现位置清单", "tick"), (1070pt, "评审", "production-review", "tick"), (1190pt, "核验", "不写任何文件", "tick"), (1310pt, "交付", "delivery-readback", "ring"), (1440pt, "比对", "report.json", "ring"))
#let lanes = ((340pt, "朗读", "旁白回执", "ring"), (460pt, "选定", "narration-selected", "tick"), (580pt, "拼接", "时间线、音轨", "ring"), (700pt, "检查画面", "picture-gates", "tick"), (820pt, "渲染", "渲染回执", "ring"), (940pt, "打包", "film-package", "ring"))
#for (x, name, record, kind) in trunk {
  if kind == "ring" { ring(x, ys, r: 6pt, w: 2.4pt) } else { tick(x, ys, h: 15pt) }
  txc(x, 218pt, 112pt, name, weight: "semibold")
  txc(x, 292pt, 112pt, record, fill: soft)
}
#for (x, name, record, kind) in lanes {
  for dy in (-tr, tr) {
    if kind == "ring" { ring(x, ys + dy, r: 4.5pt, w: 1.8pt) } else { tick(x, ys + dy, h: 11pt) }
  }
  txc(x, 218pt, 112pt, name, weight: "semibold")
  txc(x, 292pt, 112pt, record, fill: soft)
}
#tx(48pt, 336pt, [zh 和 en 各自走完从“朗读”到“打包”的每一步。每份记录都绑定这一步所读内容的 SHA-256，绑定的字节对不上，后面的步骤就拒绝这份记录。], fill: ochre, style: "italic")

// Band 1 foot: what must hold before narration, and before the picture renders.
#hrule(354pt, x1: 776pt)
#hrule(354pt, x0: 824pt)
#head(48pt, 378pt, [开始朗读之前])
#dl(48pt, 402pt, 104pt, 728pt, (
  ([概念], [每个段落都用认可的说法讲到它声明的概念；任何地方都不能出现反例]),
  ([读音], [关注列表里的每个汉字都有声明的读音，每个名称都有读法]),
  ([朗读文本], [每份脚本对应一份读音契约，由它推导每个意群要说的话]),
  ([拒绝], [在任何语音模型加载之前就停止朗读，并列出每一项失败]),
))
#head(824pt, 378pt, [画面渲染之前])
#dl(824pt, 402pt, 110pt, 728pt, (
  ([逐帧审查], [每隔 1/30 s 查一帧：版面、易读性、平衡，以及文字是否对齐]),
  ([同步审查], [每个标签都对照读到它的词句；再查等待名称出现的标记]),
  ([文字测量], [第一个词之前，声明的标题要显示 1 s；静止文字的对比度不低于 4.5:1]),
  ([动效审查], [以每秒 30 帧查残影、停滞、突现、跳变和虚线突变]),
  ([门禁记录], [绑定画面合成、时间线、样式表、字体和引擎版本]),
))

// ── Band 2: the take a thought must give, and what each record binds ──────
#head(48pt, 510pt, [录音完整收尾，才能进入音轨])
#tx(48pt, 530pt, [完整收尾的录音，结尾是安静的：最后一个音节渐渐消失，而不是戛然而止。], fill: soft)
#let yk = 590pt
#seg((106pt, yk), (744pt, yk), w: 1.7pt, c: green)
#let steps = (
  (106pt, "种子", [配音设定的种子，#box[或一条重录]], "ring", 108pt),
  (236pt, "朗读", [#box[每个意群]#box[一次读完]], "tick", 110pt),
  (366pt, "判定", none, "tick", 0pt),
  (496pt, "选定", [#box[绑定到脚本]#box[和配音设定]], "tick", 110pt),
  (626pt, "拼接", [#box[设计停顿，]#box[统一增益]], "tick", 110pt),
)
#for (x, name, note, kind, nw) in steps {
  if kind == "ring" { ring(x, yk, r: 5pt, w: 2pt) } else { tick(x, yk, h: 12pt, w: 2pt) }
  txc(x, yk - 14pt, 110pt, name, weight: "semibold")
  if note != none { txc(x, yk + 24pt, nw, note, fill: soft) }
}
#ring(744pt, yk, r: 6pt, w: 2.4pt)
#txc(744pt, yk - 14pt, 80pt, [音轨], weight: "semibold")
#txc(744pt, yk + 24pt, 80pt, [-16.5 LUFS], fill: soft)
#tx(394pt, yk - 6pt, [自然收尾], fill: green, style: "italic")
#seg((366pt, yk + 6pt), (366pt, 672pt), (386pt, 672pt), w: 1.5pt, c: ochre, dash: (4pt, 3pt))
#ring(393pt, 672pt, r: 4.5pt, w: 1.7pt, c: ochre)
#tx(406pt, 668pt, [收尾突兀时，用其他种子试音，或连读到下一个意群、在静音处剪开，再把选中的种子绑定到这个意群的文本和朗读文本。影片若没有为这处衔接声明尾音淡出，拼接步骤就拒绝这条录音。], w: 370pt, fill: ochre)

#head(824pt, 510pt, [每份记录绑定什么])
#hrule(530pt, x0: 824pt)
#let records = (
  ([旁白回执], [每个意群的请求指纹、文本、种子和波形]),
  ([narration-selected], [脚本、配音设定、每份录音文件和旁白参考录音]),
  ([audio-assembly], [脚本、音轨、设计停顿和节目响度]),
  ([stage.json], [脚本、时间线、拼接回执、音轨和来源清单]),
  ([picture-gates], [画面合成、时间线、样式表、字体和引擎版本]),
  ([渲染回执], [预置的文档和渲染出的画面]),
  ([film-package], [两份画面及二者的等效性、音轨、封面、脚本和章节]),
)
#for (k, (what, binds)) in records.enumerate() {
  tx(824pt, 554pt + k * 18pt, what, weight: "semibold")
  tx(1000pt, 554pt + k * 18pt, binds, fill: soft)
}
#tx(824pt, 696pt, [核验重新读取每份记录并解码每部成片，不写任何文件。复现则把重建结果与已发布版本逐帧比对。], w: 728pt, fill: soft)

// ── Band 3: what the film holds, what is supplied, what is delivered ───────
#hrule(744pt)
#head(48pt, 770pt, [影片包含])
#dl(48pt, 794pt, 110pt, 460pt, (
  ([声明], [文件前缀、语言版、字体、播放器配色和评审规则]),
  ([脚本、配音设定], [每个语言版的文本、意群、种子和重录]),
  ([画面合成], [画面的模板、脚本和样式]),
))
#head(560pt, 770pt, [一次供应，此后不联网])
#dl(560pt, 794pt, 100pt, 470pt, (
  ([浏览器], [Chrome Headless Shell 152，由 HyperFrames 驱动]),
  ([语音], [Qwen3 语音合成、识别与对齐模型快照，运行于 MLX]),
  ([主机], [FFmpeg、ExifTool 和 rsync 3，来自 Homebrew]),
))
#head(1072pt, 770pt, [每个语言版的交付物])
#dl(1072pt, 794pt, 72pt, 480pt, (
  ([成片], [超高清母版和 1080p 观看版，各有带字幕和无字幕两种]),
  ([观看包], [封面、SRT、VTT、讲稿、章节和播放器]),
  ([入口], [一个语言选择页通向两个播放器]),
))

// ── Imprint ─────────────────────────────────────────────────────────────
#imprint([每个视图各有一幅图版；交互页面即导览，每项陈述都注明出处。])
