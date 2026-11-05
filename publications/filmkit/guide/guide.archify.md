# How does filmkit rebuild a narrated film from its tracked sources? {#guide}

filmkit rebuilds a film's Chinese and English editions from the film's own repository.[](source:readme-what) It narrates each script with a pinned local voice model, then assembles, captions, renders and packages each edition.[](source:readme-what) Each step records the SHA-256 of what it read, and a later step refuses a record bound to other bytes.[](source:candidate-inputs)[](source:render-gate)

- [The engine holds no film's content](block:p-context): scripts, casts, pages and the picture's composition stay in the film's repository.[](source:readme-engine)
- [Words are checked before any speech model loads](block:p-words), and a refusal names every failure.[](source:narrate-gate)
- [A take reaches the soundtrack only if it ends whole](block:p-takes), or if the film declares a release for its join.[](source:abrupt)
- [The picture renders only after its gate passes](block:p-picture) for the current composition, timeline, stylesheet, fonts and engine version.[](source:render-gate)

@answer scope="filmkit v0.9.0 · commit 0d56c27 · its source and its own documents"
@meta locale=en style=editorial
@source readme-what title="What filmkit does" path="README.md" lines=3:3
@source readme-engine title="The engine carries no film's content" path="README.md" lines=5:5
@source readme-requirements title="Requirements" path="README.md" lines=9:12
@source readme-layout title="A film's layout" path="README.md" lines=18:27
@source readme-words title="Concepts and readings" path="README.md" lines=52:55
@source readme-neither title="A film without either check" path="README.md" lines=59:59
@source readme-gate title="The picture gate" path="README.md" lines=63:63
@source readme-metrics title="Text measured with the film's fonts" path="README.md" lines=65:65
@source readme-balance title="Balance in every frame" path="README.md" lines=67:67
@source readme-install title="Installing the engine in a film" path="README.md" lines=75:85
@source readme-commands title="Commands" path="README.md" lines=91:103
@source readme-endings title="Whole endings" path="README.md" lines=107:109
@source readme-dev title="Development" path="README.md" lines=127:127
@source agents-contract title="The engine contract" path="AGENTS.md" lines=10:16
@source changelog-pin title="A film keeps its pin" path="CHANGELOG.md" lines=46:46
@source film-root title="Finding the film" path="src/filmkit/repository.py" lines=28:50
@source film-load title="Checking the declaration" path="src/filmkit/film.py" lines=120:132
@source edition-places title="Where an edition writes" path="src/filmkit/production.py" lines=109:119
@source renditions title="The two delivered films" path="src/filmkit/production.py" lines=39:59
@source program-level title="One program level" path="src/filmkit/specification.py" lines=45:47
@source produce-actions title="The production actions" path="src/filmkit/produce.py" lines=45:59
@source narrate-gate title="Checks before synthesis" path="src/filmkit/narration/narrate.py" lines=111:121
@source narrate-steps title="Synthesis, alignment, transcription" path="src/filmkit/narration/narrate.py" lines=54:108
@source concepts-doc title="The concept check" path="src/filmkit/concepts.py" lines=1:15
@source readings-doc title="The readings check" path="src/filmkit/narration/readings.py" lines=1:24
@source watch-list title="The watched characters" path="src/filmkit/narration/watched-characters.toml" lines=1:14
@source synthesis-plan title="Each segment's job" path="src/filmkit/narration/synthesis.py" lines=176:194
@source synthesis-reuse title="Reuse or refuse a recording" path="src/filmkit/narration/synthesis.py" lines=197:225
@source one-model title="The only module that runs the voice model" path="src/filmkit/narration/group_generation.py" lines=1:4
@source thought-joins title="Thought requests, receipts and joins" path="src/filmkit/narration/thought_groups.py" lines=1:10
@source take-ending title="A take's ending" path="src/filmkit/narration/take_edges.py" lines=157:184
@source retakes-doc title="Retakes bound to exact text" path="src/filmkit/narration/retakes.py" lines=1:9
@source run-on-doc title="Run-on takes" path="src/filmkit/narration/run_on.py" lines=1:8
@source audition-propose title="The proposed take" path="src/filmkit/narration/audition.py" lines=67:91
@source transcription-doc title="Transcription as a proxy" path="src/filmkit/narration/transcription.py" lines=1:10
@source selection title="Selecting the recordings" path="src/filmkit/narration/selection.py" lines=65:97
@source snapshots title="The pinned speech models" path="src/filmkit/narration/snapshots.py" lines=58:86
@source supply-doc title="The supply" path="src/filmkit/supply.py" lines=1:7
@source assembly-doc title="The assembly" path="src/filmkit/soundtrack/assembly.py" lines=1:8
@source abrupt title="Abrupt takes refused" path="src/filmkit/soundtrack/assembly.py" lines=122:142
@source program-gain title="One gain to the program level" path="src/filmkit/soundtrack/assembly.py" lines=394:415
@source releases title="Declared releases" path="src/filmkit/soundtrack/policy.py" lines=159:170
@source captions-doc title="Caption timing" path="src/filmkit/captions/timing.py" lines=1:6
@source gate-doc title="The picture gate" path="src/filmkit/picture/gates.py" lines=1:16
@source frame-gates title="Rules from the reviews" path="src/filmkit/picture/gates.py" lines=36:37
@source gate-check title="check-picture" path="src/filmkit/picture/gates.py" lines=168:213
@source candidate-inputs title="The inputs a stage binds" path="src/filmkit/picture/rendering.py" lines=99:129
@source require-renderer title="One renderer version" path="src/filmkit/picture/rendering.py" lines=181:191
@source stage title="Staging the picture" path="src/filmkit/picture/rendering.py" lines=225:267
@source render-gate title="A render needs a passing gate" path="src/filmkit/picture/rendering.py" lines=443:470
@source render title="Rendering the picture" path="src/filmkit/picture/rendering.py" lines=473:524
@source validate title="Validating the picture" path="src/filmkit/picture/rendering.py" lines=545:553
@source tools-doc title="The Node tool runner" path="src/filmkit/tools.py" lines=1:14
@source headless-doc title="The composition, run headlessly" path="src/filmkit/picture/headless-composition.mjs" lines=1:11
@source package-doc title="Packaging" path="src/filmkit/delivery/packaging.py" lines=1:17
@source delivered-check title="Checking a finished film" path="src/filmkit/delivery/packaging.py" lines=470:501
@source package-film title="Packaging both films" path="src/filmkit/delivery/packaging.py" lines=535:564
@source verification-doc title="Verification" path="src/filmkit/delivery/verification.py" lines=1:10
@source verify-review title="The review it accepts" path="src/filmkit/delivery/verification.py" lines=286:334
@source verification-qualify title="One edition's checks" path="src/filmkit/delivery/verification.py" lines=337:367
@source reproduction-doc title="Reproduction" path="src/filmkit/delivery/reproduction.py" lines=1:15
@source documents-doc title="Delivery to the Documents folder" path="src/filmkit/delivery/documents_folder.py" lines=1:16
@source round-doc title="A review round" path="src/filmkit/review/round.py" lines=1:12
@source human-listening title="Human listening stays separate" path="src/filmkit/review/round.py" lines=44:48
@source measurement-doc title="Review measurements" path="src/filmkit/review/measurement.py" lines=1:13

## What does filmkit read, and what does it leave to the film? {#p-context}

A film is the folder that holds `content/film.toml`; the engine finds it through `FILMKIT_ROOT` or the working directory.[](source:film-root) A film pins a release tag of the engine in its own Python project.[](source:readme-install)

@diagram architecture id=context-map source=context.architecture.json title="What filmkit reads, runs and writes"

@steps id=context-steps
| step-ctx-film | Film repository | The declaration, each edition's script, cast and player, and the picture's template, script and style.[](source:readme-layout) | context-map | ctx-film |
| step-ctx-engine | filmkit engine | Each action produces one edition, which it takes as an argument; the declaration is checked before any work.[](source:produce-actions)[](source:film-load) | context-map | ctx-engine |
| step-ctx-supply | Supply step | The only step that reaches the network. It checks the browser build and each model snapshot against pinned digests.[](source:supply-doc) | context-map | ctx-supply |
| step-ctx-models | Speech models | A voice model narrates, a forced aligner times the words and a recognizer transcribes them, all on MLX.[](source:snapshots) | context-map | ctx-models |
| step-ctx-browser | HyperFrames, Chrome | The film's npm packages install the renderer, and the engine refuses any version but HyperFrames 0.9.9.[](source:require-renderer) | context-map | ctx-browser |
| step-ctx-build | Build folder | Each edition's media and records go below the film's ignored `build/`.[](source:edition-places) | context-map | ctx-build |
| step-ctx-documents | Documents folder | Delivery syncs the 21 members with rsync, then checks each against its source's SHA-256.[](source:documents-doc) | context-map | ctx-documents |

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
| route-package | Package the films | backend | delivery | source:package-film |
| route-verify | Verify every input | security | delivery | source:verification-qualify |
| route-words > route-narrate | pass |
| route-narrate > route-align | |
| route-align > route-select | |
| route-select > route-assemble | |
| route-assemble > route-gate | |
| route-gate > route-render | pass | emphasis |
| route-render > route-package | |
| route-package > route-verify | |

@steps id=route-steps
| step-route-words | Check the words | Narration runs the concept and readings checks first, even in a dry run, and stops on either.[](source:narrate-gate) | route-flow | route-words |
| step-route-narrate | Narrate each thought | Each thought is a native take from the cast's seed or retake. A recording whose request still matches is reused.[](source:synthesis-reuse) | route-flow | route-narrate |
| step-route-align | Align, transcribe | The pinned aligner times each word. The transcript is a proxy for pronunciation, not a certification.[](source:narrate-steps)[](source:transcription-doc) | route-flow | route-align |
| step-route-select | Select the takes | `produce select` binds each recording and its alignment to the current script, cast and narrator reference.[](source:selection) | route-flow | route-select |
| step-route-assemble | Assemble the sound | The assembly designs the pauses, levels each thought and chapter, and reaches the program level with one gain.[](source:assembly-doc)[](source:program-gain) | route-flow | route-assemble |
| step-route-gate | Check the picture | `check-picture` audits every frame, each label's sync and the motion, then writes the gate record.[](source:gate-doc) | route-flow | route-gate |
| step-route-render | Stage, render | The stage inlines the timeline, script and style. HyperFrames renders it only after a passing gate record.[](source:stage)[](source:render-gate) | route-flow | route-render |
| step-route-package | Package the films | FFmpeg muxes the picture, soundtrack and chapters into each film, which is checked before it is linked into place.[](source:package-film) | route-flow | route-package |
| step-route-verify | Verify every input | The verifier reads and decodes. It checks the sources, narration, render, packages, decoded films and review.[](source:verification-doc) | route-flow | route-verify |

## What is checked before anything is narrated? {#p-words}

A film can make its words checkable before anything is narrated.[](source:readme-words)

@facts
| Concepts | Each segment says its declared concepts in approved words, alike in both editions. No counterexample appears in the narration, titles, caption terms, release prose, player page or picture sources.[](source:concepts-doc) |
| Quotations | With a clone of the source repository, each concept's quotation must be in its document at the pinned commit.[](source:concepts-doc) |
| Readings | Each watched Chinese character lies in a declared word, whose reading must be a dictionary reading. A word the dictionary reads otherwise in context records why.[](source:readings-doc)[](source:watch-list) |
| Names | Every Latin word in the Chinese narration, and every English word with two or more capitals, needs a declared spoken form.[](source:readings-doc) |

@callout level=note title="One refusal names every failure"
| Narration stops before any speech model loads, and the refusal lists every failure at once.[](source:narrate-gate) A film that declares neither check narrates as before.[](source:readme-neither) |

## How does a thought's take reach the soundtrack? {#p-takes}

The assembly refuses a thought whose take ends inside its last syllable.[](source:readme-endings)

@diagram lifecycle id=take-life source=take.lifecycle.json title="A thought's take, from seed to soundtrack"

@steps id=take-steps
| step-take-narrated | Narrated | A thought's request names its text, spoken text and seed. One module runs the voice model, and each take joins the next with added quiet only.[](source:synthesis-plan)[](source:one-model)[](source:thought-joins) | take-life | take-narrated |
| step-take-judged | Judged | A take ends naturally when its last 30 ms are quiet and its last syllable dies away instead of stopping.[](source:take-ending) | take-life | take-judged |
| step-take-abrupt | Abrupt | The assembly lists every abrupt thought and refuses the edition.[](source:abrupt) | take-life | take-abrupt |
| step-take-auditioned | Auditioned | An audition narrates other seeds, or reads on into the next thought and cuts in the quiet. It proposes the qualified take with the fewest differing units. The bound retake keeps the SHA-256 of its text and speech.[](source:audition-propose)[](source:run-on-doc)[](source:retakes-doc) | take-life | take-auditioned |
| step-take-released | Released | A film may declare a release of up to 0.3 s for one join, and the assembly fades that tail into the silence.[](source:releases) | take-life | take-released |
| step-take-selected | Selected | Selection binds each recording and its alignment to the current script, cast and narrator reference.[](source:selection) | take-life | take-selected |
| step-take-assembled | Assembled | The soundtrack plays at -16.5 LUFS integrated, under a true-peak ceiling of -1 dBTP.[](source:program-level)[](source:program-gain) | take-life | take-assembled |

@callout level=note title="Why a take can end inside a syllable"
| With mlx-audio 0.6.4, each frame whose first codebook id is 0 removes 80 ms from the end of an in-context take.[](source:readme-endings) The fix is proposed upstream as `Blaizzy/mlx-audio#1116`. |

## What does each record bind? {#p-records}

A record names the SHA-256 of the files its step read, and the step that reads the record refuses other bytes.[](source:candidate-inputs)[](source:render-gate)

@diagram erd id=records-erd source=records.erd.json title="What each record binds"

@steps id=records-steps
| step-rec-selection | narration-selected.json | Binds the script and the cast, and each recording by its waveform's SHA-256.[](source:selection) | records-erd | rec-selection |
| step-rec-assembly | audio-assembly.json | Binds the script and the soundtrack it wrote, with the designed pauses and the program level.[](source:assembly-doc) | records-erd | rec-assembly |
| step-rec-stage | stage.json | Binds the script, timeline, assembly, soundtrack and source manifest, and each staged member.[](source:candidate-inputs)[](source:stage) | records-erd | rec-stage |
| step-rec-gates | picture-gates.json | Binds the composition, timeline, stylesheet, fonts and engine version that the audits ran on.[](source:gate-check) | records-erd | rec-gates |
| step-rec-package | film-package.json | Binds the picture, soundtrack, cover, script and chapters, and each film's own SHA-256.[](source:package-film) | records-erd | rec-package |

## What must pass before the picture renders? {#p-picture}

The frame audit and the motion audit run the film's own composition headlessly, on a canvas stand-in.[](source:headless-doc)

@sequence id=picture-flow title="From stage to a validated picture"
| actor pic-command | Production command | frontend | source:produce-actions |
| actor pic-gate | Picture gate | security | source:gate-check |
| actor pic-tools | Node tool runner | backend | source:tools-doc |
| actor pic-record | Gate record | database | source:gate-doc |
| actor pic-render | Picture rendering | backend | source:render |
| actor pic-hyperframes | HyperFrames | external | source:require-renderer |
| phase | Stage |
| pic-command | pic-render | stage-picture |
| phase | Gate |
| pic-command | pic-gate | check-picture |
| pic-gate | pic-tools | frame and motion audits |
| pic-tools | pic-gate | reports and traces | return |
| pic-gate | pic-record | pass or refuse |
| phase | Render |
| pic-command | pic-render | render-picture |
| pic-render | pic-record | read the record |
| pic-record | pic-render | current and passing | return |
| pic-render | pic-hyperframes | render the stage | emphasis |
| pic-hyperframes | pic-render | picture | return |
| phase | Validate |
| pic-command | pic-render | validate-picture |

@steps id=picture-steps
| step-pic-stage | Picture rendering | `stage-picture` inlines the timeline, script and style into one document, and records its inputs in `stage.json`.[](source:stage) | picture-flow | pic-render | | pic-command-to-pic-render-1 |
| step-pic-gate | Picture gate | `check-picture` runs the frame and motion audits through the tool runner, then the sync audit on their traces.[](source:gate-check)[](source:tools-doc) | picture-flow | pic-gate | | pic-command-to-pic-gate-1,pic-gate-to-pic-tools-1,pic-tools-to-pic-gate-1 |
| step-pic-record | Gate record | It binds what the audits ran on and lists every gated finding. One gated finding refuses the render.[](source:gate-doc) | picture-flow | pic-record | | pic-gate-to-pic-record-1 |
| step-pic-render | HyperFrames | `render-picture` refuses without a passing record for the current inputs, then renders the complete UHD stage.[](source:render-gate)[](source:render) | picture-flow | pic-hyperframes | | pic-render-to-pic-record-1,pic-record-to-pic-render-1,pic-render-to-pic-hyperframes-1,pic-hyperframes-to-pic-render-1 |
| step-pic-validate | Production command | `validate-picture` binds the picture to its receipt and stage, and checks each frame's place on the 60 fps grid.[](source:validate) | picture-flow | pic-command | | pic-command-to-pic-render-3 |

@callout level=note title="Measured rules, not taste"
| Each frame finding that the gate refuses is a rule the DDWG reviews turned into one a delivered film keeps.[](source:frame-gates) Taste stays with the review.[](source:verification-doc) |

## Which parts carry the build? {#p-parts}

Each arrow points from a part to a part it calls.

@diagram architecture id=parts-map source=parts.architecture.json title="The parts that carry one edition"

@steps id=parts-steps
| step-part-narrate | Narration command | Runs the word checks, then synthesis, alignment and transcription as separate processes.[](source:narrate-steps) | parts-map | part-narrate |
| step-part-produce | Production command | Calls the owner of one action and reports its refusal as the action's name and reason.[](source:produce-actions) | parts-map | part-produce |
| step-part-takes | Thought takes | Requests, receipts and joins of each thought, checked again from every retained record.[](source:thought-joins) | parts-map | part-takes |
| step-part-sound | Soundtrack assembly | Writes the soundtrack, the timeline with its captions, and the assembly receipt.[](source:assembly-doc) | parts-map | part-sound |
| step-part-gate | Picture gate | Writes the gate record and refuses while one gated finding remains.[](source:gate-doc) | parts-map | part-gate |
| step-part-render | Picture rendering | Stages, renders and validates the complete UHD picture.[](source:render) | parts-map | part-render |
| step-part-package | Packaging | Derives the viewing package and writes both films, each checked before it is linked into place.[](source:package-doc) | parts-map | part-package |
| step-part-verify | Verification | Reads every record again and decodes both films; it writes nothing.[](source:verification-doc) | parts-map | part-verify |

## What does a delivered edition hold, and how is it accepted? {#p-delivery}

Delivery fills the film's Documents folder with exactly 21 members, then reads them back.[](source:documents-doc)

@tree id=delivery-tree title="The 21 delivery members"
| dl-root | Documents folder | - |
| dl-entry | Language entry page | dl-root |
| dl-edition | zh and en, each | dl-root |
| dl-uhd | UHD master | dl-edition |
| dl-hd | Captioned 1080p film | dl-edition |
| dl-cover | Cover, PNG and JPEG | dl-edition |
| dl-subtitles | SRT and VTT | dl-edition |
| dl-transcript | Transcript | dl-edition |
| dl-chapters | Chapters, JSON and FFmetadata | dl-edition |
| dl-player | Player page | dl-edition |

@steps id=delivery-steps
| step-dl-root | Documents folder | rsync copies each member whose bytes differ, and keeps every replaced entry as a rollback copy.[](source:documents-doc) | delivery-tree | dl-root |
| step-dl-uhd | UHD master | The rendered picture stream, copied with the soundtrack, chapters, cover and release tags.[](source:renditions) | delivery-tree | dl-uhd |
| step-dl-hd | Captioned 1080p film | The same picture re-encoded through VideoToolbox; both films show the captions the picture draws.[](source:renditions) | delivery-tree | dl-hd |
| step-dl-chapters | Chapters, JSON and FFmetadata | Every track of each film carries the edition's language; packaging writes the chapter track's language in place.[](source:delivered-check)[](source:package-doc) | delivery-tree | dl-chapters |

| Check        | What it reads                                                                                                             | What passing means                                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Review round | Prompts with each film's SHA-256, and the round's measurements[](source:round-doc)[](source:measurement-doc)              | Independent reviews score each edition on every declared dimension {good:Scored}                                               |
| Verification | Sources, narration, render, packages, decoded films and the review[](source:verification-qualify)[](source:verify-review) | The edition binds its current inputs, and its review meets the film's floors {good:Bound}                                      |
| Reproduction | The release manifest and the published assets[](source:reproduction-doc)                                                  | A rebuild keeps the release's decoded audio, streams, chapters and tags, and each frame meets its PSNR floor {good:Reproduced} |

## What is delivered, and what is still open? {#p-maturity}

An engine change keeps every film's output bytes unless its release says otherwise.[](source:agents-contract)

| Area                    | State                                | What that means                                                                                                                                                     |
| ----------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Platform                | Apple silicon {caution:One platform} | The speech models run on MLX, and the 1080p films are encoded with VideoToolbox.[](source:readme-requirements)                                                      |
| Sample film             | Local acceptance {caution:Not in CI} | Its build needs the speech models and the browser build, so hosted CI runs only the portable proof.[](source:readme-dev)                                            |
| Human listening         | Separate {caution:Not scored}        | A review scores audio from automated evidence; listening is a later acceptance.[](source:human-listening)                                                           |
| Take endings            | Guarded {good:Refused}               | Auditions keep endings whole until a mlx-audio release carries the upstream fix, and the assembly refuses an abrupt take.[](source:readme-endings)[](source:abrupt) |
| Text widths             | Measured {good:The film's fonts}     | Audits measure widths with the film's own faces; a text's height keeps an estimate.[](source:readme-metrics)                                                        |
| Still off-centre states | Recorded {caution:Not refused}       | Only the stage's intent tells a finished composition from a build-up held for its next part.[](source:readme-balance)                                               |
| A new renderer          | Pinned {caution:The film decides}    | A film keeps its filmkit pin until it produces, reviews and accepts an edition on the new release.[](source:changelog-pin)                                          |
