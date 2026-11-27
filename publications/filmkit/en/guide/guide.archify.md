# How does Film Kit rebuild a narrated film from its tracked sources? {#guide}

Film Kit rebuilds a film's editions, one for each language the film declares, from the film's own repository.[](source:readme-what) It narrates each script with a local speech model, then assembles, captions, renders and packages each edition.[](source:readme-what) Each step records the SHA-256 of what it read, and a later step refuses a record bound to other bytes.[](source:candidate-inputs)[](source:render-gate)

- [The engine holds no film's content](block:p-context): scripts, casts, pages and the picture's composition stay in the film's repository.[](source:readme-engine)
- [The sources are checked before any speech model loads](block:p-words), and the check names every finding at once.[](source:check-doc)[](source:narrate-gate)
- [A take reaches the soundtrack only if it ends naturally](block:p-takes), or if the film declares a tail release for its join.[](source:abrupt)
- [The picture renders only after its gate passes](block:p-picture) for the current composition, timeline, stylesheet, fonts and engine version.[](source:render-gate)

@answer scope="Film Kit v0.35.0 · commit 8ef48f3 · its source and its own documents"
@meta locale=en style=editorial
@source readme-what title="What Film Kit does" path="README.md" lines=3:3
@source spec-rate title="Frame rate" path="src/filmkit/film.py" lines=43:44
@source withdrawn-fps title="A script declares no frame rate" path="src/filmkit/withdrawn.py" lines=51:56
@source spec-sound title="Sample rate and program level" path="src/filmkit/specification.py" lines=29:41
@source sample-declaration title="The sample film's declaration" path="examples/sample-film/content/film.toml" lines=6:29
@source changelog-010 title="The 0.1.0 release" path="CHANGELOG.md" lines=765:769
@source changelog-019 title="The 0.19.0 changes" path="CHANGELOG.md" lines=478:493
@source changelog-020 title="The 0.20.0 changes" path="CHANGELOG.md" lines=461:477
@source changelog-0211 title="The 0.21.1 changes" path="CHANGELOG.md" lines=430:436
@source changelog-0212 title="The 0.21.2 release" path="CHANGELOG.md" lines=424:428
@source changelog-0213 title="The 0.21.3 release" path="CHANGELOG.md" lines=411:422
@source changelog-0220 title="The 0.22.0 changes" path="CHANGELOG.md" lines=389:409
@source changelog-0221 title="The 0.22.1 release" path="CHANGELOG.md" lines=364:387
@source changelog-0222 title="The 0.22.2 fixes" path="CHANGELOG.md" lines=356:362
@source changelog-0223 title="The 0.22.3 addition" path="CHANGELOG.md" lines=350:354
@source changelog-0230 title="The 0.23.0 changes" path="CHANGELOG.md" lines=298:348
@source changelog-0231 title="The 0.23.1 release" path="CHANGELOG.md" lines=290:296
@source changelog-0240 title="The 0.24.0 changes" path="CHANGELOG.md" lines=257:288
@source changelog-0250 title="The 0.25.0 changes" path="CHANGELOG.md" lines=226:249
@source changelog-0260 title="The 0.26.0 changes" path="CHANGELOG.md" lines=204:224
@source changelog-0261 title="The 0.26.1 release" path="CHANGELOG.md" lines=197:202
@source changelog-0270 title="The 0.27.0 changes" path="CHANGELOG.md" lines=175:195
@source changelog-0280 title="The 0.28.0 changes" path="CHANGELOG.md" lines=162:173
@source changelog-0290 title="The 0.29.0 changes" path="CHANGELOG.md" lines=143:160
@source changelog-0300 title="The 0.30.0 changes" path="CHANGELOG.md" lines=128:141
@source changelog-0310 title="The 0.31.0 changes" path="CHANGELOG.md" lines=102:126
@source changelog-0320 title="The 0.32.0 changes" path="CHANGELOG.md" lines=87:100
@source changelog-0330 title="The 0.33.0 changes" path="CHANGELOG.md" lines=70:85
@source changelog-0340 title="The 0.34.0 changes" path="CHANGELOG.md" lines=40:68
@source changelog-0341 title="The 0.34.1 release" path="CHANGELOG.md" lines=25:38
@source changelog-0342 title="The 0.34.2 release" path="CHANGELOG.md" lines=19:23
@source changelog-0350 title="The 0.35.0 changes" path="CHANGELOG.md" lines=7:17
@source changelog-050 title="The 0.5.0 note on endings" path="CHANGELOG.md" lines=705:705
@source readme-engine title="The engine carries no film's content" path="README.md" lines=5:5
@source readme-requirements title="Requirements" path="README.md" lines=9:12
@source readme-layout title="A film's layout" path="README.md" lines=30:40
@source readme-levels title="Segment level tolerance" path="src/filmkit/soundtrack/policy.py" lines=204:206
@source readme-metrics title="Text measured with the film's fonts" path="src/filmkit/picture/frame-audit/typography/index.mjs" lines=7:10
@source readme-balance title="Balance in every frame" path="src/filmkit/picture/rules/balance.mjs" lines=74:85
@source readme-install title="Installing the engine in a film" path="README.md" lines=16:26
@source readme-commands title="Commands" path="README.md" lines=58:77
@source readme-dev title="Development" path="CONTRIBUTING.md" lines=50:52
@source agents-contract title="The engine contract" path="AGENTS.md" lines=10:16
@source changelog-pin title="A film keeps its pin" path="CHANGELOG.md" lines=665:665
@source film-root title="Finding the film" path="src/filmkit/repository.py" lines=41:63
@source film-load title="Checking the declaration" path="src/filmkit/film.py" lines=749:760
@source languages-doc title="One declaration per language" path="src/filmkit/languages/en.toml" lines=1:3
@source film-editions title="A film's editions" path="src/filmkit/film.py" lines=649:653
@source edition-places title="Where an edition writes" path="src/filmkit/production.py" lines=231:247
@source cli-doc title="The verbs" path="src/filmkit/graph/cli.py" lines=1:54
@source build-doc title="Building from the run records" path="src/filmkit/graph/build.py" lines=1:34
@source plan-doc title="A node's state" path="src/filmkit/graph/plan.py" lines=1:22
@source records-doc title="The run record" path="src/filmkit/graph/records.py" lines=1:18
@source runs-doc title="A run measured and recorded" path="src/filmkit/graph/runs.py" lines=1:30
@source verify-doc title="filmkit verify" path="src/filmkit/graph/verify.py" lines=1:13
@source renditions title="The four delivered films" path="src/filmkit/production.py" lines=124:136
@source program-level title="One program level" path="src/filmkit/specification.py" lines=39:41
@source narrate-gate title="Narration waits for the source check" path="src/filmkit/narration/narrate.py" lines=7:11
@source narrate-steps title="Synthesis, alignment, transcription" path="src/filmkit/narration/narrate.py" lines=62:118
@source check-doc title="The source check" path="src/filmkit/check.py" lines=1:30
@source concepts-doc title="The concept check" path="src/filmkit/concepts.py" lines=1:17
@source register-doc title="A form kept at its place" path="src/filmkit/film.py" lines=555:560
@source readings-doc title="The readings check" path="src/filmkit/narration/readings.py" lines=1:31
@source watch-list title="The watched characters" path="src/filmkit/narration/watched-characters.toml" lines=1:14
@source anchors-doc title="Anchors" path="src/filmkit/narration/anchors.py" lines=1:40
@source anchor-reads-doc title="What a picture reads of its anchors" path="src/filmkit/picture/anchor_reads.py" lines=1:22
@source synthesis-plan title="Each segment's job" path="src/filmkit/narration/synthesis.py" lines=261:280
@source synthesis-reuse title="Reuse or refuse a recording" path="src/filmkit/narration/synthesis.py" lines=283:311
@source narration-processes title="A narration's processes" path="src/filmkit/narration/processes.py" lines=1:21
@source one-model title="The only module that runs the voice model" path="src/filmkit/narration/group_generation.py" lines=1:4
@source thought-joins title="Thought requests, receipts and joins" path="src/filmkit/narration/thought_groups.py" lines=1:10
@source take-ending title="A take's ending" path="src/filmkit/narration/take_edges.py" lines=191:218
@source take-fall title="A stopped ending" path="src/filmkit/narration/take_edges.py" lines=20:29
@source retakes-doc title="Retakes bound to exact text" path="src/filmkit/narration/retakes.py" lines=1:9
@source run-on-doc title="Run-on takes" path="src/filmkit/narration/run_on.py" lines=1:8
@source audition-propose title="The proposed take" path="src/filmkit/narration/audition.py" lines=77:96
@source audition-doc title="What an audition qualifies a take by" path="src/filmkit/narration/audition.py" lines=1:22
@source judgment-doc title="One judgment of a take" path="src/filmkit/narration/judgment.py" lines=1:50
@source judgment-units title="A take held to its words" path="src/filmkit/narration/judgment.py" lines=107:114
@source hearings-doc title="The author's hearings" path="src/filmkit/narration/hearings.py" lines=1:17
@source reading-units title="Units compared by reading" path="src/filmkit/narration/recognition.py" lines=8:43
@source judge-doc title="Judging a narration" path="src/filmkit/narration/judge.py" lines=1:23
@source converge-doc title="A narration that settles by itself" path="src/filmkit/narration/converge.py" lines=1:66
@source transcription-doc title="Transcription as a proxy" path="src/filmkit/narration/transcription.py" lines=1:20
@source selection title="Selecting the recordings" path="src/filmkit/narration/selection.py" lines=84:124
@source speech-refusals title="Pause limits and declared terms" path="src/filmkit/narration/selection.py" lines=127:137
@source snapshots title="The pinned speech models" path="src/filmkit/narration/snapshots.py" lines=58:86
@source supply-doc title="The supply" path="src/filmkit/supply.py" lines=1:12
@source assembly-doc title="The assembly" path="src/filmkit/soundtrack/assembly.py" lines=1:14
@source abrupt title="Abrupt takes refused" path="src/filmkit/soundtrack/assembly.py" lines=169:192
@source program-gain title="One gain to the program level" path="src/filmkit/soundtrack/assembly.py" lines=510:531
@source segment-level title="A segment leveled within its chapter" path="src/filmkit/soundtrack/level.py" lines=171:199
@source clip-levels title="Segments leveled before chapters" path="src/filmkit/soundtrack/assembly.py" lines=594:613
@source assembly-record title="A segment's receipt record" path="src/filmkit/soundtrack/assembly.py" lines=439:459
@source releases title="Declared releases" path="src/filmkit/soundtrack/policy.py" lines=159:170
@source sound-gate title="The sound gate" path="src/filmkit/soundtrack/gates.py" lines=1:19
@source captions-doc title="Caption timing" path="src/filmkit/captions/timing.py" lines=1:10
@source gate-doc title="The picture gate" path="src/filmkit/picture/gates.py" lines=1:53
@source frame-gates title="Rules from the reviews" path="src/filmkit/picture/gates.py" lines=80:81
@source gate-check title="check-picture" path="src/filmkit/picture/gates.py" lines=487:598
@source detail-gates-doc title="Detail findings and exceptions" path="src/filmkit/picture/detail_gates.py" lines=1:16
@source candidate-inputs title="The inputs a stage binds" path="src/filmkit/picture/rendering.py" lines=99:137
@source rendering-doc title="Stage, render, validate" path="src/filmkit/picture/rendering.py" lines=1:18
@source require-renderer title="One canvas version" path="src/filmkit/picture/renderer.py" lines=118:126
@source renderer-doc title="The engine's renderer" path="src/filmkit/picture/renderer.py" lines=1:32
@source renderer-pin title="The pinned canvas build" path="src/filmkit/picture/renderer.py" lines=53:68
@source released-record title="What the engine was released on" path="src/filmkit/released.json" lines=3:6
@source receipt-renderer title="A receipt of another renderer" path="src/filmkit/picture/renderer.py" lines=178:190
@source render-receipt title="What a render receipt names" path="src/filmkit/picture/renderer.py" lines=311:350
@source encoding title="The pictures' encoding" path="src/filmkit/picture/encoding.py" lines=1:22
@source faces-doc title="One reader of the faces" path="src/filmkit/picture/faces.py" lines=1:15
@source browser-doc title="The browser of the checks" path="src/filmkit/picture/browser.py" lines=1:7
@source stage title="Staging the picture" path="src/filmkit/picture/rendering.py" lines=248:310
@source render-gate title="A render needs a passing gate" path="src/filmkit/picture/rendering.py" lines=428:454
@source render title="Rendering the picture" path="src/filmkit/picture/rendering.py" lines=457:473
@source validate title="Validating the picture" path="src/filmkit/picture/rendering.py" lines=514:541
@source equivalence-doc title="Only the captions differ" path="src/filmkit/picture/equivalence.py" lines=1:40
@source derivation-doc title="A derived uncaptioned picture" path="src/filmkit/picture/derivation.py" lines=1:48
@source derivation-way title="Derived or rendered" path="src/filmkit/picture/derivation.py" lines=111:128
@source qualification-doc title="Qualifying the renderer" path="src/filmkit/picture/qualification.py" lines=1:36
@source tools-doc title="The Node tool runner" path="src/filmkit/tools.py" lines=1:34
@source headless-doc title="The composition, run headlessly" path="src/filmkit/picture/headless-composition.mjs" lines=1:14
@source detail-audit-doc title="The detail audit" path="src/filmkit/picture/detail-audit.mjs" lines=1:16
@source mass-audit-doc title="The mass audit" path="src/filmkit/picture/mass-audit.mjs" lines=1:26
@source package-doc title="Packaging" path="src/filmkit/delivery/packaging.py" lines=1:31
@source delivered-check title="Checking a finished film" path="src/filmkit/delivery/packaging.py" lines=551:596
@source package-film title="Packaging every film" path="src/filmkit/delivery/packaging.py" lines=633:668
@source package-inputs title="What the film package binds" path="src/filmkit/delivery/packaging.py" lines=277:289
@source player-doc title="The player page" path="src/filmkit/delivery/player.py" lines=1:5
@source verification-doc title="Verification" path="src/filmkit/delivery/verification.py" lines=1:15
@source verify-captions title="Captions stay typeset" path="src/filmkit/delivery/verification.py" lines=66:87
@source verify-spotlight title="Spotlight's import, read back" path="src/filmkit/delivery/verification.py" lines=348:378
@source verify-review title="The review it accepts" path="src/filmkit/delivery/verification.py" lines=381:446
@source verification-qualify title="One edition's checks" path="src/filmkit/delivery/verification.py" lines=469:514
@source film-scan title="The still scan of the packaged film" path="src/filmkit/picture/still_scan.py" lines=23:31
@source reproduction-doc title="Reproduction" path="src/filmkit/delivery/reproduction.py" lines=1:38
@source release-doc title="Writing the release manifest" path="src/filmkit/delivery/release.py" lines=1:7
@source documents-doc title="Delivery to the film's delivery folder" path="src/filmkit/delivery/folder.py" lines=1:53
@source round-doc title="A review round" path="src/filmkit/review/round.py" lines=1:16
@source human-listening title="Human listening stays separate" path="src/filmkit/review/round.py" lines=89:93
@source measurement-doc title="Review measurements" path="src/filmkit/review/measurement.py" lines=1:23
@source clarity-doc title="Voice clarity" path="src/filmkit/review/clarity.py" lines=1:21

## What does Film Kit read, and what does it leave to the film? {#p-context}

A film is the folder that holds `content/film.toml`; the engine finds it through `FILMKIT_ROOT` or the working directory.[](source:film-root) A film pins a release tag of the engine in its own Python project.[](source:readme-install) Its npm packages take the versions that the engine's own `package.json` names, and `filmkit check` names a package held at another version.[](source:readme-install) The engine declares each language it builds once, and a film's editions are the languages its declaration names.[](source:languages-doc)[](source:film-editions)

@facts
| Frame rate | 60 fps; a script that declares a frame rate is refused |
| Sample rate | 48 kHz |
| Program level | -16.5 LUFS, true peak at most -1 dBTP |
| Films per edition | 4: a UHD master and a 1080p film, each with and without captions |

The engine fixes these specifications, and a film uses them as they are.[](source:spec-rate)[](source:withdrawn-fps)[](source:spec-sound)[](source:renditions) A film declares everything else in `content/film.toml`; this is the declaration of the sample film in the repository.[](source:sample-declaration)

@code id=declaration source=sample-declaration language=toml

@diagram architecture id=context-map source=context.architecture.json title="What Film Kit reads, runs and writes"

@steps id=context-steps
| step-ctx-film | Film repository | The declaration, each edition's script, cast and pronunciation, and the picture's composition.[](source:readme-layout) | context-map | ctx-film |
| step-ctx-engine | Film Kit engine | The console command runs one verb of a film's build; the declaration is checked before any work.[](source:cli-doc)[](source:film-load) `filmkit build` makes its targets fresh from the run records, one node at a time in the derived order.[](source:build-doc) The plan calls a node ready only when every node upstream of it and every gate it waits for is fresh.[](source:plan-doc) | context-map | ctx-engine |
| step-ctx-supply | Supply step | The only step that reaches the network. It checks the browser build, the pinned CMUdict and each model snapshot against pinned digests.[](source:supply-doc) | context-map | ctx-supply |
| step-ctx-models | Speech models | A voice model narrates, a forced aligner times the words and a recognizer transcribes them, all on MLX.[](source:snapshots) | context-map | ctx-models |
| step-ctx-browser | Canvas, Chrome | The film's npm packages install the canvas that draws the picture, and the engine refuses any version but `@napi-rs/canvas` 1.1.1.[](source:require-renderer)[](source:renderer-pin)[](source:released-record) The browser build runs only the checks: the geometry check, the whole-turn gate, the cover and the players' checks.[](source:browser-doc) | context-map | ctx-browser |
| step-ctx-build | Build folder | Each edition's media and records go below the film's ignored `build/`.[](source:edition-places) | context-map | ctx-build |
| step-ctx-documents | Delivery folder | For a film of two editions, delivery syncs the 25 members with rsync, then checks each against its source's SHA-256. The engine names no folder of a host: the film declares the folder's name under the key `delivery_folder`.[](source:documents-doc) | context-map | ctx-documents |

## What happens to one edition, from script to delivered films? {#p-route}

Each verb runs in the film's folder. A target of `filmkit build` names a node for one edition or for all, a group of nodes or `all`.[](source:readme-commands)

@workflow id=route-flow title="One edition, from script to delivered films"
| lane narration | Narration |
| lane sound | Sound |
| lane picture | Picture |
| lane delivery | Delivery |
| route-words | Check the sources | security | narration | source:check-doc |
| route-narrate | Narrate each thought | backend | narration | source:synthesis-reuse |
| route-align | Align, transcribe | backend | narration | source:narrate-steps |
| route-select | Select the takes | security | sound | source:selection |
| route-assemble | Assemble the sound | backend | sound | source:assembly-doc |
| route-gate | Check the picture | security | picture | source:gate-check |
| route-render | Stage, render | backend | picture | source:render |
| route-compare | Compare the pictures | security | picture | source:equivalence-doc |
| route-package | Package the films | backend | delivery | source:package-film |
| route-verify | Verify every input | security | delivery | source:verification-qualify |
| route-words > route-narrate | pass |
| route-narrate > route-align | |
| route-align > route-select | |
| route-select > route-assemble | |
| route-assemble > route-gate | |
| route-gate > route-render | pass | emphasis |
| route-render > route-compare | |
| route-compare > route-package | pass |
| route-package > route-verify | |

@steps id=route-steps
| step-route-words | Check the sources | `filmkit check` asks every question of the film's sources at once. Narration is refused while that check is stale or refused.[](source:check-doc)[](source:narrate-gate) | route-flow | route-words |
| step-route-narrate | Narrate each thought | Each thought is a native take from the cast's seed or retake. A recording whose request still matches is reused.[](source:synthesis-reuse) | route-flow | route-narrate |
| step-route-align | Align, transcribe | The pinned aligner times each word. The transcript is a proxy for pronunciation, not a certification.[](source:narrate-steps)[](source:transcription-doc) Each recording's transcript is cached under its waveform, the language and the recognizer's identity.[](source:transcription-doc) | route-flow | route-align |
| step-route-select | Select the takes | The node `select` binds each recording and its alignment to the current script, cast and narrator reference. It refuses a recording that breaks the film's pause limits or says a declared term unlike its reference.[](source:selection)[](source:speech-refusals) | route-flow | route-select |
| step-route-assemble | Assemble the sound | The assembly designs the pauses, levels each thought, segment and chapter, and reaches the program level with one gain. It refuses the laid-out soundtrack for an unmarked pause above the film's limit or a declared term said unlike its reference.[](source:assembly-doc)[](source:clip-levels)[](source:program-gain) The edition's runtime is the laid-out speech, gaps, closing quiet and credits, rounded up to a whole second.[](source:assembly-doc) The node `check-sound` then judges the assembled soundtrack, and refuses a segment under the film's clarity floor, an abrupt or cut ending and a stopped phrase.[](source:sound-gate) | route-flow | route-assemble |
| step-route-gate | Check the picture | `check-picture` audits every frame, each label's sync, motion, the detail of single lines, strokes and names, and the uncaptioned stage's mass, then writes the gate record.[](source:gate-doc)[](source:detail-gates-doc) | route-flow | route-gate |
| step-route-render | Stage, render | The captioned and the uncaptioned picture are each staged, and the engine's renderer draws the captioned stage on a native canvas only after a passing gate record.[](source:stage)[](source:render-gate)[](source:render)[](source:renderer-doc) A film that declares software capture derives the uncaptioned picture from the captioned one: one x264 encode paints the caption band's rows in the ground. Otherwise, or for an edition that `[picture] native_uncaptioned` names, the renderer draws the uncaptioned stage too.[](source:derivation-doc) A derived pair is compared by the derivation's receipt, and no picture is decoded.[](source:equivalence-doc) | route-flow | route-render |
| step-route-compare | Compare the pictures | A rendered pair may differ only by its captions, in the composition at every caption and every half second, and in the decoded frames outside the captions' band. Every frame of both is then scanned for a fault that lasts one frame. The same scan measures the edge slivers: the samples more than 40 levels apart in each frame's densest block. A frame beyond the bound is refused.[](source:equivalence-doc) | route-flow | route-compare |
| step-route-package | Package the films | FFmpeg muxes each film's picture, with captions or without, with the soundtrack and chapters; each film is checked before it is linked into place.[](source:package-doc)[](source:package-film) | route-flow | route-package |
| step-route-verify | Verify every input | The verifier reads and decodes. It checks the sources, narration, both pictures and their equivalence, packages, all four decoded films and the review. Where the host has `mdimport`, it also reads back the keywords and authors Spotlight imports from each film.[](source:verification-doc)[](source:verify-spotlight) It refuses an edition whose 1080p captioned film has no passing still scan from the node `scan-film`, and delivery asks the same.[](source:verification-doc)[](source:film-scan) | route-flow | route-verify |

## What is checked before anything is narrated? {#p-words}

`filmkit check` asks every question of the film's sources in one run, whatever an earlier question found.[](source:check-doc)

@facts
| Concepts | Each segment says its declared concepts in approved words, alike in both editions. No declared counterexample appears in the narration, titles, caption terms, release prose, the player's summary, the entry page or picture sources.[](source:concepts-doc) |
| Quotations | With a clone of the source repository, each concept's quotation must be in its document at the pinned commit.[](source:concepts-doc) |
| Register | The words a viewer meets outside the picture hold no error-level form of the formal register that the film does not excuse at its place.[](source:concepts-doc)[](source:register-doc) The check runs the Vale that the engine pins.[](source:check-doc) |
| Readings | Each watched Chinese character lies in a declared word, whose reading must be a dictionary reading. A word the dictionary reads otherwise in context records why.[](source:readings-doc)[](source:watch-list) |
| Names | Every Latin word in the Chinese narration, and every English word with two or more capitals, needs a declared spoken form.[](source:readings-doc) |
| Terms | Every language's normalization must give each declared Latin-script term its one spoken form, and each edition that says the term must hold its reference occurrence. A name that an edition respells in other letters must be a declared term.[](source:readings-doc) |
| Anchors | A segment may mark anchors in its own words. Each edition's picture is drawn over a timeline derived from its script, and an id it reads that the edition does not mark is refused.[](source:anchors-doc)[](source:anchor-reads-doc) |

@callout level=note title="One check names every finding"
| The check lists every finding at once, and with `--read-only` it writes no file.[](source:check-doc)[](source:readme-commands) Narration is refused before any speech model loads while the check is stale or refused.[](source:narrate-gate) |

## How does a thought's take reach the soundtrack? {#p-takes}

The assembly refuses a thought whose take ends inside its last syllable.[](source:abrupt)

@diagram lifecycle id=take-life source=take.lifecycle.json title="A thought's take, from seed to soundtrack"

@steps id=take-steps
| step-take-narrated | Narrated | A thought's request names its text, spoken text and seed. One module runs the voice model, and each take joins the next with added quiet only.[](source:synthesis-plan)[](source:one-model)[](source:thought-joins) | take-life | take-narrated |
| step-take-judged | Judged | A take ends naturally when its last 30 ms are quiet and its last syllable dies away instead of stopping.[](source:take-ending) Its last syllable's fall and the voicing before it are medians over every phase of the 1 ms frame grid. A fall after which the sound rises again and dies away is a closure before its release, and the release is the ending.[](source:take-fall) | take-life | take-judged |
| step-take-abrupt | Abrupt | The assembly lists every abrupt thought and refuses the edition.[](source:abrupt) | take-life | take-abrupt |
| step-take-auditioned | Auditioned | An audition narrates other seeds, or reads on into the next thought and cuts in the quiet. It proposes a take that no line of the judgment refuses. One above its clarity line comes before one for the author's ear, and within each, one that says the required phrase comes first. The bound retake keeps the SHA-256 of its text and speech.[](source:audition-propose)[](source:run-on-doc)[](source:retakes-doc) | take-life | take-auditioned |
| step-take-released | Released | A film may declare a release of up to 0.3 s for one join, and the assembly fades that tail into the silence.[](source:releases) | take-life | take-released |
| step-take-selected | Selected | Selection binds each recording and its alignment to the current script, cast and narrator reference.[](source:selection) | take-life | take-selected |
| step-take-assembled | Assembled | A script's `voice_performance` may declare `segment_level_tolerance_db`, from 0.1 to 3.0.[](source:readme-levels) The assembly then brings each segment whose leveled thoughts' median loudness stands farther than that from its chapter's median to the tolerance's edge.[](source:segment-level) It does so before it levels the chapters, by one static gain of at most 2 dB that keeps the segment's peak below -1 dBFS.[](source:clip-levels)[](source:segment-level) The soundtrack plays at -16.5 LUFS integrated, under a true-peak ceiling of -1 dBTP.[](source:program-level)[](source:program-gain) | take-life | take-assembled |

@facts
| Lines | The audition, `judge` and `converge` share one judgment of a take, by eight lines: its length, ending, phrase ends, opening, unmarked pauses, declared terms, units and clarity.[](source:judgment-doc)[](source:audition-doc) |
| Words | No unit of a take's transcript may differ from its text by reading; every other limit is the film's declaration or the engine's constant.[](source:judgment-units)[](source:judgment-doc) By reading, Han characters with the same reading are alike. Latin units are compared by their letters and digits, and in English also by their pronunciation in the pinned CMUdict.[](source:reading-units) |
| Clarity | A take under the film's line for a single thought is not refused but named for the author's ear, and waits for a hearing; with a floor alone its clarity is recorded.[](source:judgment-doc) |
| Hearing | The author's hearing of one take, recorded under `[[narration.heard]]` by its audio's SHA-256, settles the lines it names for that take alone.[](source:hearings-doc) |
| Choice | Among the takes no line refuses, the widest margin is chosen, then the quietest ending, then the lowest seed.[](source:judgment-doc) |
| Convergence | `filmkit narrate` settles an edition's narration with no targets file, phrase or seed from its author.[](source:converge-doc) It narrates what is due, judges every thought and generates candidates for each refused one at the audition's seeds. It binds the accepted candidate with the widest margin, narrates and judges again, and then tries run-on takes.[](source:converge-doc) A thought still refused is named as not narratable as written, with no line lowered; one whose take reads under its clarity line waits for the author's ear.[](source:converge-doc)[](source:hearings-doc) |
| Runtime | An edition lasts as long as its narration: the assembly counts its runtime and rounds it up to a whole second.[](source:assembly-doc) A settled convergence counts that runtime and never misses one.[](source:converge-doc) |

@callout level=note title="Why a take can end inside a syllable"
| In-context takes from mlx-audio 0.6.4 can end inside their last syllable, and `Blaizzy/mlx-audio#1116` is the upstream fix.[](source:changelog-050) From mlx-audio 0.6.5 the trim of decoded audio keeps the frames whose first codebook id is 0, and the engine pins 0.6.6.[](source:changelog-0231) |

## What does each record bind? {#p-records}

A record names the SHA-256 of the files its step read, and the step that reads the record refuses other bytes.[](source:candidate-inputs)[](source:render-gate)

@diagram erd id=records-erd source=records.erd.json title="What each record binds"

@steps id=records-steps
| step-rec-selection | narration-selected.json | Binds the script and the cast, and each recording by its waveform's SHA-256.[](source:selection) | records-erd | rec-selection |
| step-rec-assembly | audio-assembly.json | Binds the script and the soundtrack it wrote, with the designed pauses and the program level.[](source:assembly-doc) It records each segment's gain as `segment_gain_db`.[](source:assembly-record) | records-erd | rec-assembly |
| step-rec-stage | stage.json | Binds the script, timeline, assembly, soundtrack and source manifest, and each staged member.[](source:candidate-inputs)[](source:stage) It also names the faces the renderer registers and the language the picture is drawn in.[](source:stage) | records-erd | rec-stage |
| step-rec-gates | picture-gates.json | Binds the composition, timeline, stylesheet, fonts, engine version and uncaptioned stage that the audits ran on.[](source:gate-check)[](source:gate-doc) | records-erd | rec-gates |
| step-rec-package | film-package.json | Binds both pictures and their equivalence record, the soundtrack, cover, script, chapters and the film's `VERSION`, and each film's own SHA-256.[](source:package-inputs)[](source:package-film) | records-erd | rec-package |

@callout level=note title="A run record for every node"
| Every node's run writes a run record: each input and output by its path, size, time and SHA-256, the engine and its pins, and the outcome.[](source:records-doc) It also states the run's start, seconds, phases and the host's 1-minute load at both ends.[](source:records-doc)[](source:runs-doc) `filmkit plan` judges each node by its record, and `filmkit verify` refuses bytes that no record of a declared writer accounts for.[](source:plan-doc)[](source:verify-doc) |

## What must pass before the picture renders? {#p-picture}

The frame, motion and detail audits run the film's own composition headlessly, on a canvas stand-in.[](source:headless-doc)[](source:detail-audit-doc) The mass audit draws the uncaptioned stage as the renderer does, and encodes nothing.[](source:mass-audit-doc)

@sequence id=picture-flow title="From stage to a validated picture"
| actor pic-command | Build graph | frontend | source:build-doc |
| actor pic-gate | Picture gate | security | source:gate-check |
| actor pic-tools | Node tool runner | backend | source:tools-doc |
| actor pic-record | Gate record | database | source:gate-doc |
| actor pic-render | Picture rendering | backend | source:render |
| actor pic-renderer | Native renderer | backend | source:renderer-doc |
| phase | Stage |
| pic-command | pic-render | stage-picture |
| phase | Gate |
| pic-command | pic-gate | check-picture |
| pic-gate | pic-tools | frame, motion, detail, mass audits |
| pic-tools | pic-gate | reports and traces | return |
| pic-gate | pic-record | pass or refuse |
| phase | Render |
| pic-command | pic-render | render-picture |
| pic-render | pic-record | read the record |
| pic-record | pic-render | current and passing | return |
| pic-render | pic-renderer | draw the stage | emphasis |
| pic-renderer | pic-render | picture, receipt | return |
| phase | Validate |
| pic-command | pic-render | validate-picture |

@steps id=picture-steps
| step-pic-stage | Picture rendering | `stage-picture` inlines the timeline, script and style into one document, and records its inputs in `stage.json`.[](source:stage) The stage also holds the picture's data as `film.json`, and its record names the faces and the language.[](source:rendering-doc)[](source:stage) | picture-flow | pic-render | | pic-command-to-pic-render-1 |
| step-pic-gate | Picture gate | `check-picture` runs the frame, motion, detail and mass audits through the tool runner at the same time, then the sync audit on the frame audit's traces.[](source:gate-check)[](source:tools-doc) A run of 1.5 s or more in which the mass of a scene's lit paints stands more than 90 px off x 960 is gated. So is each still state of 2 s or more that stands more than 50 px above or below y 510.[](source:gate-doc)[](source:changelog-0350) | picture-flow | pic-gate | | pic-command-to-pic-gate-1,pic-gate-to-pic-tools-1,pic-tools-to-pic-gate-1 |
| step-pic-record | Gate record | It binds what the audits ran on and lists every gated finding. An opening that shows the declared title too briefly is one, and so is a text at rest below 4.5:1. One gated finding refuses the render.[](source:gate-doc) A film keeps a finding of the detail audit, or a run far off centre, by declaring an exception with its reason, which the record lists.[](source:detail-gates-doc) | picture-flow | pic-record | | pic-gate-to-pic-record-1 |
| step-pic-render | Native renderer | `render-picture` refuses without a passing record for the current inputs, then renders the complete UHD stage of the captioned picture.[](source:render-gate)[](source:render) The renderer draws on a canvas of `@napi-rs/canvas` with the host's text renderer, and pipes each frame to x264 in four spans joined by stream copy.[](source:renderer-doc) The node `render-picture-uncaptioned` derives the uncaptioned picture for a film of software capture whose captioned picture the pinned canvas build drew. Otherwise, or for an edition that `[picture] native_uncaptioned` names, it renders that picture's own stage.[](source:derivation-doc)[](source:derivation-way) | picture-flow | pic-renderer | | pic-render-to-pic-record-1,pic-record-to-pic-render-1,pic-render-to-pic-renderer-1,pic-renderer-to-pic-render-1 |
| step-pic-validate | Build graph | `validate-picture` binds the picture to its receipt and stage, and checks each frame's place on the 60 fps grid. It binds a derived uncaptioned picture to its derivation's receipt.[](source:validate) A render receipt names the canvas package, the native library the render loaded, the text renderer and a digest of every drawn frame.[](source:render-receipt) A receipt that names another canvas package, version or text renderer is refused, and so are keyframes off the 2 s grid.[](source:receipt-renderer)[](source:validate)[](source:encoding) | picture-flow | pic-command | | pic-command-to-pic-render-3 |

@callout level=note title="Measured rules, not taste"
| Each frame finding that the gate refuses is a rule the DDWG reviews turned into one a delivered film keeps.[](source:frame-gates) Taste stays with the review.[](source:verification-doc) |

## Which parts carry the build? {#p-parts}

Each arrow points from a part to a part it calls.

@diagram architecture id=parts-map source=parts.architecture.json title="The parts that carry one edition"

@steps id=parts-steps
| step-part-narrate | Narration command | Runs synthesis, alignment and transcription as separate processes, once the plan calls the edition's narration ready.[](source:narrate-steps)[](source:narrate-gate) | parts-map | part-narrate |
| step-part-produce | Build graph | Runs the owner of each stale node, one node at a time, and writes the node's run record.[](source:build-doc)[](source:runs-doc) | parts-map | part-produce |
| step-part-takes | Thought takes | Requests, receipts and joins of each thought, checked again from every retained record.[](source:thought-joins) A narration divides the segments it has to generate among processes of the voice model, one for every 16 GB of host memory, up to three.[](source:narration-processes) | parts-map | part-takes |
| step-part-judgment | Take judgment | Judges a take of one thought by every line the film holds for a take, and names every failing line at once.[](source:judgment-doc) `python -m filmkit.narration.judge` judges every thought of an edition's receipt and writes `judgment.json` beside it.[](source:judge-doc) | parts-map | part-judgment |
| step-part-sound | Soundtrack assembly | Writes the soundtrack, the timeline with its captions, and the assembly receipt.[](source:assembly-doc) A caption cue's text is the typeset copy of its phrase, with typographic quotation marks.[](source:captions-doc) Its sound gate reads a segment's clarity as the reviewers do, over the whole soundtrack's kept frames whose centres lie in the segment.[](source:sound-gate)[](source:clarity-doc) | parts-map | part-sound |
| step-part-gate | Picture gate | Writes the gate record and refuses while one gated finding remains.[](source:gate-doc) | parts-map | part-gate |
| step-part-render | Picture rendering | Stages and renders the captioned UHD picture, renders or derives the uncaptioned one, validates both and proves they differ only by their captions.[](source:render)[](source:equivalence-doc) `qualify-renderer` renders the captioned stage a second time and compares the two renders with no row left out.[](source:qualification-doc) The second render is drawn in another count of spans, and the two must state one digest of their drawn frames.[](source:qualification-doc) One reader takes the film's `@font-face` rules for the audits' text table and the renderer, and refuses by name a rule it cannot hold the canvas to.[](source:faces-doc) | parts-map | part-render |
| step-part-renderer | Native renderer | Draws a staged picture on a native canvas, with no browser, and pipes each frame to an x264 encoder.[](source:renderer-doc) The engine pins `@napi-rs/canvas` 1.1.1 in its record `released.json`.[](source:released-record) For Apple silicon, the renderer also pins the SHA-256 of its native library.[](source:renderer-pin) | parts-map | part-renderer |
| step-part-package | Packaging | Derives the viewing package and writes all four films, each checked before it is linked into place. Each film and page names the film's version.[](source:package-doc) | parts-map | part-package |
| step-part-verify | Verification | Reads every record again and decodes all four films, and writes nothing.[](source:verification-doc) It refuses a caption cue whose text is not typeset.[](source:verify-captions) | parts-map | part-verify |

## What does a delivered edition hold, and how is it accepted? {#p-delivery}

For a film of two editions, delivery fills the film's delivery folder with exactly 25 members, then reads them back.[](source:documents-doc)

@tree id=delivery-tree title="The 25 delivery members of two editions"
| dl-root | Delivery folder | - |
| dl-entry | Language entry page | dl-root |
| dl-edition | zh and en, each | dl-root |
| dl-uhd | UHD masters | dl-edition |
| dl-hd | 1080p viewing films | dl-edition |
| dl-cover | Cover, PNG and JPEG | dl-edition |
| dl-subtitles | SRT and VTT | dl-edition |
| dl-transcript | Transcript | dl-edition |
| dl-chapters | Chapters, JSON and FFmetadata | dl-edition |
| dl-player | Player page | dl-edition |

@steps id=delivery-steps
| step-dl-root | Delivery folder | The folder is the one `filmkit deliver --to` names, else the film's declared name below `FILMKIT_DELIVERY_ROOT`, else that name below the user's videos folder. A delivery refuses a destination it must not fill, such as the film's root or a folder inside it. Before rsync changes anything, a real browser reads the entry page and both players back, playing all four films of each. rsync then copies each member whose bytes differ, and keeps every replaced entry as a rollback copy.[](source:documents-doc) | delivery-tree | dl-root |
| step-dl-uhd | UHD masters | One with the captions the picture draws and one without, each copying its own picture's stream. All four films carry the same soundtrack, chapters, cover and release tags.[](source:renditions)[](source:package-doc) | delivery-tree | dl-uhd |
| step-dl-hd | 1080p viewing films | Each is decoded in software, averaged over each 2×2 block of pixels and encoded by x264, with a keyframe forced every 2 s. The two films of a size are made alike, each from its own picture. For a derived pair, the 1080p uncaptioned film instead reads the captioned picture and paints the caption band as the derivation did.[](source:renditions) No finished film may hold B-frames.[](source:delivered-check) | delivery-tree | dl-hd |
| step-dl-player | Player page | The engine renders it; a film declares only each edition's summary and the player's five colours.[](source:player-doc) | delivery-tree | dl-player |
| step-dl-chapters | Chapters, JSON and FFmetadata | Every track of each film carries the edition's language; packaging writes the chapter track's language in place.[](source:delivered-check)[](source:package-doc) | delivery-tree | dl-chapters |

| Check        | What it reads                                                                                                                                                                            | What passing means                                                                                                             |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Review round | Prompts with each film's SHA-256, and the round's measurements, which `filmkit review prepare` writes in one run[](source:round-doc)[](source:measurement-doc)                           | Independent reviews score each edition on every declared dimension {good:Scored}                                               |
| Verification | Sources, narration, render, packages, the still scan, decoded films, Spotlight's import and the review[](source:verification-qualify)[](source:verify-spotlight)[](source:verify-review) | The edition binds its current inputs, and its review meets the film's floors {good:Bound}                                      |
| Reproduction | The release manifest, which `filmkit release` writes from the delivered build, and the published assets[](source:reproduction-doc)[](source:release-doc)                                 | A rebuild keeps the release's decoded audio, streams, chapters and tags, and each frame meets its PSNR floor {good:Reproduced} |

## How did Film Kit get here? {#p-history}

Film Kit released v0.1.0 on 30 October 2026 and v0.35.0 on 26 November.[](source:changelog-010)[](source:changelog-0350) The timeline shows the thirty-one releases that changed how a film is made, v0.33.0, v0.34.0 and v0.35.0 the latest.[](source:changelog-0330)[](source:changelog-0340)[](source:changelog-0350) It also shows the patch releases v0.21.1 and v0.21.2, which moved only the repository's tools and pinned packages.[](source:changelog-0211)[](source:changelog-0212) The v0.21.3 release did the same and is not on the timeline.[](source:changelog-0213)

The v0.26.1, v0.34.1 and v0.34.2 releases changed only the repository's tools, CI and locks, and are not on the timeline either.[](source:changelog-0261)[](source:changelog-0341)[](source:changelog-0342)

The v0.22.1 release moved the renderer to HyperFrames 0.9.46, and the sample film's twelve films decode to the same frames.[](source:changelog-0221) It is not on the timeline either. The repository keeps no dated roadmap; what is still open is listed last on this page.

@diagram timeline id=history source=history.timeline.json title="How Film Kit got here"

## What is delivered, and what is still open? {#p-maturity}

An engine change keeps every film's output bytes unless its release says otherwise.[](source:agents-contract)

| Area                    | State                                | What that means                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------- | ------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Platform                | Apple silicon {caution:One platform} | The speech models run on MLX, so the engine needs an Apple-silicon Mac.[](source:readme-requirements)                                                                                                                                                                                                                                                                               |
| Sample film             | Local acceptance {caution:Not in CI} | Its build needs the speech models and the browser build, so hosted CI runs only the portable proof.[](source:readme-dev)                                                                                                                                                                                                                                                            |
| Human listening         | Separate {caution:Not scored}        | A review scores audio from automated evidence; listening is a later acceptance.[](source:human-listening)                                                                                                                                                                                                                                                                           |
| Take endings            | Guarded {good:Refused}               | mlx-audio 0.6.5 carries the upstream repair, and the engine pins 0.6.6.[](source:changelog-0231) Every take is still judged by its ending, and the assembly refuses an abrupt take.[](source:judgment-doc)[](source:abrupt)                                                                                                                                                         |
| Text widths             | Measured {good:The film's fonts}     | Audits measure widths with the film's own faces; a text's height keeps an estimate.[](source:readme-metrics)                                                                                                                                                                                                                                                                        |
| Still off-centre states | Refused {good:Whatever follows}      | The gate refuses every still state that stands more than 50 px off x 960 for 2 s or more. That holds whether it is a settled composition or held while the parts that grow from it are still to come.[](source:readme-balance)                                                                                                                                                      |
| A new renderer          | Pinned {caution:The film decides}    | A film keeps its `filmkit` pin until it produces, reviews and accepts an edition on the new release.[](source:changelog-pin) A film that takes v0.24.0 or later declares `@napi-rs/canvas` at the engine's version and renders its pictures again: validation refuses a receipt that names no canvas.[](source:readme-install)[](source:released-record)[](source:receipt-renderer) |
