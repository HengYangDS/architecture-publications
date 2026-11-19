# How does Film Kit rebuild a narrated film from its tracked sources? {#guide}

Film Kit rebuilds a film's Chinese and English editions from the film's own repository.[](source:readme-what) It narrates each script with a pinned local voice model, then assembles, captions, renders and packages each edition.[](source:readme-what) Each step records the SHA-256 of what it read, and a later step refuses a record bound to other bytes.[](source:candidate-inputs)[](source:render-gate)

- [The engine holds no film's content](block:p-context): scripts, casts, pages and the picture's composition stay in the film's repository.[](source:readme-engine)
- [Words are checked before any speech model loads](block:p-words), and a refusal names every failure.[](source:narrate-gate)
- [A take reaches the soundtrack only if it ends whole](block:p-takes), or if the film declares a release for its join.[](source:abrupt)
- [The picture renders only after its gate passes](block:p-picture) for the current composition, timeline, stylesheet, fonts and engine version.[](source:render-gate)

@answer scope="Film Kit v0.24.0 · commit 4893228 · its source and its own documents"
@meta locale=en style=editorial
@source readme-what title="What Film Kit does" path="README.md" lines=3:3
@source spec-rate title="Frame rate" path="src/filmkit/specification.py" lines=25:30
@source spec-sound title="Sample rate and program level" path="src/filmkit/specification.py" lines=33:47
@source sample-declaration title="The sample film's declaration" path="examples/sample-film/content/film.toml" lines=6:23
@source changelog-010 title="The 0.1.0 release" path="CHANGELOG.md" lines=515:519
@source changelog-019 title="The 0.19.0 changes" path="CHANGELOG.md" lines=228:243
@source changelog-020 title="The 0.20.0 changes" path="CHANGELOG.md" lines=211:227
@source changelog-0211 title="The 0.21.1 changes" path="CHANGELOG.md" lines=180:186
@source changelog-0212 title="The 0.21.2 release" path="CHANGELOG.md" lines=174:178
@source changelog-0213 title="The 0.21.3 release" path="CHANGELOG.md" lines=161:172
@source changelog-0220 title="The 0.22.0 changes" path="CHANGELOG.md" lines=139:159
@source changelog-0221 title="The 0.22.1 release" path="CHANGELOG.md" lines=114:137
@source changelog-0222 title="The 0.22.2 fixes" path="CHANGELOG.md" lines=106:112
@source changelog-0223 title="The 0.22.3 addition" path="CHANGELOG.md" lines=100:104
@source changelog-0230 title="The 0.23.0 changes" path="CHANGELOG.md" lines=48:98
@source changelog-0231 title="The 0.23.1 release" path="CHANGELOG.md" lines=40:46
@source changelog-0240 title="The 0.24.0 changes" path="CHANGELOG.md" lines=7:38
@source readme-engine title="The engine carries no film's content" path="README.md" lines=5:5
@source readme-requirements title="Requirements" path="README.md" lines=9:12
@source readme-layout title="A film's layout" path="README.md" lines=18:26
@source readme-levels title="Level tolerances" path="README.md" lines=58:58
@source readme-words title="Concepts and readings" path="README.md" lines=74:77
@source readme-neither title="A film without either check" path="README.md" lines=81:81
@source readme-gate title="The picture gate" path="README.md" lines=113:113
@source readme-metrics title="Text measured with the film's fonts" path="README.md" lines=115:115
@source readme-balance title="Balance in every frame" path="README.md" lines=117:117
@source readme-install title="Installing the engine in a film" path="README.md" lines=251:263
@source readme-commands title="Commands" path="README.md" lines=267:286
@source readme-endings title="Whole endings" path="README.md" lines=290:292
@source readme-dev title="Development" path="README.md" lines=316:316
@source agents-contract title="The engine contract" path="AGENTS.md" lines=10:16
@source changelog-pin title="A film keeps its pin" path="CHANGELOG.md" lines=415:415
@source film-root title="Finding the film" path="src/filmkit/repository.py" lines=28:50
@source film-load title="Checking the declaration" path="src/filmkit/film.py" lines=516:538
@source edition-places title="Where an edition writes" path="src/filmkit/production.py" lines=163:179
@source renditions title="The four delivered films" path="src/filmkit/production.py" lines=87:99
@source program-level title="One program level" path="src/filmkit/specification.py" lines=45:47
@source produce-actions title="The production actions" path="src/filmkit/produce.py" lines=106:146
@source preflight-draft title="The draft preflight asks for" path="src/filmkit/preflight.py" lines=132:155
@source preflight-doc title="What preflight asks for" path="src/filmkit/preflight.py" lines=1:40
@source narrate-gate title="Checks before synthesis" path="src/filmkit/narration/narrate.py" lines=120:130
@source narrate-steps title="Synthesis, alignment, transcription" path="src/filmkit/narration/narrate.py" lines=63:117
@source concepts-doc title="The concept check" path="src/filmkit/concepts.py" lines=1:15
@source readings-doc title="The readings check" path="src/filmkit/narration/readings.py" lines=1:27
@source watch-list title="The watched characters" path="src/filmkit/narration/watched-characters.toml" lines=1:14
@source synthesis-plan title="Each segment's job" path="src/filmkit/narration/synthesis.py" lines=256:274
@source synthesis-reuse title="Reuse or refuse a recording" path="src/filmkit/narration/synthesis.py" lines=277:305
@source narration-processes title="A narration's processes" path="src/filmkit/narration/processes.py" lines=1:21
@source one-model title="The only module that runs the voice model" path="src/filmkit/narration/group_generation.py" lines=1:4
@source thought-joins title="Thought requests, receipts and joins" path="src/filmkit/narration/thought_groups.py" lines=1:10
@source take-ending title="A take's ending" path="src/filmkit/narration/take_edges.py" lines=191:218
@source take-fall title="A stopped ending" path="src/filmkit/narration/take_edges.py" lines=20:29
@source retakes-doc title="Retakes bound to exact text" path="src/filmkit/narration/retakes.py" lines=1:9
@source run-on-doc title="Run-on takes" path="src/filmkit/narration/run_on.py" lines=1:8
@source audition-propose title="The proposed take" path="src/filmkit/narration/audition.py" lines=73:88
@source audition-doc title="What an audition qualifies a take by" path="src/filmkit/narration/audition.py" lines=1:19
@source judgment-doc title="One judgment of a take" path="src/filmkit/narration/judgment.py" lines=1:44
@source judgment-units title="A take held to its words" path="src/filmkit/narration/judgment.py" lines=89:96
@source reading-units title="Units compared by reading" path="src/filmkit/narration/recognition.py" lines=8:25
@source judge-doc title="Judging a narration" path="src/filmkit/narration/judge.py" lines=1:18
@source converge-doc title="A narration that settles by itself" path="src/filmkit/narration/converge.py" lines=1:42
@source transcription-doc title="Transcription as a proxy" path="src/filmkit/narration/transcription.py" lines=1:17
@source selection title="Selecting the recordings" path="src/filmkit/narration/selection.py" lines=73:108
@source speech-refusals title="Pause limits and declared terms" path="src/filmkit/narration/selection.py" lines=111:121
@source snapshots title="The pinned speech models" path="src/filmkit/narration/snapshots.py" lines=58:86
@source supply-doc title="The supply" path="src/filmkit/supply.py" lines=1:7
@source assembly-doc title="The assembly" path="src/filmkit/soundtrack/assembly.py" lines=1:10
@source abrupt title="Abrupt takes refused" path="src/filmkit/soundtrack/assembly.py" lines=157:180
@source program-gain title="One gain to the program level" path="src/filmkit/soundtrack/assembly.py" lines=495:516
@source segment-level title="A segment leveled within its chapter" path="src/filmkit/soundtrack/level.py" lines=171:199
@source clip-levels title="Segments leveled before chapters" path="src/filmkit/soundtrack/assembly.py" lines=576:595
@source assembly-record title="A segment's receipt record" path="src/filmkit/soundtrack/assembly.py" lines=424:444
@source releases title="Declared releases" path="src/filmkit/soundtrack/policy.py" lines=159:170
@source sound-gate title="The sound gate" path="src/filmkit/soundtrack/gates.py" lines=1:13
@source captions-doc title="Caption timing" path="src/filmkit/captions/timing.py" lines=1:10
@source gate-doc title="The picture gate" path="src/filmkit/picture/gates.py" lines=1:42
@source frame-gates title="Rules from the reviews" path="src/filmkit/picture/gates.py" lines=65:66
@source gate-check title="check-picture" path="src/filmkit/picture/gates.py" lines=418:498
@source detail-gates-doc title="Detail findings and exceptions" path="src/filmkit/picture/detail_gates.py" lines=1:16
@source candidate-inputs title="The inputs a stage binds" path="src/filmkit/picture/rendering.py" lines=84:114
@source rendering-doc title="Stage, render, validate" path="src/filmkit/picture/rendering.py" lines=1:18
@source require-renderer title="One canvas version" path="src/filmkit/picture/renderer.py" lines=120:126
@source renderer-doc title="The engine's renderer" path="src/filmkit/picture/renderer.py" lines=1:32
@source renderer-pin title="The pinned canvas build" path="src/filmkit/picture/renderer.py" lines=51:70
@source receipt-renderer title="A receipt of another renderer" path="src/filmkit/picture/renderer.py" lines=178:190
@source render-receipt title="What a render receipt names" path="src/filmkit/picture/renderer.py" lines=308:342
@source encoding title="The pictures' encoding" path="src/filmkit/picture/encoding.py" lines=1:22
@source faces-doc title="One reader of the faces" path="src/filmkit/picture/faces.py" lines=1:15
@source browser-doc title="The browser of the checks" path="src/filmkit/picture/browser.py" lines=1:7
@source stage title="Staging the picture" path="src/filmkit/picture/rendering.py" lines=214:271
@source render-gate title="A render needs a passing gate" path="src/filmkit/picture/rendering.py" lines=383:410
@source render title="Rendering the picture" path="src/filmkit/picture/rendering.py" lines=413:429
@source validate title="Validating the picture" path="src/filmkit/picture/rendering.py" lines=470:495
@source equivalence-doc title="Only the captions differ" path="src/filmkit/picture/equivalence.py" lines=1:40
@source derivation-doc title="A derived uncaptioned picture" path="src/filmkit/picture/derivation.py" lines=1:47
@source derivation-way title="Derived or rendered" path="src/filmkit/picture/derivation.py" lines=101:118
@source qualification-doc title="Qualifying the renderer" path="src/filmkit/picture/qualification.py" lines=1:35
@source tools-doc title="The Node tool runner" path="src/filmkit/tools.py" lines=1:26
@source durations-doc title="Duration records" path="src/filmkit/durations.py" lines=1:41
@source headless-doc title="The composition, run headlessly" path="src/filmkit/picture/headless-composition.mjs" lines=1:13
@source detail-audit-doc title="The detail audit" path="src/filmkit/picture/detail-audit.mjs" lines=1:16
@source package-doc title="Packaging" path="src/filmkit/delivery/packaging.py" lines=1:31
@source delivered-check title="Checking a finished film" path="src/filmkit/delivery/packaging.py" lines=547:591
@source package-film title="Packaging every film" path="src/filmkit/delivery/packaging.py" lines=628:663
@source package-inputs title="What the film package binds" path="src/filmkit/delivery/packaging.py" lines=275:287
@source player-doc title="The player page" path="src/filmkit/delivery/player.py" lines=1:5
@source verification-doc title="Verification" path="src/filmkit/delivery/verification.py" lines=1:18
@source verify-captions title="Captions stay typeset" path="src/filmkit/delivery/verification.py" lines=79:94
@source verify-spotlight title="Spotlight's import, read back" path="src/filmkit/delivery/verification.py" lines=341:371
@source verify-review title="The review it accepts" path="src/filmkit/delivery/verification.py" lines=374:437
@source verification-qualify title="One edition's checks" path="src/filmkit/delivery/verification.py" lines=460:495
@source reproduction-doc title="Reproduction" path="src/filmkit/delivery/reproduction.py" lines=1:27
@source documents-doc title="Delivery to the film's delivery folder" path="src/filmkit/delivery/folder.py" lines=1:45
@source round-doc title="A review round" path="src/filmkit/review/round.py" lines=1:11
@source human-listening title="Human listening stays separate" path="src/filmkit/review/round.py" lines=49:53
@source measurement-doc title="Review measurements" path="src/filmkit/review/measurement.py" lines=1:22
@source clarity-doc title="Voice clarity" path="src/filmkit/review/clarity.py" lines=1:21

## What does Film Kit read, and what does it leave to the film? {#p-context}

A film is the folder that holds `content/film.toml`; the engine finds it through `FILMKIT_ROOT` or the working directory.[](source:film-root) A film pins a release tag of the engine in its own Python project.[](source:readme-install)

@facts
| Frame rate | 60 fps; the engine refuses a script that declares another |
| Sample rate | 48 kHz |
| Program level | -16.5 LUFS, true peak at most -1 dBTP |
| Films per edition | 4: a UHD master and a 1080p film, each with captions and without |

The engine fixes these specifications, and a film uses them as they are.[](source:spec-rate)[](source:spec-sound)[](source:renditions) A film declares everything else in `content/film.toml`; this is the declaration of the sample film in the repository.[](source:sample-declaration)

@code id=declaration source=sample-declaration language=toml

@diagram architecture id=context-map source=context.architecture.json title="What Film Kit reads, runs and writes"

@steps id=context-steps
| step-ctx-film | Film repository | The declaration with the player's colours, each edition's script, cast and narration, and the picture's template, script and style.[](source:readme-layout) | context-map | ctx-film |
| step-ctx-engine | Film Kit engine | Each action produces one edition, which it takes as an argument; the declaration is checked before any work.[](source:produce-actions)[](source:film-load) `preflight` reports every stale or missing input before a render, the sound gate's record and the geometry record among them. It asks for the draft's still scan only of a film that declares drafts, and writes the edition's readiness receipt.[](source:preflight-doc) The scan must be of a draft that the engine's renderer drew.[](source:preflight-draft) | context-map | ctx-engine |
| step-ctx-supply | Supply step | The only step that reaches the network. It checks the browser build and each model snapshot against pinned digests.[](source:supply-doc) | context-map | ctx-supply |
| step-ctx-models | Speech models | A voice model narrates, a forced aligner times the words and a recognizer transcribes them, all on MLX.[](source:snapshots) | context-map | ctx-models |
| step-ctx-browser | Canvas, Chrome | The film's npm packages install the canvas that draws the picture, and the engine refuses any version but `@napi-rs/canvas` 1.1.1.[](source:require-renderer)[](source:renderer-pin) The browser build runs only the checks: the geometry check, the whole-turn gate, the cover and the players' checks.[](source:browser-doc) | context-map | ctx-browser |
| step-ctx-build | Build folder | Each edition's media and records go below the film's ignored `build/`.[](source:edition-places) | context-map | ctx-build |
| step-ctx-documents | Delivery folder | Delivery syncs the 25 members with rsync, then checks each against its source's SHA-256. The engine names no folder of a host: the film declares the folder's name under the key `delivery_folder`.[](source:documents-doc) | context-map | ctx-documents |

## What happens to one edition, from script to delivered films? {#p-route}

Each command runs at the film's root, and each production action names its edition with `--language zh|en`.[](source:readme-commands)

@workflow id=route-flow title="One edition, from script to delivered films"
| lane narration | Narration |
| lane sound | Sound |
| lane picture | Picture |
| lane delivery | Delivery |
| route-words | Check the words | security | narration | source:narrate-gate |
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
| step-route-words | Check the words | Narration runs the concept and readings checks first, even in a dry run, and stops on either.[](source:narrate-gate) | route-flow | route-words |
| step-route-narrate | Narrate each thought | Each thought is a native take from the cast's seed or retake. A recording whose request still matches is reused.[](source:synthesis-reuse) | route-flow | route-narrate |
| step-route-align | Align, transcribe | The pinned aligner times each word. The transcript is a proxy for pronunciation, not a certification.[](source:narrate-steps)[](source:transcription-doc) Each recording's transcript is cached under its waveform, the language and the recognizer's identity.[](source:transcription-doc) | route-flow | route-align |
| step-route-select | Select the takes | `produce select` binds each recording and its alignment to the current script, cast and narrator reference. It refuses a recording that breaks the film's pause limits or says a declared term unlike its reference.[](source:selection)[](source:speech-refusals) | route-flow | route-select |
| step-route-assemble | Assemble the sound | The assembly designs the pauses, levels each thought, segment and chapter, and reaches the program level with one gain. It refuses the laid-out soundtrack for an unmarked pause above the film's limit or a declared term said unlike its reference.[](source:assembly-doc)[](source:clip-levels)[](source:program-gain) `produce check-sound` then judges the assembled soundtrack, and refuses a segment under the film's clarity floor, an abrupt or cut ending and a stopped phrase.[](source:sound-gate) | route-flow | route-assemble |
| step-route-gate | Check the picture | `check-picture` audits every frame, each label's sync, the motion and the detail of single lines, strokes and names, then writes the gate record.[](source:gate-doc)[](source:detail-gates-doc) | route-flow | route-gate |
| step-route-render | Stage, render | The captioned and the uncaptioned picture are each staged, and the engine's renderer draws the captioned stage on a native canvas only after a passing gate record.[](source:stage)[](source:render-gate)[](source:render)[](source:renderer-doc) A film that declares software capture derives the uncaptioned picture from the captioned one: one x264 encode paints the caption band's rows in the ground. Otherwise the renderer draws the uncaptioned stage too, as it does with `--native`.[](source:derivation-doc) A derived pair is compared by the derivation's receipt, and no picture is decoded.[](source:equivalence-doc) | route-flow | route-render |
| step-route-compare | Compare the pictures | A rendered pair may differ only by its captions, in the composition at every caption and every half second, and in the decoded frames outside the captions' band. Every frame of both is then scanned for a fault that lasts one frame. The same scan measures the edge slivers: the samples more than 40 levels apart in each frame's densest block. A frame beyond the bound is refused.[](source:equivalence-doc) | route-flow | route-compare |
| step-route-package | Package the films | FFmpeg muxes each film's picture, with captions or without, with the soundtrack and chapters; each film is checked before it is linked into place.[](source:package-doc)[](source:package-film) | route-flow | route-package |
| step-route-verify | Verify every input | The verifier reads and decodes. It checks the sources, narration, both pictures and their equivalence, packages, all four decoded films and the review. Where the host has `mdimport`, it also reads back the keywords and authors Spotlight imports from each film.[](source:verification-doc)[](source:verify-spotlight) | route-flow | route-verify |

## What is checked before anything is narrated? {#p-words}

A film can make its words checkable before anything is narrated.[](source:readme-words)

@facts
| Concepts | Each segment says its declared concepts in approved words, alike in both editions. No counterexample appears in the narration, titles, caption terms, release prose, the player's summary or picture sources.[](source:concepts-doc) |
| Quotations | With a clone of the source repository, each concept's quotation must be in its document at the pinned commit.[](source:concepts-doc) |
| Readings | Each watched Chinese character lies in a declared word, whose reading must be a dictionary reading. A word the dictionary reads otherwise in context records why.[](source:readings-doc)[](source:watch-list) |
| Names | Every Latin word in the Chinese narration, and every English word with two or more capitals, needs a declared spoken form.[](source:readings-doc) |
| Terms | Every language's normalization must give each declared Latin-script term its one spoken form, and each edition that says the term must hold its reference occurrence.[](source:readings-doc) |

@callout level=note title="One refusal names every failure"
| Narration stops before any speech model loads, and the refusal lists every failure at once.[](source:narrate-gate) A film that declares neither check narrates as before.[](source:readme-neither) |

## How does a thought's take reach the soundtrack? {#p-takes}

The assembly refuses a thought whose take ends inside its last syllable.[](source:readme-endings)

@diagram lifecycle id=take-life source=take.lifecycle.json title="A thought's take, from seed to soundtrack"

@steps id=take-steps
| step-take-narrated | Narrated | A thought's request names its text, spoken text and seed. One module runs the voice model, and each take joins the next with added quiet only.[](source:synthesis-plan)[](source:one-model)[](source:thought-joins) | take-life | take-narrated |
| step-take-judged | Judged | A take ends naturally when its last 30 ms are quiet and its last syllable dies away instead of stopping.[](source:take-ending) Its last syllable's fall and the voicing before it are medians over every phase of the 1 ms frame grid. A fall after which the sound rises again and dies away is a closure before its release, and the release is the ending.[](source:take-fall) | take-life | take-judged |
| step-take-abrupt | Abrupt | The assembly lists every abrupt thought and refuses the edition.[](source:abrupt) | take-life | take-abrupt |
| step-take-auditioned | Auditioned | An audition narrates other seeds, or reads on into the next thought and cuts in the quiet. It proposes a take that no line of the judgment refuses, one that says the required phrase before one that does not. The bound retake keeps the SHA-256 of its text and speech.[](source:audition-propose)[](source:run-on-doc)[](source:retakes-doc) | take-life | take-auditioned |
| step-take-released | Released | A film may declare a release of up to 0.3 s for one join, and the assembly fades that tail into the silence.[](source:releases) | take-life | take-released |
| step-take-selected | Selected | Selection binds each recording and its alignment to the current script, cast and narrator reference.[](source:selection) | take-life | take-selected |
| step-take-assembled | Assembled | A script's `voice_performance` may declare `segment_level_tolerance_db`, from 0.1 to 3.0.[](source:readme-levels) The assembly then brings each segment whose leveled thoughts' median loudness stands farther than that from its chapter's median to the tolerance's edge.[](source:segment-level) It does so before it levels the chapters, by one static gain of at most 2 dB that keeps the segment's peak below -1 dBFS.[](source:clip-levels)[](source:segment-level) The soundtrack plays at -16.5 LUFS integrated, under a true-peak ceiling of -1 dBTP.[](source:program-level)[](source:program-gain) | take-life | take-assembled |

@facts
| Lines | The audition, `judge` and `converge` share one judgment of a take, by eight lines: its length, ending, phrase ends, opening, unmarked pauses, declared terms, units and clarity.[](source:judgment-doc)[](source:audition-doc) |
| Words | No unit of a take's transcript may differ from its text by reading; every other limit is the film's declaration or the engine's constant.[](source:judgment-units)[](source:judgment-doc) By reading, Han characters with the same reading are alike, and Latin units are compared by their letters and digits.[](source:reading-units) |
| Clarity | A take's clarity is judged only where the film declares a line for a single thought; with a floor alone it is recorded.[](source:judgment-doc) |
| Choice | Among the takes no line refuses, the widest margin is chosen, then the quietest ending, then the lowest seed.[](source:judgment-doc) |
| Convergence | `python -m filmkit.narration.converge` settles an edition's narration with no targets file, phrase or seed from its author.[](source:converge-doc) It narrates what is due, judges every thought and generates candidates for each refused one at the audition's seeds. It binds the accepted candidate with the widest margin, narrates and judges again, and then tries run-on takes.[](source:converge-doc) A thought still refused is named as not narratable as written, and no line is lowered for it.[](source:converge-doc) |

@callout level=note title="Why a take can end inside a syllable"
| With mlx-audio up to 0.6.4, each frame whose first codebook id is 0 removes 80 ms from the end of an in-context take.[](source:readme-endings) mlx-audio 0.6.5 carries the repair, `Blaizzy/mlx-audio#1116`, and the engine pins 0.6.6. A film that holds an earlier mlx-audio in its own lock still meets the fault.[](source:readme-endings) |

## What does each record bind? {#p-records}

A record names the SHA-256 of the files its step read, and the step that reads the record refuses other bytes.[](source:candidate-inputs)[](source:render-gate)

@diagram erd id=records-erd source=records.erd.json title="What each record binds"

@steps id=records-steps
| step-rec-selection | narration-selected.json | Binds the script and the cast, and each recording by its waveform's SHA-256.[](source:selection) | records-erd | rec-selection |
| step-rec-assembly | audio-assembly.json | Binds the script and the soundtrack it wrote, with the designed pauses and the program level.[](source:assembly-doc) It records each segment's gain as `segment_gain_db`.[](source:assembly-record) | records-erd | rec-assembly |
| step-rec-stage | stage.json | Binds the script, timeline, assembly, soundtrack and source manifest, and each staged member.[](source:candidate-inputs)[](source:stage) It also names the faces the renderer registers and the language the picture is drawn in.[](source:stage) | records-erd | rec-stage |
| step-rec-gates | picture-gates.json | Binds the composition, timeline, stylesheet, fonts and engine version that the audits ran on.[](source:gate-check) | records-erd | rec-gates |
| step-rec-package | film-package.json | Binds both pictures and their equivalence record, the soundtrack, cover, script, chapters and the film's `VERSION`, and each film's own SHA-256.[](source:package-inputs)[](source:package-film) | records-erd | rec-package |

@callout level=note title="A duration record binds nothing"
| Every production action and every narration writes a duration record when it ends: the command, its seconds and each phase's seconds.[](source:durations-doc)[](source:changelog-0230) A record also states the host's 1-minute load average at the command's start and at its end, which no check reads.[](source:durations-doc) No record binds it. `python -m filmkit.durations` prints each edition's records, the sum of its build and the time of the build.[](source:durations-doc) |

## What must pass before the picture renders? {#p-picture}

The frame, motion and detail audits run the film's own composition headlessly, on a canvas stand-in.[](source:headless-doc)[](source:detail-audit-doc)

@sequence id=picture-flow title="From stage to a validated picture"
| actor pic-command | Production command | frontend | source:produce-actions |
| actor pic-gate | Picture gate | security | source:gate-check |
| actor pic-tools | Node tool runner | backend | source:tools-doc |
| actor pic-record | Gate record | database | source:gate-doc |
| actor pic-render | Picture rendering | backend | source:render |
| actor pic-renderer | Native renderer | backend | source:renderer-doc |
| phase | Stage |
| pic-command | pic-render | stage-picture |
| phase | Gate |
| pic-command | pic-gate | check-picture |
| pic-gate | pic-tools | frame, motion, detail audits |
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
| step-pic-gate | Picture gate | `check-picture` runs the frame, motion and detail audits through the tool runner at the same time, then the sync audit on the frame audit's traces.[](source:gate-check)[](source:tools-doc) | picture-flow | pic-gate | | pic-command-to-pic-gate-1,pic-gate-to-pic-tools-1,pic-tools-to-pic-gate-1 |
| step-pic-record | Gate record | It binds what the audits ran on and lists every gated finding. An opening that shows the declared title too briefly is one, and so is a text at rest below 4.5:1. One gated finding refuses the render.[](source:gate-doc) A film keeps a finding of the detail audit, or a run far off centre, by declaring an exception with its reason, which the record lists.[](source:detail-gates-doc) | picture-flow | pic-record | | pic-gate-to-pic-record-1 |
| step-pic-render | Native renderer | `render-picture` refuses without a passing record for the current inputs, then renders the complete UHD stage of the captioned picture.[](source:render-gate)[](source:render) The renderer draws on a canvas of `@napi-rs/canvas` with the host's text renderer, and pipes each frame to x264 in four spans joined by stream copy.[](source:renderer-doc) With `--uncaptioned` it derives the uncaptioned picture for a film of software capture whose captioned picture the pinned canvas build drew. Otherwise, or with `--native`, it renders that picture's own stage.[](source:derivation-doc)[](source:derivation-way) | picture-flow | pic-renderer | | pic-render-to-pic-record-1,pic-record-to-pic-render-1,pic-render-to-pic-renderer-1,pic-renderer-to-pic-render-1 |
| step-pic-validate | Production command | `validate-picture` binds the picture to its receipt and stage, and checks each frame's place on the 60 fps grid. It binds a derived uncaptioned picture to its derivation's receipt.[](source:validate) A render receipt names the canvas package, the native library the render loaded, the text renderer and a digest of every drawn frame.[](source:render-receipt) A receipt that names another canvas package, version or text renderer is refused, and so are keyframes off the 2 s grid.[](source:receipt-renderer)[](source:validate)[](source:encoding) | picture-flow | pic-command | | pic-command-to-pic-render-3 |

@callout level=note title="Measured rules, not taste"
| Each frame finding that the gate refuses is a rule the DDWG reviews turned into one a delivered film keeps.[](source:frame-gates) Taste stays with the review.[](source:verification-doc) |

## Which parts carry the build? {#p-parts}

Each arrow points from a part to a part it calls.

@diagram architecture id=parts-map source=parts.architecture.json title="The parts that carry one edition"

@steps id=parts-steps
| step-part-narrate | Narration command | Runs the word checks, then synthesis, alignment and transcription as separate processes.[](source:narrate-steps) | parts-map | part-narrate |
| step-part-produce | Production command | Calls the owner of one action and reports its refusal as the action's name and reason.[](source:produce-actions) | parts-map | part-produce |
| step-part-takes | Thought takes | Requests, receipts and joins of each thought, checked again from every retained record.[](source:thought-joins) A narration divides the segments it has to generate among processes of the voice model, one for every 16 GB of host memory, up to three.[](source:narration-processes) | parts-map | part-takes |
| step-part-judgment | Take judgment | Judges a take of one thought by every line the film holds for a take, and names every failing line at once.[](source:judgment-doc) `python -m filmkit.narration.judge` judges every thought of an edition's receipt and writes `judgment.json` beside it.[](source:judge-doc) | parts-map | part-judgment |
| step-part-sound | Soundtrack assembly | Writes the soundtrack, the timeline with its captions, and the assembly receipt.[](source:assembly-doc) A caption cue's text is the typeset copy of its phrase, with typographic quotation marks.[](source:captions-doc) Its sound gate reads a segment's clarity as the reviewers do, over the whole soundtrack's kept frames whose centres lie in the segment.[](source:sound-gate)[](source:clarity-doc) | parts-map | part-sound |
| step-part-gate | Picture gate | Writes the gate record and refuses while one gated finding remains.[](source:gate-doc) | parts-map | part-gate |
| step-part-render | Picture rendering | Stages and renders the captioned UHD picture, renders or derives the uncaptioned one, validates both and proves they differ only by their captions.[](source:render)[](source:equivalence-doc) `qualify-renderer` renders the captioned stage a second time and compares the two renders with no row left out.[](source:qualification-doc) The second render is drawn in another count of spans, and the two must state one digest of their drawn frames.[](source:qualification-doc) One reader takes the film's `@font-face` rules for the audits' text table and the renderer, and refuses by name a rule it cannot hold the canvas to.[](source:faces-doc) | parts-map | part-render |
| step-part-renderer | Native renderer | Draws a staged picture on a native canvas, with no browser, and pipes each frame to an x264 encoder.[](source:renderer-doc) The engine pins `@napi-rs/canvas` 1.1.1 and, for Apple silicon, the SHA-256 of its native library.[](source:renderer-pin) | parts-map | part-renderer |
| step-part-package | Packaging | Derives the viewing package and writes all four films, each checked before it is linked into place. Each film and page names the film's version.[](source:package-doc) | parts-map | part-package |
| step-part-verify | Verification | Reads every record again and decodes all four films; the one file it writes is each edition's duration record.[](source:verification-doc) It refuses a caption cue whose text is not typeset.[](source:verify-captions) | parts-map | part-verify |

## What does a delivered edition hold, and how is it accepted? {#p-delivery}

Delivery fills the film's delivery folder with exactly 25 members, then reads them back.[](source:documents-doc)

@tree id=delivery-tree title="The 25 delivery members"
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
| step-dl-root | Delivery folder | The folder is the one `--destination` names, else the film's declared name below `FILMKIT_DELIVERY_ROOT`, else that name below the user's videos folder. A delivery refuses a destination it must not fill, such as the film's root or a folder inside it. Before rsync changes anything, a real browser reads the entry page and both players back, playing all four films of each. rsync then copies each member whose bytes differ, and keeps every replaced entry as a rollback copy.[](source:documents-doc) | delivery-tree | dl-root |
| step-dl-uhd | UHD masters | One with the captions the picture draws and one without, each copying its own picture's stream. All four films carry the same soundtrack, chapters, cover and release tags.[](source:renditions)[](source:package-doc) | delivery-tree | dl-uhd |
| step-dl-hd | 1080p viewing films | Each is decoded in software, averaged over each 2×2 block of pixels and encoded by x264, with a keyframe forced every 2 s. The two films of a size are made alike, each from its own picture. For a derived pair, the 1080p uncaptioned film instead reads the captioned picture and paints the caption band as the derivation did.[](source:renditions) No finished film may hold B-frames.[](source:delivered-check) | delivery-tree | dl-hd |
| step-dl-player | Player page | The engine renders it; a film declares only each edition's summary and the player's five colours.[](source:player-doc) | delivery-tree | dl-player |
| step-dl-chapters | Chapters, JSON and FFmetadata | Every track of each film carries the edition's language; packaging writes the chapter track's language in place.[](source:delivered-check)[](source:package-doc) | delivery-tree | dl-chapters |

| Check        | What it reads                                                                                                                                                            | What passing means                                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| Review round | Prompts with each film's SHA-256, and the round's measurements[](source:round-doc)[](source:measurement-doc)                                                             | Independent reviews score each edition on every declared dimension {good:Scored}                                               |
| Verification | Sources, narration, render, packages, decoded films, Spotlight's import and the review[](source:verification-qualify)[](source:verify-spotlight)[](source:verify-review) | The edition binds its current inputs, and its review meets the film's floors {good:Bound}                                      |
| Reproduction | The release manifest and the published assets[](source:reproduction-doc)                                                                                                 | A rebuild keeps the release's decoded audio, streams, chapters and tags, and each frame meets its PSNR floor {good:Reproduced} |

## How did Film Kit get here? {#p-history}

Film Kit released v0.1.0 on 30 October 2026 and v0.24.0 on 19 November.[](source:changelog-010)[](source:changelog-0240) The timeline shows the twenty releases that changed how a film is made, v0.23.0, v0.23.1 and v0.24.0 the latest.[](source:changelog-0230)[](source:changelog-0231)[](source:changelog-0240) It also shows the patch releases v0.21.1 and v0.21.2, which moved only the repository's tools and pinned packages.[](source:changelog-0211)[](source:changelog-0212) The v0.21.3 release did the same and is not on the timeline.[](source:changelog-0213)

The v0.22.1 release moved the renderer to HyperFrames 0.9.46, and the sample film's twelve films decode to the same frames.[](source:changelog-0221) It is not on the timeline either. The repository keeps no dated roadmap; what is still open is listed last on this page.

@diagram timeline id=history source=history.timeline.json title="How Film Kit got here"

## What is delivered, and what is still open? {#p-maturity}

An engine change keeps every film's output bytes unless its release says otherwise.[](source:agents-contract)

| Area                    | State                                | What that means                                                                                                                                                                                                                                                                                                                |
| ----------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Platform                | Apple silicon {caution:One platform} | The speech models run on MLX, so the engine needs an Apple-silicon Mac.[](source:readme-requirements)                                                                                                                                                                                                                          |
| Sample film             | Local acceptance {caution:Not in CI} | Its build needs the speech models and the browser build, so hosted CI runs only the portable proof.[](source:readme-dev)                                                                                                                                                                                                       |
| Human listening         | Separate {caution:Not scored}        | A review scores audio from automated evidence; listening is a later acceptance.[](source:human-listening)                                                                                                                                                                                                                      |
| Take endings            | Guarded {good:Refused}               | mlx-audio 0.6.5 carries the upstream repair, and the engine pins 0.6.6. A take can still end inside its last syllable for another reason, so auditions keep endings whole and the assembly refuses an abrupt take.[](source:readme-endings)[](source:abrupt)                                                                   |
| Text widths             | Measured {good:The film's fonts}     | Audits measure widths with the film's own faces; a text's height keeps an estimate.[](source:readme-metrics)                                                                                                                                                                                                                   |
| Still off-centre states | Refused {good:Whatever follows}      | The gate refuses every still state that stands more than 50 px off centre for 2 s or more. That holds whether the picture then grows from it, it ends within its stage, or a stage cut or the next scene replaces it.[](source:readme-balance)                                                                                 |
| A new renderer          | Pinned {caution:The film decides}    | A film keeps its `filmkit` pin until it produces, reviews and accepts an edition on the new release.[](source:changelog-pin) A film that takes v0.24.0 declares `@napi-rs/canvas` 1.1.1 and renders its pictures again: validation refuses a receipt that names no canvas.[](source:readme-install)[](source:receipt-renderer) |
