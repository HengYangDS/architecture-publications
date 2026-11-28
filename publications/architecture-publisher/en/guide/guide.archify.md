# How does Architecture Publisher turn an architecture model into a print edition and a page? {#guide}

`archpub` reads one model, binds the files its components claim at the pinned revision and plans its views. It lays each view out on one grid, composes each as a plate, typesets the print edition with Typst and delivers one Archify page.[](source:contract-processing) A manifest binds every artifact to its inputs, and a named reviewer accepts the delivery before it is published.[](source:contract-product)[](source:contract-acceptance)

- [The model is the only source of meaning](block:p-model): the publisher never infers architecture from code.[](source:model-meaning)[](source:contract-meaning)
- [Git is only read](block:p-files): each file comes from the pinned commit, and the checkout never changes.[](source:model-repo)
- [A layout with an overlap is never drawn](block:p-layout), and a view that no layout draws is refused, not shrunk.[](source:contract-layout-floor)
- [Only an accepted delivery is published](block:p-accept), and never over a different one.[](source:contract-acceptance)

@answer scope="Architecture Publisher v0.22.0 · commit 5b6dd53 · its source and its own documents · re-pin counts measured on 2026-11-18"
@meta locale=en style=editorial
@source contract-product title="The product" path="docs/product-contract.md" lines=13:21
@source contract-meaning title="Who owns meaning and form" path="docs/product-contract.md" lines=38:43
@source contract-processing title="The six steps of a build" path="docs/product-contract.md" lines=73:86
@source contract-bytes title="The same inputs, the same bytes" path="docs/product-contract.md" lines=88:90
@source contract-guide title="The guide and the generated page" path="docs/product-contract.md" lines=135:145
@source contract-layout-floor title="Cards, wires and no overlap" path="docs/product-contract.md" lines=158:169
@source contract-acceptance title="Acceptance and publication" path="docs/product-contract.md" lines=181:185
@source contract-counts title="Counts, never refusals" path="docs/product-contract.md" lines=196:198
@source model-meaning title="The only source of meaning" path="docs/reference/model.md" lines=11:17
@source model-fields title="Top-level fields" path="docs/reference/model.md" lines=61:89
@source model-unknown title="Unknown fields" path="docs/reference/model.md" lines=108:109
@source model-claims title="The most specific claim" path="docs/reference/model.md" lines=173:190
@source model-repo title="Reading at the revision" path="docs/reference/model.md" lines=192:200
@source model-version-one title="From earlier versions" path="docs/reference/model.md" lines=243:256
@source model-coverage title="Coverage paths and globs" path="docs/reference/model.md" lines=269:275
@source model-repin title="The re-pin worklist" path="docs/reference/model.md" lines=297:309
@source model-shifted title="Shifted and touched citations" path="docs/reference/model.md" lines=311:314
@source model-overview title="The overview a model states" path="docs/reference/overview.md" lines=11:17
@source model-groups title="Groups" path="docs/reference/model.md" lines=493:499
@source model-views title="Views" path="docs/reference/model.md" lines=503:514
@source model-views-plan title="Declared and planned views" path="docs/reference/model.md" lines=564:567
@source ops-check title="archpub check" path="docs/reference/operations.md" lines=100:112
@source ops-needs title="What the publisher needs" path="docs/reference/operations.md" lines=63:73
@source ops-build title="archpub build" path="docs/reference/operations.md" lines=113:115
@source ops-migrate title="Import, scaffold and migrate" path="docs/reference/operations.md" lines=129:131
@source cli-exit title="Exit status and refusals" path="docs/reference/command-line.md" lines=40:57
@source ops-rows title="Rows, placement and channels" path="docs/reference/operations.md" lines=149:163
@source ops-overlap title="A layout never overlaps" path="docs/reference/operations.md" lines=165:170
@source ops-gates title="The four balance gates" path="docs/reference/operations.md" lines=203:208
@source ops-page title="The generated page" path="docs/reference/operations.md" lines=332:341
@source ops-page-grid title="The page's diagrams on the same grid" path="docs/reference/operations.md" lines=343:348
@source ops-overview title="The overview" path="docs/reference/operations.md" lines=407:423
@source ops-guide title="The guide" path="docs/reference/operations.md" lines=427:444
@source ops-guide-clone title="Sources verified at the revision" path="docs/reference/operations.md" lines=446:454
@source ops-scaffold title="A starting guide" path="docs/reference/operations.md" lines=456:459
@source ops-delivery title="The delivery's files" path="docs/reference/operations.md" lines=466:482
@source ops-manifest title="The manifest" path="docs/reference/operations.md" lines=488:506
@source ops-accept title="archpub accept" path="docs/reference/operations.md" lines=510:514
@source ops-publish title="archpub publish" path="docs/reference/operations.md" lines=562:566
@source readme-layout title="Layout is a grid" path="README.md" lines=63:65
@source build-prepare title="One build's route" path="src/build.mjs" lines=192:312
@source overview-warnings title="What a check warns of on the overview" path="src/build.mjs" lines=126:167
@source overview-unreached title="A view the overview does not reach" path="src/build.mjs" lines=303:312
@source build-artifacts title="Every artifact's digest" path="src/build.mjs" lines=466:483
@source manifest-record title="The manifest record" path="src/manifest.mjs" lines=102:167
@source build-rename title="Renamed into place" path="src/build.mjs" lines=584:599
@source load-top title="The model's fields" path="src/model/schema.json" lines=7:17
@source load-problems title="Every problem in one pass" path="src/model/load.mjs" lines=62:73
@source load-files title="Claims and cited files" path="src/model/load.mjs" lines=141:179
@source load-version title="A version 1 model" path="src/model/load.mjs" lines=181:191
@source load-views title="Tiers or members" path="src/model/load.mjs" lines=395:427
@source model-composition title="A view's composition" path="docs/reference/model.md" lines=522:552
@source paths-coverage title="Checking the coverage scope" path="src/model/paths.mjs" lines=37:77
@source git-read title="Read-only Git" path="src/sources/git.mjs" lines=8:31
@source git-commit title="The pinned commit" path="src/sources/git.mjs" lines=68:78
@source scope-glob title="Globs matched by Git" path="src/sources/scope.mjs" lines=29:51
@source scope-at title="The scope at a commit" path="src/sources/scope.mjs" lines=86:128
@source bind-owner title="The most specific claim" path="src/sources/bind.mjs" lines=172:177
@source bind-refuse title="files_unresolved" path="src/sources/bind.mjs" lines=201:220
@source bind-read title="One batch of digests" path="src/sources/bind.mjs" lines=221:238
@source views-plan title="Planning the views" path="src/plan/views.mjs" lines=131:159
@source views-undrawn title="What no view draws" path="src/plan/views.mjs" lines=161:179
@source views-admit title="Admitting every view" path="src/plan/views.mjs" lines=201:224
@source guide-read title="Reading the draft" path="src/map/guide.mjs" lines=190:221
@source guide-page title="The draft as the page" path="src/map/guide.mjs" lines=223:292
@source guide-clone title="A temporary clone" path="src/map/guide.mjs" lines=312:332
@source explainer-page title="One panel per view" path="src/map/explainer.mjs" lines=213:230
@source explainer-deliver title="Finalizing with Archify" path="src/map/explainer.mjs" lines=406:417
@source page-held title="The page Archify wrote, held for the delivery" path="src/map/explainer.mjs" lines=286:381
@source typeset-version title="Typst 0.15.1" path="src/overview/typeset.mjs" lines=46:63
@source typeset-stage title="Staging the class, the drawing and the model" path="src/overview/typeset.mjs" lines=102:128
@source typeset-problems title="Typst's diagnostics as refusals" path="src/overview/typeset.mjs" lines=179:215
@source overview-check title="Checking the overview before the edition sets it" path="src/overview/typeset.mjs" lines=217:281
@source overview-read title="Reading the overview a model states" path="src/model/overview.mjs" lines=86:163
@source overview-forms title="What a statement may hold" path="src/model/overview.mjs" lines=1:10
@source drawn-layout title="How the page is laid out" path="src/overview/drawn.typ" lines=3:11
@source drawn-fit title="A page at two spacings" path="src/overview/drawn.typ" lines=763:780
@source contract-plate-floor title="The plate quality floor" path="docs/product-contract.md" lines=149:154
@source ops-plate title="A plate" path="docs/reference/operations.md" lines=192:199
@source ops-reading title="A plate's width and reading" path="docs/reference/operations.md" lines=258:286
@source ops-edition title="The print edition" path="docs/reference/operations.md" lines=288:305
@source house-reading title="What a plate's reading does when it is too tall" path="src/overview/house.typ" lines=621:657
@source ops-edition-text title="Text, dates and page images" path="docs/reference/operations.md" lines=307:330
@source ops-refusal-paths title="Where a refusal points" path="docs/reference/refusals.md" lines=17:19
@source plates-compositions title="Every composition a plate tries" path="src/poster/compose/plates.mjs" lines=262:273
@source plates-line-warnings title="What a build says of its plates' lines" path="src/poster/compose/plates.mjs" lines=95:127
@source plates-admit title="A view the body admits" path="src/poster/compose/plates.mjs" lines=335:353
@source plates-width title="The plate width rule" path="src/poster/compose/plates.mjs" lines=415:470
@source plates-gates title="Gates recorded, not refused" path="src/poster/compose/gates.mjs" lines=5:28
@source plates-rule title="Which composition a view is drawn in" path="src/poster/compose/plates.mjs" lines=214:232
@source ops-fill title="The tiers figure's fill" path="docs/reference/operations.md" lines=216:224
@source ops-matrix title="A matrix" path="docs/reference/operations.md" lines=226:236
@source ops-radial title="A radial figure" path="docs/reference/operations.md" lines=238:243
@source ops-spine title="A spine" path="docs/reference/operations.md" lines=245:256
@source matrix-heads title="The cards that head a matrix's rows" path="src/poster/compose/matrix-draw.mjs" lines=155:158
@source measure-slant title="Wires across, down and at a slant" path="src/layout/measure.mjs" lines=1:7
@source edition-typeset title="One pass, one PDF" path="src/edition/typeset.mjs" lines=23:27
@source edition-images title="The page images" path="src/edition/typeset.mjs" lines=153:174
@source edition-width title="The default width" path="src/delivery.json" lines=3:3
@source edition-figures title="Each plate's figure files" path="src/edition/typeset.mjs" lines=175:215
@source checks-boxes title="Text inside and apart" path="src/overview/checks.mjs" lines=4:58
@source checks-lines title="Text clear of lines and rings" path="src/overview/checks.mjs" lines=93:137
@source glyphs-overview title="A character no bundled face draws" path="src/overview/glyphs.mjs" lines=43:68
@source edition-overview title="The overview set in the edition" path="src/edition/typeset.mjs" lines=80:93
@source supply-verify title="Supplies verified by digest" path="src/supply.mjs" lines=21:39
@source delivery-verify title="Verifying a delivery" path="src/delivery.mjs" lines=26:54
@source delivery-compare title="Comparing two deliveries" path="src/delivery.mjs" lines=70:123
@source evidence-table title="The evidence table" path="src/pinned/evidence.mjs" lines=21:67
@source data-format title="The data's format in one schema" path="src/pinned/format.mjs" lines=3:10
@source guide-pinned title="The guide read at the pin" path="src/projection.mjs" lines=58:95
@source delivery-names title="An id that names two files alike" path="src/projection.mjs" lines=37:56
@source facts-edition title="The edition's measured facts" path="src/facts/edition.mjs" lines=5:10
@source delivery-accept title="Recording an acceptance" path="src/delivery.mjs" lines=168:236
@source delivery-publish title="Publishing a copy" path="src/delivery.mjs" lines=334:375
@source worklist-fates title="What became of each file" path="src/sources/worklist.mjs" lines=5:12
@source worklist-citation title="How a cited range fares" path="src/sources/worklist.mjs" lines=63:67
@source worklist-repin title="The worklist" path="src/sources/worklist.mjs" lines=97:110
@source model-smallest title="A minimal model" path="docs/reference/model.md" lines=26:28
@source model-minimal title="The smallest model" path="docs/reference/model.md" lines=33:58
@source changelog-first title="The first release" path="CHANGELOG.md" lines=1631:1637
@source changelog-040 title="The 0.4.0 release" path="CHANGELOG.md" lines=1051:1056
@source changelog-0220 title="The 0.22.0 release" path="CHANGELOG.md" lines=10:94
@source model-cards title="Every part is one card" path="docs/reference/model.md" lines=316:361
@source model-ages title="The three age bands" path="docs/reference/model.md" lines=365:371
@source model-count title="The number of cited files" path="docs/reference/model.md" lines=373:379
@source model-palette title="Built-in palettes and a model's own" path="docs/reference/model.md" lines=389:401
@source model-palette-rules title="The rules a palette must pass" path="docs/reference/model.md" lines=413:424
@source model-no-strip title="When a card has no strip" path="docs/reference/model.md" lines=329:339
@source model-palette-overview title="The overview in the same palette" path="docs/reference/model.md" lines=436:437
@source ops-strip-box title="A card's box" path="docs/reference/operations.md" lines=210:214
@source ops-acceptance-scope title="What acceptance establishes" path="docs/reference/operations.md" lines=516:517
@source ops-colophon title="The colophon page" path="docs/reference/operations.md" lines=519:537
@source ops-statement title="The acceptance record" path="docs/reference/operations.md" lines=539:544
@source ops-sign title="Signing the record" path="docs/reference/operations.md" lines=546:549
@source ops-verify title="archpub verify" path="docs/reference/operations.md" lines=551:560
@source ops-earlier-records title="Records of earlier releases" path="docs/reference/operations.md" lines=568:570
@source manifest-version title="Manifest version 9" path="src/manifest.mjs" lines=17:18
@source style-choice title="Choosing the edition's style" path="src/style.mjs" lines=9:25
@source ages-bands title="The same bands for every edition" path="src/facts/ages.mjs" lines=1:10
@source bind-times title="Each file's last change" path="src/sources/bind.mjs" lines=49:65
@source edition-read title="Reading the edition object" path="src/model/edition.mjs" lines=277:310
@source strip-marks title="What a strip shows" path="src/poster/strip.mjs" lines=5:14
@source strip-lengths title="One strip length for the edition" path="src/poster/strip.mjs" lines=47:57
@source placement-narrowest title="No column narrower than a strip" path="src/layout/placement.mjs" lines=210:217
@source delivery-statement title="An in-toto Statement" path="src/delivery.mjs" lines=11:18
@source delivery-sign title="Signing the record's exact bytes" path="src/delivery.mjs" lines=151:159
@source delivery-check title="Verifying an acceptance" path="src/delivery.mjs" lines=313:332
@source colophon-page title="What the colophon page sets" path="src/edition/colophon.mjs" lines=46:86
@source ops-key-line title="The key's line" path="docs/reference/operations.md" lines=309:312
@source house-key title="A key set by its baseline" path="src/overview/house.typ" lines=596:599
@source strip-key title="The key where strips are drawn" path="src/poster/strip.mjs" lines=206:212
@source strip-hub title="The hub's line in the key" path="src/poster/strip.mjs" lines=272:275
@source words-leads title="The words beside the hub's line" path="src/locale.mjs" lines=105:105
@source locale-unspaced title="Languages written without word spaces" path="src/locale.mjs" lines=253:260
@source text-paragraph title="A detail wrapped as a paragraph" path="src/poster/text.mjs" lines=302:306
@source spread-lines title="Which details are spread" path="src/poster/spread.mjs" lines=3:9
@source spread-limit title="The slack a spread line closes" path="src/breaks.mjs" lines=85:95
@source text-kerning title="The house faces with their kerning" path="src/poster/text.mjs" lines=19:24
@source kerning-read title="Pair kerning read from the face" path="src/poster/kerning.mjs" lines=1:5

## What does a model hold, and when is it refused? {#p-model}

An author writes the model; `archpub import likec4` writes one from a LikeC4 workspace, and `archpub migrate` from a model of an earlier version.[](source:model-meaning)[](source:ops-migrate) The loader reports every problem with its JSON path in one pass, and nothing is built from an invalid model.[](source:load-problems)

The smallest model the schema accepts has three components, two relations and their kinds.[](source:model-smallest)[](source:model-minimal) It builds, but its plate leaves most of the edition's body blank.[](source:model-smallest)

@code id=minimal-model source=model-minimal language=json

@diagram class id=model-map source=model.class.json

@steps id=model-steps
| step-model-file | model.json | Requires `format`, `version` 3, `id`, `title`, `question`, `components` and `relations`; `overview` states the overview page, and `guide` names a draft by its path from the model.[](source:load-top)[](source:model-fields) `edition` names the print edition's palette.[](source:edition-read) | model-map | model-file |
| step-model-components | components[] | Each claims the paths it owns: a directory ending in `/`, or one file. No path is claimed twice.[](source:load-files)[](source:model-claims) | model-map | model-components |
| step-model-relations | relations[] | Each connects two components and cites single files as its evidence.[](source:load-files) | model-map | model-relations |
| step-model-views | views[] | Each declares exactly one of `tiers` or `members`.[](source:load-views)[](source:model-views) It may name its plate's `composition`: `tiers`, `matrix`, `radial` or `spine`.[](source:model-composition) Any other value is refused with `model_composition_invalid`.[](source:load-views) | model-map | model-views |
| step-model-coverage | coverage{} | Names the paths the model describes and those it leaves out, each with a reason; a path may be a glob.[](source:paths-coverage)[](source:model-coverage) | model-map | model-coverage |

@facts
| Version 1 or 2 model | Refused with the command that converts it.[](source:load-version)[](source:model-version-one) |
| Unknown field | Refused, so a misspelt field never disappears silently.[](source:model-unknown) |
| A `marks` field or an unknown palette | Refused with `model_field_retired` or `model_palette_unknown`, at its JSON path under `/edition`.[](source:edition-read) |
| An id of `model`, `manifest`, `acceptance` or `colophon` | Refused with `delivery_name_taken`, since two files of the delivery would share one name.[](source:delivery-names) |
| Invalid model | Exit status 1, with each problem's code, JSON path and message.[](source:cli-exit) |

## How does each file find its owner at the pinned revision? {#p-files}

With `--repo`, a build reads each file through Git at the model's revision. It never fetches, prompts or changes the checkout.[](source:model-repo)[](source:git-read)

@sequence id=bind-flow title="Binding the model's files at its revision"
| actor bind-builder | Delivery builder | backend | source:build-prepare |
| actor bind-files | File binding | security | source:bind-owner |
| actor bind-git | Git object store | database | source:git-read |
| phase | Resolve |
| bind-builder | bind-files | bind the files |
| bind-files | bind-git | rev-parse the revision |
| bind-git | bind-files | the pinned commit | return |
| phase | Scope and own |
| bind-files | bind-git | ls-tree at the commit |
| bind-git | bind-files | every tracked file | return |
| bind-files | bind-git | diff-tree for each glob |
| bind-git | bind-files | the files it matches | return |
| phase | Read |
| bind-files | bind-git | cat-file --batch |
| bind-git | bind-files | owned and cited files | return |
| bind-files | bind-git | log --name-only |
| bind-git | bind-files | each file's last change | return |
| bind-files | bind-builder | digests, sizes, dates, owners | return |

@steps id=bind-steps
| step-bind-commit | File binding | Resolves the model's revision to a commit; a checkout that lacks it is refused.[](source:git-commit) | bind-flow | bind-files | | bind-builder-to-bind-files-1,bind-files-to-bind-git-1,bind-git-to-bind-files-1 |
| step-bind-scope | Git object store | Lists every tracked file at that commit, and matches each glob with Git's own pathspec, case-sensitively.[](source:scope-at)[](source:scope-glob) | bind-flow | bind-git | | bind-files-to-bind-git-2,bind-git-to-bind-files-2,bind-files-to-bind-git-3,bind-git-to-bind-files-3 |
| step-bind-owner | File binding | Gives each file in the scope to the claim of the file itself, or else to the deepest claimed directory that holds it.[](source:bind-owner)[](source:model-claims) | bind-flow | bind-files |
| step-bind-refuse | File binding | A claim that owns no file, or a relation file the commit lacks, refuses the build with `files_unresolved`.[](source:bind-refuse) | bind-flow | bind-files |
| step-bind-read | Delivery builder | Every owned and cited file is read in one batch and recorded with its SHA-256, size, last change, owner and citing relations.[](source:bind-read) One read of the history dates each file; a shallow clone is refused with `source_history_unavailable`.[](source:bind-times) | bind-flow | bind-builder | | bind-files-to-bind-git-4,bind-git-to-bind-files-4,bind-files-to-bind-git-5,bind-git-to-bind-files-5,bind-files-to-bind-builder-1 |

In this work, one component claims `src/map/` and another claims `src/map/guide.mjs`. The second claim is more specific, so it owns that file whatever order the claims take.[](source:model-claims)

## Which views does a build draw? {#p-plan}

Each view is drawn as one plate of the print edition. The plan keeps a view only when a plate can lay it out.[](source:model-views)[](source:views-admit)

@diagram workflow id=plan-flow source=plan.workflow.json

@steps id=plan-steps
| step-plan-declared | Views declared? | A model that declares views gets those views, in their order.[](source:views-plan)[](source:model-views-plan) | plan-flow | plan-declared |
| step-plan-admit | Admit each declared view | Each view must lay out in the edition's body; the refusal names every view that does not.[](source:views-admit) | plan-flow | plan-admit |
| step-plan-whole | One view of every component | Without declared views, the publisher first tries one view that draws the whole model.[](source:views-plan) | plan-flow | plan-whole |
| step-plan-groups | Groups declared? | A model too large for one plate is drawn as one card per group, then one view per group.[](source:model-groups) | plan-flow | plan-groups |
| step-plan-refused | Plan refused | Without groups, the build stops with `plan_requires_structure` and asks for groups or views.[](source:views-plan) | plan-flow | plan-refused |

`archpub check` also lists the components and relations that no planned view draws. It reports them and never refuses the model for them.[](source:views-undrawn)[](source:contract-counts) It also reports the counts of the data a build would write, which `--json` carries under `data`.[](source:ops-check)[](source:ops-manifest)

## How is a view laid out without an overlap? {#p-layout}

Plates and the page's diagrams use one grid. Plates set it at their own type steps, the page with Archify's text metrics.[](source:readme-layout)[](source:ops-plate)[](source:ops-page-grid) A card takes a box as wide as the larger of its text and its strip. Placement and the gates run on those boxes.[](source:ops-strip-box)

@diagram architecture id=layout-map source=layout.architecture.json

@steps id=layout-steps
| step-lay-rows | Rows | Declared tiers are the rows, in order. Otherwise every relation points down or stays within one row.[](source:ops-rows) | layout-map | lay-rows |
| step-lay-placement | Placement | Places the cards in their rows exactly, with the fewest weighted crossings, bends and unused columns.[](source:ops-rows) No column is narrower than the view's longest strip.[](source:placement-narrowest) | layout-map | lay-placement |
| step-lay-wires | Wires | Run the relations between rows as buses, corridors, lanes beside the cards and straight arrows.[](source:ops-rows) | layout-map | lay-wires |
| step-lay-solver | Channel solver | Gives each channel the routing with the fewest crossings, then, on plates, the fewest route defects.[](source:ops-overlap) | layout-map | lay-solver |
| step-lay-measure | Neatness measure | In tiers, a diagonal, a shared segment, a wire through a card or a touching label rejects that layout.[](source:ops-overlap) A radial figure's slanting lines are measured by the same spacings along their own lines.[](source:measure-slant) | layout-map | lay-measure |

@callout level=note title="Refused, never shrunk"
| A view is refused only when no row wrapping, width or type step lays it out. Text is never shrunk, and nothing is cropped.[](source:readme-layout)[](source:contract-layout-floor) |

## How does a view become a page of the print edition? {#p-edition}

Each view is one plate: a figure laid out for the edition's body, with no text below 14 px.[](source:ops-plate) Typst 0.15.1 typesets the edition with the house class into one PDF of 1600 × 900 point pages.[](source:ops-edition)[](source:ops-needs)

A plate draws each part as one card. With a checkout, the card holds a strip whose length is the size of the files its part owns, on one scale for the whole edition.[](source:model-cards)[](source:model-no-strip) A model's `edition` object may name a palette.[](source:model-cards) The sizes, shares and age bands are measured once, before any view is planned, and every plate reads them.[](source:facts-edition)

@diagram workflow id=edition-flow source=edition.workflow.json

@steps id=edition-steps
| step-ed-compose | Compose each view | A plate tries every type step, row wrapping, centring and tier-label column. It takes the fewest crossings, then the fewest route defects.[](source:plates-compositions)[](source:ops-plate) A plate is composed for cards without their details. Its cards set every detail only when the view lays out with them in the same size, at the same type step, and wires no worse.[](source:model-cards) | edition-flow | ed-compose |
| step-ed-fits | Laid out in the body? | A view no composition lays out in the body is refused with `plate_unfittable`; its text is never shrunk.[](source:plates-admit)[](source:contract-plate-floor) With strips, an edition one of whose views does not fit at 320 px is planned again with every strip shorter.[](source:strip-lengths) | edition-flow | ed-fits |
| step-ed-width | Choose its width | The figure takes the narrowest of 100, 80 and 65 percent of the body that wires no worse. A view with a summary gives up a fifth for its reading. When that wires worse, the figure keeps the full width and its summary is set above it.[](source:plates-width)[](source:ops-reading) When that wires worse too, the figure keeps the whole body and a summary of at most three lines stands in the plate's head.[](source:ops-reading) | edition-flow | ed-width |
| step-ed-gates | Measure four gates | Its largest blank rectangle, blank bands, holes and centre of mass are measured. A missed gate is recorded for the reviewer, not refused.[](source:plates-gates)[](source:ops-gates) | edition-flow | ed-gates |
| step-ed-typeset | Typeset in one pass | The house class sets the title page, contents, overview, every plate and an index into one PDF that conforms to PDF/A-3a and PDF/UA-1.[](source:edition-typeset)[](source:ops-edition) The contents link to the overview and to every plate, and each plate's head links back to the overview. The index gives each part a short paragraph of its kind, details, relations and paths. Its plates, related parts and paths are links.[](source:ops-edition) | edition-flow | ed-typeset |
| step-ed-text | Text as measured? | A run Typst sets wider than the engine measured it or a title longer than its line is refused. So is a line of a summary above its figure that Typst sets wider than 32 ems.[](source:ops-edition-text) A reading taller than the body sets its summary alone, and is refused only when that does not fit either.[](source:house-reading) A summary that needs more than three lines in the head is refused with `edition_reading_too_long`.[](source:ops-reading) | edition-flow | ed-text |
| step-ed-images | PDF and page images | Typst renders the overview's and each plate's page as PNG at each width, 3840 px unless the build names others.[](source:edition-images)[](source:edition-width)[](source:ops-edition-text) It also sets each plate's figure and key alone, as a PNG on a transparent ground and as an SVG.[](source:edition-figures)[](source:ops-delivery) | edition-flow | ed-images |
| step-ed-refused | Edition refused | A plate's refusal names its view, and a Typst refusal the line Typst reported.[](source:ops-refusal-paths)[](source:typeset-problems) | edition-flow | ed-refused |

The manifest records each plate's share of the body, its reading, its figure files and the gates it misses.[](source:ops-manifest)

A plate is drawn in tiers unless its view names another composition or, declaring no tiers, a rule chooses one.[](source:plates-rule)[](source:model-composition) Every composition keeps the box its figure in tiers takes, so its width, reading and summary stay as in tiers.[](source:ops-matrix) A named composition that cannot be drawn there is drawn in tiers, with the warning `plate_composition_unfitted`.[](source:model-composition)

@facts id=composition-facts
| Band | In tiers, a lone card of the figure's first or last row may be drawn as a band across it. Its category may span the figure (external, database, cloud or messagebus), and at least half the cards of the row beside it relate to it.[](source:ops-fill) Where the figure misses a balance gate, its rows are spread across the width if that passes a gate the figure missed and misses none it passed. Neither fill is kept where it wires worse or brings an outside card inside the boundary.[](source:ops-fill)[](source:contract-layout-floor) |
| Radial figure | It sets the part related to the most others in the middle and the others round it, its lines straight at any slant.[](source:ops-radial) The rule takes a view without tiers whose centre relates to at least three quarters of the others, and no other part to more than half.[](source:model-composition) The centre must also have at least three parts round it and send at least twice as many relations as it receives.[](source:model-composition) |
| Spine | It folds the view's main path into two or three rows read left to right and back, each other part beside the station it relates to most.[](source:ops-spine) Among its rule's conditions, the path has at least five stations, which are at least 60 percent of the parts.[](source:model-composition) Each relation from a station to the next is as heavy as one into the hub, and the key names it the main path.[](source:ops-spine) |
| Matrix | A view of at least eight parts without tiers, drawn neither radial nor as a spine, becomes a matrix where its figure in tiers would tangle.[](source:model-composition) That means at least two route defects at the full width, and the matrix must fit.[](source:plates-rule)[](source:model-composition) Each part heads a row as a compact card with its strip, and names a column.[](source:matrix-heads) A cell holds the label of the relations from one part to another.[](source:ops-matrix) |

@facts
| Strip | One segment per file the part owns, as wide as its share of the part's bytes. The largest part is 320 px long, or 208 px when a view cannot hold its strips.[](source:strip-marks)[](source:strip-lengths) A build without a checkout, or a model that claims no files, draws every card without a strip and raises no warning.[](source:model-no-strip) |
| Age bands | Each segment takes the dye of its file's age band: changed within a week of the pin, within 90 days, or earlier. Every edition uses the same three bands.[](source:model-ages)[](source:ages-bands) |
| Count | A relation's line carries the number of files it cites, near its source. The build checks that a cited file exists, not that it proves the relation.[](source:model-count) A count with no clear place along its line raises the warning `citation_count_touches`, and the plate is still built.[](source:plates-line-warnings) |
| `edition.palette` | Indigo by default; persimmon, soot and patina are built in. A palette of the model's own must pass rules of contrast, lightness, chroma and hue, or is refused with `model_palette_rejected`.[](source:model-palette)[](source:model-palette-rules) |

The edition sets each plate's runs where the engine measured them, with the faces' kerning, and the plate's key under the body.[](source:ops-edition-text)

@facts id=edition-text-facts
| Key | Each plate has a key of what its figure shows.[](source:ops-edition) It is set by its baseline, at 850 points on every plate, with each mark centred on the middle of its label. A key wider than the body takes a second line, and one that two lines do not hold is refused with `edition_key_too_long`.[](source:ops-key-line)[](source:house-key) |
| Hub | Where an edition draws strips, a plate's key shows the hub its view's relations lead to. Its sample is a line as heavy as the hub's lines, with their arrowhead, and its label says which part the heavy lines lead to.[](source:strip-key)[](source:strip-hub)[](source:words-leads) Relations into the hub are drawn twice as heavy.[](source:model-count) |
| Details | Chinese, in either script, is written without spaces between words, so a Chinese edition sets a part's details as a justified paragraph. They break wherever the script allows, and a last line of one character takes the unit before it.[](source:locale-unspaced)[](source:text-paragraph) |
| Spread lines | Each line of a detail but its last is spread to the measure the details wrap to. A line whose slack is more than a tenth of an em for each place it opens stays flush left. So do details in every other language.[](source:spread-lines)[](source:spread-limit) |
| Kerning | The engine measures Source Sans 3 and Source Serif 4 with their own pair kerning, as Typst sets them.[](source:text-kerning)[](source:ops-edition-text) The font reader does not read the lookups where the two faces keep it, so the engine reads the pairs from each face's GPOS table.[](source:kerning-read) |

## How is the page made and checked? {#p-page}

The page is one standalone `<model id>.html`, delivered by the vendored Archify 3.3.0.[](source:ops-needs) When the model names a draft in `guide`, that draft is the page.[](source:contract-guide)[](source:ops-guide)

@sequence id=page-flow title="The author's draft, checked and delivered"
| actor page-guide | Guide | backend | source:guide-page |
| actor page-clone | Temporary clone | database | source:guide-clone |
| actor page-archify | Vendored Archify | security | source:explainer-deliver |
| phase | Validate and deliver |
| page-guide | page-clone | clone at the model's revision |
| page-guide | page-archify | finalize, strict writing | emphasis |
| page-archify | page-clone | verify each cited range |
| page-archify | page-guide | the page, held | return |
| phase | Refused |
| page-guide | page-archify | validate alone |
| page-archify | page-guide | every finding | return |

@steps id=page-steps
| step-page-read | Guide | Reads the draft and each file its `@diagram`, `@chart` and `@image` lines name; a link, another path or a missing file is refused.[](source:guide-read)[](source:ops-guide) The guide is read whichever media are built. With `--repo`, a path it cites that is no file at the pin is refused with `guide_file_missing`.[](source:guide-pinned) Before Archify reads the draft, the publisher lays out each of its diagrams, and refuses a diagram file that states a field it sets.[](source:guide-read)[](source:ops-guide) | page-flow | page-guide |
| step-page-repo | Guide | A draft that names another repository URL or revision than the model is refused.[](source:guide-page) | page-flow | page-guide |
| step-page-clone | Temporary clone | Shares the checkout's objects, with `origin` at the model's URL and `HEAD` at its revision, and is removed after use.[](source:guide-clone)[](source:ops-guide-clone) | page-flow | page-clone | | page-guide-to-page-clone-1 |
| step-page-validate | Vendored Archify | Validates the draft at the build's quality, with strict writing at showcase, and verifies every cited line range at the revision.[](source:guide-page)[](source:ops-guide-clone) | page-flow | page-archify | | page-guide-to-page-archify-1,page-archify-to-page-clone-1 |
| step-page-deliver | Vendored Archify | In the same run, Archify writes the page as one standalone `<model id>.html` and checks what it wrote.[](source:explainer-deliver) The build keeps those bytes and writes them into the delivery unchanged.[](source:page-held) The draft and Archify's receipts stay out of the delivery.[](source:explainer-deliver) | page-flow | page-archify | | page-archify-to-page-guide-1 |
| step-page-refused | Vendored Archify | Only when Archify refuses the page does the build validate the draft again by itself, so the refusal names every finding. `archpub check` only validates and delivers nothing.[](source:guide-page)[](source:build-prepare) | page-flow | page-archify | | page-guide-to-page-archify-2,page-archify-to-page-guide-2 |

Without a draft, the publisher writes one panel per view, each with a native diagram laid out on the same grid.[](source:ops-page)[](source:explainer-page) `archpub scaffold guide` writes that page as a starting draft.[](source:ops-scaffold)

## How is the overview drawn, checked and set in the edition? {#p-overview}

The overview is one 16:9 page, and the print edition sets it after its contents. The model states what the page says in four fields: `claim`, `lead`, a `course` of steps and optional `blocks`. No field carries a position, a size or a type.[](source:model-overview)[](source:overview-read) The publisher draws the page with the house class, in the edition's palette.[](source:drawn-layout)[](source:model-palette-overview)

@diagram workflow id=overview-flow source=overview.workflow.json

@steps id=overview-steps
| step-ov-statement | Statement valid? | A block is a further course, a list, a table, a group of lists or a headed text.[](source:overview-forms) The loader refuses a file name in `overview` with `model_overview_composition_retired`. A statement the form does not allow is refused with `model_overview_invalid` at its JSON path.[](source:overview-read) | overview-flow | ov-statement |
| step-ov-typst | Typst 0.15.1 on the path? | Any other version is refused, since the overview's bytes depend on it.[](source:typeset-version) | overview-flow | ov-typst |
| step-ov-stage | Stage and draw | Copies the house class, the drawing, the shared names table, the tokens in the edition's palette and the model into one root that Typst may not leave.[](source:typeset-stage)[](source:ops-overview) The course runs across the first band, and the blocks follow in the order stated, in rows of halves or thirds.[](source:drawn-layout) A page too tall at the house's spacing is set closer, with narrower gaps at the same sizes. One too tall at both is refused with `overview_too_tall`, naming the first block that does not fit.[](source:drawn-fit)[](source:ops-overview) | overview-flow | ov-stage |
| step-ov-boxes | Read boxes and lines | Typst hands back each text's box and every line and ring it drew.[](source:overview-check) | overview-flow | ov-boxes |
| step-ov-check | Text inside and clear? | Text stays 48 pt from either side and 16 pt from the top and the bottom, over no other text and under no line or ring.[](source:checks-boxes)[](source:checks-lines)[](source:ops-overview) A character no bundled face draws is refused with `overview_glyph_missing`.[](source:glyphs-overview) | overview-flow | ov-check |
| step-ov-compile | Set in the edition | Only then does the edition set the page in place, its text still text.[](source:edition-overview)[](source:ops-overview) Its page is delivered as `images/00-overview.png`. A step or a block that names a view is followed by that view's plate number, a link in the edition.[](source:ops-overview) An edition refuses with `overview_view_unreached` a view that nothing on the page names, and a check warns with `overview_line_loose` of a line left short of its measure.[](source:overview-unreached)[](source:overview-warnings) | overview-flow | ov-compile |
| step-ov-refused | Overview refused | A refusal names its code, such as `overview_text_outside`, `overview_text_overlap` or `overview_text_over_line`, with the text and where it stands.[](source:checks-boxes)[](source:checks-lines) A Typst warning is refused as well.[](source:typeset-problems) | overview-flow | ov-refused |

## What does the manifest bind? {#p-manifest}

A delivery holds the print edition as `<model id>.pdf`, its page images, each plate's figure files in `figures/`, the page as `<model id>.html` and `manifest.json`. Every delivery also holds `model.json`, the data as `<model id>.json` and the reader file as `<model id>.md`.[](source:ops-delivery) The manifest holds no host path or user name, and the edition is dated by the revision's commit. The same model and version rebuild every byte on one platform.[](source:ops-manifest)[](source:contract-bytes)

Acceptance later writes `acceptance.json`, `colophon.pdf` and, when the reviewer signs, `acceptance.sig` beside them. None of the three is in the manifest, and no artifact changes.[](source:ops-delivery)[](source:ops-accept)

@diagram erd id=manifest-erd source=manifest.erd.json

@steps id=manifest-steps
| step-mf-manifest | manifest.json | Version 9. Names the publisher's version, the model's file, digest and size, the quality, the media and the edition's style. Its `sources` holds the binding's state and the count of its files.[](source:manifest-record)[](source:manifest-version) | manifest-erd | erd-manifest |
| step-mf-evidence | evidence[] | The evidence table of the data, which the manifest names under `data` with its counts. Each row is one path the model claims or cites, or only the guide cites. It holds the path's state, digest, size, last change, owner, citing relations and cited ranges.[](source:evidence-table)[](source:ops-manifest) The rows of owned and cited files are the edition's lock.[](source:model-repo) | manifest-erd | erd-evidence |
| step-mf-supplies | supplies{} | The digest of each bundled supply the build ran, each checked against its own supply manifest.[](source:manifest-record)[](source:supply-verify) | manifest-erd | erd-supplies |
| step-mf-artifacts | artifacts[] | The path, size and SHA-256 of every file in the delivery.[](source:build-artifacts) | manifest-erd | erd-artifacts |
| step-mf-acceptance | acceptance.json | Written at acceptance: an in-toto Statement whose subjects are the manifest and the colophon page, each by its SHA-256.[](source:delivery-accept)[](source:ops-statement) | manifest-erd | erd-acceptance |

The manifest also keeps each view and plate with its measures, and the digest of the overview the model states.[](source:ops-manifest) Under `reader` it names the reader file with its size and its number of statements.[](source:manifest-record)

The data's format stands once, in the JSON Schema `src/pinned/data.schema.json`: every object, its keys and their order. The data is written in the shape it states.[](source:data-format)

Its `style` records the palette's id, names and resolved colours. Where the edition draws strips it adds the age bands' spans, the pin's date and the length its largest part is drawn at.[](source:ops-manifest)[](source:style-choice)

## Who accepts a delivery, and how is it published? {#p-accept}

A build shows only that the delivery came from its inputs. A named reviewer accepts it, and tests and checks never stand in for that acceptance.[](source:contract-acceptance) Acceptance records who accepted which bytes and when; it does not certify that the architecture is correct.[](source:ops-acceptance-scope)

@diagram lifecycle id=delivery-life source=delivery.lifecycle.json

@steps id=delivery-steps
| step-life-delivered | Build in place | The build writes into a new directory beside `--out`. It is renamed into place only when every artifact and the manifest are written, so a refused build leaves nothing behind.[](source:ops-build)[](source:build-rename) | delivery-life | life-delivered |
| step-life-accepted | Accepted build | `archpub accept` verifies every artifact against the manifest, sets the colophon page and writes the acceptance record, once.[](source:delivery-accept)[](source:ops-accept) | delivery-life | life-accepted |
| step-life-changed | delivery_changed | An artifact that differs from the manifest is refused: at acceptance, by `archpub verify` and again at publication.[](source:delivery-verify) | delivery-life | life-changed |
| step-life-published | Published copy | `archpub publish` copies only an accepted delivery, with its colophon page, record and signature, under its model id and version. It verifies the copy first.[](source:delivery-publish)[](source:ops-publish) | delivery-life | life-published |
| step-life-conflict | publish_conflict | A different delivery under the same version is refused; an identical one changes nothing.[](source:ops-publish) | delivery-life | life-conflict |

@facts
| Acceptance record | `acceptance.json` is an in-toto Statement of `manifest.json` and `colophon.pdf`, each by its SHA-256. Its predicate names the reviewer, the time in UTC and the model.[](source:ops-statement)[](source:delivery-statement) |
| Colophon page | `colophon.pdf` is one page in the edition's size and language. A round mark in cinnabar carries the word for accepted, the date and the reviewer's name or a seal name. A slip beside it lists the record's facts.[](source:ops-colophon)[](source:colophon-page) |
| Signature | Optional. `archpub accept --sign` signs the record's exact bytes with ssh-keygen into `acceptance.sig`, and the record names the key's fingerprint.[](source:ops-sign)[](source:delivery-sign) |
| `archpub verify` | Checks every artifact, the record and the colophon page, and that a signature is present exactly when the record names a signer. With `--allowed-signers` it checks the signature for the reviewer.[](source:ops-verify)[](source:delivery-check) |
| `archpub compare` | Checks each of two deliveries against its own manifest, then lists the files that differ. A page image or a figure file is listed under its plate, every other file as a file of the whole edition. The acceptance record, its signature and the colophon page are not compared, and nothing is written.[](source:delivery-compare) |
| Earlier record | `verify` and `publish` refuse a record of an earlier release with `acceptance_version_unsupported`. Remove it and accept the unchanged delivery again.[](source:ops-earlier-records) |

## How did Architecture Publisher get here? {#p-history}

Architecture Publisher's changelog opens with 0.1.0-alpha.0 on 2026-09-18.[](source:changelog-first) Its 0.4.0, on 2026-10-30, made it a general model-to-media publisher.[](source:changelog-040) The timeline starts there and shows twenty of its releases, up to 0.22.0 on 2026-11-28; all but 0.13.1 changed what an author or a reviewer meets.[](source:changelog-0220)

@diagram timeline id=history source=history.timeline.json title="How Architecture Publisher got here"

## What does moving the pin change? {#p-repin}

Before moving `repository.revision` to a later commit, run `archpub check --against <commit>`. The re-pin worklist resolves the model's claims at both commits and never refuses the check.[](source:model-repin)[](source:worklist-repin)

@diagram tree id=worklist-tree source=worklist.tree.json

@steps id=worklist-steps
| step-wl-components | Per component | Its owned files that were modified, moved with the component their new path falls to, or deleted, and the files its claims take in.[](source:model-repin) | worklist-tree | wl-components |
| step-wl-relations | Per relation | The cited files that changed, as Git's rename detection reads them.[](source:worklist-fates) | worklist-tree | wl-relations |
| step-wl-refused | Refused at the later commit | The claims that would own no file and the relation files that would be gone; a build there refuses both.[](source:model-repin) | worklist-tree | wl-refused |
| step-wl-uncovered | Newly uncovered files | Files of the scope that fall under no claim at the later commit.[](source:model-repin) | worklist-tree | wl-uncovered |
| step-wl-citations | Cited line ranges | Each range the draft and its diagrams cite: the same, shifted, moved with its file, touched by a change, or gone.[](source:worklist-citation)[](source:model-repin) | worklist-tree | wl-citations |

| Moving this work from 4be4dd7 to 7018b02 | Count |
| ---------------------------------------- | ----- |
| Commits since the pin                    | 96    |
| Owned files modified, of 73              | 31    |
| Owned files deleted                      | 1     |
| Components with modified files           | 15    |
| Relations whose cited files changed      | 36    |
| Claims or relation files refused         | 0     |
| Newly uncovered files                    | 11    |

No claim and no relation file was refused. Eleven files fell under no claim, ten of them new and one moved into `src/facts/`. The four under `src/facts/` form the new component Measured facts, and the five under `src/pinned/` form Data and reader file. The other two fall to the delivery builder.

@callout level=warning title="Archify checks only that a range exists"
| After a re-pin, a shifted citation would cite other text. Move it to its new range, and reread every touched one.[](source:model-shifted) |

- [ ] Run `archpub check --against <commit>` before you change `repository.revision`.[](source:model-repin)
- [ ] Give each newly uncovered file a claim, and recheck each relation whose files changed.[](source:model-repin)
- [ ] Move each shifted citation to its new range, and reread every touched one.[](source:model-shifted)
- [ ] Check and build again at the new revision, with no file left uncovered.[](source:ops-check)
