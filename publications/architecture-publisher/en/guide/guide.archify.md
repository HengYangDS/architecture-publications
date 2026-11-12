# How does Architecture Publisher turn an architecture model into a print edition and a page? {#guide}

`archpub` reads one model, binds the files its components claim at the pinned revision and plans its views. It lays each view out on one grid, composes each as a plate, typesets the print edition with Typst and delivers one Archify page.[](source:contract-processing) A manifest binds every artifact to its inputs, and a named reviewer accepts the delivery before it is published.[](source:contract-product)[](source:contract-acceptance)

- [The model is the only source of meaning](block:p-model): the publisher never infers architecture from code.[](source:model-meaning)[](source:contract-meaning)
- [Git is only read](block:p-files): each file comes from the pinned commit, and the checkout never changes.[](source:model-repo)
- [A layout with an overlap is never drawn](block:p-layout), and a view that no layout draws is refused, not shrunk.[](source:contract-layout-floor)
- [Only an accepted delivery is published](block:p-accept), and never over a different one.[](source:contract-acceptance)

@answer scope="Architecture Publisher v0.12.0 · commit 65452c6 · its source and its own documents · re-pin counts measured on 2026-11-08"
@meta locale=en style=editorial
@source contract-product title="The product" path="docs/product-contract.md" lines=13:21
@source contract-meaning title="Who owns meaning and form" path="docs/product-contract.md" lines=23:28
@source contract-processing title="The six steps of a build" path="docs/product-contract.md" lines=51:63
@source contract-bytes title="The same inputs, the same bytes" path="docs/product-contract.md" lines=65:67
@source contract-guide title="The guide and the generated page" path="docs/product-contract.md" lines=92:101
@source contract-layout-floor title="Cards, wires and no overlap" path="docs/product-contract.md" lines=114:121
@source contract-acceptance title="Acceptance and publication" path="docs/product-contract.md" lines=133:137
@source contract-counts title="Counts, never refusals" path="docs/product-contract.md" lines=143:145
@source model-meaning title="The only source of meaning" path="docs/reference/model.md" lines=11:17
@source model-fields title="Top-level fields" path="docs/reference/model.md" lines=56:79
@source model-unknown title="Unknown fields" path="docs/reference/model.md" lines=81:83
@source model-claims title="The most specific claim" path="docs/reference/model.md" lines=143:160
@source model-repo title="Reading at the revision" path="docs/reference/model.md" lines=162:170
@source model-version-one title="From version 1" path="docs/reference/model.md" lines=188:199
@source model-coverage title="Coverage paths and globs" path="docs/reference/model.md" lines=212:218
@source model-repin title="The re-pin worklist" path="docs/reference/model.md" lines=240:252
@source model-shifted title="Shifted and touched citations" path="docs/reference/model.md" lines=254:257
@source model-overview title="The overview composition" path="docs/reference/model.md" lines=261:266
@source model-house title="What the house class provides" path="docs/reference/model.md" lines=279:288
@source model-groups title="Groups" path="docs/reference/model.md" lines=332:338
@source model-views title="Views" path="docs/reference/model.md" lines=342:354
@source model-views-plan title="Declared and planned views" path="docs/reference/model.md" lines=366:370
@source ops-check title="archpub check" path="docs/reference/operations.md" lines=61:73
@source ops-build title="archpub build" path="docs/reference/operations.md" lines=74:76
@source ops-migrate title="Import, scaffold and migrate" path="docs/reference/operations.md" lines=91:97
@source ops-exit title="Exit status and refusals" path="docs/reference/operations.md" lines=102:108
@source ops-rows title="Rows, placement and channels" path="docs/reference/operations.md" lines=115:128
@source ops-overlap title="A layout never overlaps" path="docs/reference/operations.md" lines=130:135
@source ops-gates title="The four balance gates" path="docs/reference/operations.md" lines=167:173
@source ops-page title="The generated page" path="docs/reference/operations.md" lines=242:251
@source ops-page-grid title="The page's diagrams on the same grid" path="docs/reference/operations.md" lines=253:258
@source ops-overview title="The overview" path="docs/reference/operations.md" lines=319:333
@source ops-guide title="The guide" path="docs/reference/operations.md" lines=337:344
@source ops-guide-clone title="Sources verified at the revision" path="docs/reference/operations.md" lines=346:354
@source ops-scaffold title="A starting guide" path="docs/reference/operations.md" lines=356:358
@source ops-delivery title="The delivery's files" path="docs/reference/operations.md" lines=365:375
@source ops-manifest title="The manifest" path="docs/reference/operations.md" lines=377:396
@source ops-accept title="archpub accept" path="docs/reference/operations.md" lines=400:402
@source ops-publish title="archpub publish" path="docs/reference/operations.md" lines=404:408
@source readme-layout title="Layout is a grid" path="README.md" lines=53:55
@source build-prepare title="One build's route" path="src/build.mjs" lines=127:189
@source build-composition title="A missing composition" path="src/build.mjs" lines=106:125
@source build-artifacts title="Every artifact's digest" path="src/build.mjs" lines=350:367
@source build-manifest title="The manifest record" path="src/build.mjs" lines=432:501
@source build-rename title="Renamed into place" path="src/build.mjs" lines=502:519
@source load-top title="The model's fields" path="src/model/load.mjs" lines=37:49
@source load-problems title="Every problem in one pass" path="src/model/load.mjs" lines=55:64
@source load-files title="Claims and cited files" path="src/model/load.mjs" lines=120:158
@source load-version title="A version 1 model" path="src/model/load.mjs" lines=160:170
@source load-views title="Tiers or members" path="src/model/load.mjs" lines=383:412
@source paths-coverage title="Checking the coverage scope" path="src/model/paths.mjs" lines=35:75
@source git-read title="Read-only Git" path="src/sources/git.mjs" lines=8:31
@source git-commit title="The pinned commit" path="src/sources/git.mjs" lines=68:78
@source scope-glob title="Globs matched by Git" path="src/sources/scope.mjs" lines=29:51
@source scope-at title="The scope at a commit" path="src/sources/scope.mjs" lines=86:128
@source bind-owner title="The most specific claim" path="src/sources/bind.mjs" lines=82:87
@source bind-refuse title="files_unresolved" path="src/sources/bind.mjs" lines=110:129
@source bind-read title="One batch of digests" path="src/sources/bind.mjs" lines=130:149
@source views-plan title="Planning the views" path="src/plan/views.mjs" lines=128:156
@source views-undrawn title="What no view draws" path="src/plan/views.mjs" lines=158:176
@source views-admit title="Admitting every view" path="src/plan/views.mjs" lines=198:221
@source guide-read title="Reading the draft" path="src/map/guide.mjs" lines=131:161
@source guide-page title="The draft as the page" path="src/map/guide.mjs" lines=163:215
@source guide-clone title="A temporary clone" path="src/map/guide.mjs" lines=244:264
@source explainer-page title="One panel per view" path="src/map/explainer.mjs" lines=211:222
@source explainer-deliver title="Finalizing with Archify" path="src/map/explainer.mjs" lines=292:303
@source typeset-version title="Typst 0.15.1" path="src/overview/typeset.mjs" lines=34:50
@source typeset-stage title="Staging the composition" path="src/overview/typeset.mjs" lines=73:109
@source typeset-problems title="Refusals at the composition's line" path="src/overview/typeset.mjs" lines=130:161
@source contract-plate-floor title="The plate quality floor" path="docs/product-contract.md" lines=105:110
@source ops-plate title="A plate" path="docs/reference/operations.md" lines=157:166
@source ops-reading title="A plate's width and reading" path="docs/reference/operations.md" lines=180:209
@source ops-edition title="The print edition" path="docs/reference/operations.md" lines=211:221
@source house-reading title="What a plate's reading does when it is too tall" path="src/overview/house.typ" lines=251:287
@source ops-edition-text title="Text, dates and page images" path="docs/reference/operations.md" lines=223:240
@source ops-refusal-paths title="Where a refusal points" path="docs/reference/operations.md" lines=412:417
@source plates-compositions title="Every composition a plate tries" path="src/poster/compose/plates.mjs" lines=109:121
@source plates-admit title="A view the body admits" path="src/poster/compose/plates.mjs" lines=160:171
@source plates-width title="The plate width rule" path="src/poster/compose/plates.mjs" lines=222:282
@source plates-gates title="Gates recorded, not refused" path="src/poster/compose/gates.mjs" lines=1:24
@source edition-typeset title="One pass, one PDF" path="src/edition/typeset.mjs" lines=11:14
@source edition-images title="The page images" path="src/edition/typeset.mjs" lines=120:141
@source lint-rules title="What a composition may not do" path="src/overview/lint.mjs" lines=3:20
@source checks-boxes title="Text inside and apart" path="src/overview/checks.mjs" lines=22:56
@source supply-verify title="Supplies verified by digest" path="src/supply.mjs" lines=21:39
@source delivery-verify title="Verifying a delivery" path="src/delivery.mjs" lines=11:36
@source delivery-accept title="Recording an acceptance" path="src/delivery.mjs" lines=52:77
@source delivery-publish title="Publishing a copy" path="src/delivery.mjs" lines=79:136
@source worklist-fates title="What became of each file" path="src/sources/worklist.mjs" lines=5:12
@source worklist-citation title="How a cited range fares" path="src/sources/worklist.mjs" lines=63:67
@source worklist-repin title="The worklist" path="src/sources/worklist.mjs" lines=97:110
@source model-smallest title="A minimal model" path="docs/reference/model.md" lines=26:28
@source model-minimal title="The smallest model" path="docs/reference/model.md" lines=33:53
@source changelog-first title="The first release" path="CHANGELOG.md" lines=874:880
@source changelog-040 title="The 0.4.0 release" path="CHANGELOG.md" lines=294:299

## What does a model hold, and when is it refused? {#p-model}

An author writes the model; `archpub import likec4` writes one from a LikeC4 workspace, and `archpub migrate` from a version 1 model.[](source:model-meaning)[](source:ops-migrate) The loader reports every problem with its JSON path in one pass, and nothing is built from an invalid model.[](source:load-problems)

The smallest model the schema accepts has three components, two relations and their kinds.[](source:model-smallest)[](source:model-minimal) It builds, but its plate leaves most of the edition's body blank.[](source:model-smallest)

@code id=minimal-model source=model-minimal language=json

@diagram class id=model-map source=model.class.json

@steps id=model-steps
| step-model-file | model.json | Requires `format`, `version` 3, `id`, `title`, `question`, `components` and `relations`; `overview` and `guide` name files beside it.[](source:load-top)[](source:model-fields) | model-map | model-file |
| step-model-components | components[] | Each claims the paths it owns: a directory ending in `/`, or one file. No path is claimed twice.[](source:load-files)[](source:model-claims) | model-map | model-components |
| step-model-relations | relations[] | Each connects two components and cites single files as its evidence.[](source:load-files) | model-map | model-relations |
| step-model-views | views[] | Each declares exactly one of `tiers` or `members`.[](source:load-views)[](source:model-views) | model-map | model-views |
| step-model-coverage | coverage{} | Names the paths the model describes and those it leaves out, each with a reason; a path may be a glob.[](source:paths-coverage)[](source:model-coverage) | model-map | model-coverage |

@facts
| Version 1 or 2 model | Refused with the command that converts it.[](source:load-version)[](source:model-version-one) |
| Unknown field | Refused, so a misspelt field never disappears silently.[](source:model-unknown) |
| Invalid model | Exit status 1, with each problem's code, JSON path and message.[](source:ops-exit) |

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
| bind-files | bind-builder | digests, owners, relations | return |

@steps id=bind-steps
| step-bind-commit | File binding | Resolves the model's revision to a commit; a checkout that lacks it is refused.[](source:git-commit) | bind-flow | bind-files | | bind-builder-to-bind-files-1,bind-files-to-bind-git-1,bind-git-to-bind-files-1 |
| step-bind-scope | Git object store | Lists every tracked file at that commit, and matches each glob with Git's own pathspec, case-sensitively.[](source:scope-at)[](source:scope-glob) | bind-flow | bind-git | | bind-files-to-bind-git-2,bind-git-to-bind-files-2,bind-files-to-bind-git-3,bind-git-to-bind-files-3 |
| step-bind-owner | File binding | Gives each file in the scope to the claim of the file itself, or else to the deepest claimed directory that holds it.[](source:bind-owner)[](source:model-claims) | bind-flow | bind-files |
| step-bind-refuse | File binding | A claim that owns no file, or a relation file the commit lacks, refuses the build with `files_unresolved`.[](source:bind-refuse) | bind-flow | bind-files |
| step-bind-read | Delivery builder | Every owned and cited file is read in one batch and recorded with its SHA-256, owner and citing relations.[](source:bind-read) | bind-flow | bind-builder | | bind-files-to-bind-git-4,bind-git-to-bind-files-4,bind-files-to-bind-builder-1 |

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

`archpub check` also lists the components and relations that no planned view draws. It reports them and never refuses the model for them.[](source:views-undrawn)[](source:contract-counts)

## How is a view laid out without an overlap? {#p-layout}

Plates and the page's diagrams use one grid. Plates set it at their own type steps, the page with Archify's text metrics.[](source:readme-layout)[](source:ops-plate)[](source:ops-page-grid)

@diagram architecture id=layout-map source=layout.architecture.json

@steps id=layout-steps
| step-lay-rows | Rows | Declared tiers are the rows, in order. Otherwise every relation points down or stays within one row.[](source:ops-rows) | layout-map | lay-rows |
| step-lay-placement | Placement | Places the cards in their rows exactly, with the fewest weighted crossings, bends and unused columns.[](source:ops-rows) | layout-map | lay-placement |
| step-lay-wires | Wires | Run the relations between rows as buses, corridors, lanes beside the cards and straight arrows.[](source:ops-rows) | layout-map | lay-wires |
| step-lay-solver | Channel solver | Gives each channel the routing with the fewest crossings, then, on plates, the fewest route defects.[](source:ops-overlap) | layout-map | lay-solver |
| step-lay-measure | Neatness measure | A diagonal, a shared segment, a wire through a card or a touching label rejects that layout.[](source:ops-overlap) | layout-map | lay-measure |

@callout level=note title="Refused, never shrunk"
| A view is refused only when no row wrapping, width or type step lays it out. Text is never shrunk, and nothing is cropped.[](source:readme-layout)[](source:contract-layout-floor) |

## How does a view become a page of the print edition? {#p-edition}

Each view is one plate: a figure laid out for the edition's body, with no text below 14 px.[](source:ops-plate) Typst 0.15.1 typesets the edition with the house class into one PDF of 1600 × 900 point pages.[](source:ops-edition)

@diagram workflow id=edition-flow source=edition.workflow.json

@steps id=edition-steps
| step-ed-compose | Compose each view | A plate tries every type step, row wrapping, centring and tier-label column. It takes the fewest crossings, then the fewest route defects.[](source:plates-compositions)[](source:ops-plate) | edition-flow | ed-compose |
| step-ed-fits | Laid out in the body? | A view no composition lays out in the body is refused with `plate_unfittable`; its text is never shrunk.[](source:plates-admit)[](source:contract-plate-floor) | edition-flow | ed-fits |
| step-ed-width | Choose its width | The figure takes the narrowest of 100, 80 and 65 percent of the body that wires no worse. A view with a summary gives up a fifth for its reading. When that wires worse, the figure keeps the full width and its summary is set above it.[](source:plates-width)[](source:ops-reading) | edition-flow | ed-width |
| step-ed-gates | Measure four gates | Its largest blank rectangle, blank bands, holes and centre of mass are measured. A missed gate is recorded for the reviewer, not refused.[](source:plates-gates)[](source:ops-gates) | edition-flow | ed-gates |
| step-ed-typeset | Typeset in one pass | The house class sets the title page, contents, overview and every plate into one PDF that conforms to PDF/A-3a and PDF/UA-1.[](source:edition-typeset)[](source:ops-edition) | edition-flow | ed-typeset |
| step-ed-text | Text as measured? | A run Typst sets wider than the engine measured it or a title longer than its line is refused. So is a line of a summary above its figure that Typst sets wider than 32 ems.[](source:ops-edition-text) A reading taller than the body sets its summary alone, and is refused only when that does not fit either.[](source:house-reading) | edition-flow | ed-text |
| step-ed-images | PDF and page images | Typst renders the overview's and each plate's page as PNG at each width, 2400 px unless the build names others.[](source:edition-images)[](source:ops-edition-text) | edition-flow | ed-images |
| step-ed-refused | Edition refused | A plate's refusal names its view, and a Typst refusal the line Typst reported.[](source:ops-refusal-paths)[](source:typeset-problems) | edition-flow | ed-refused |

The manifest records each plate's share of the body, its reading and the gates it misses.[](source:ops-manifest)

## How is the page made and checked? {#p-page}

The page is one standalone `<model id>.html`, delivered by the vendored Archify 3.2.0. When the model names a draft in `guide`, that draft is the page.[](source:contract-guide)[](source:ops-guide)

@sequence id=page-flow title="The author's draft, checked and delivered"
| actor page-guide | Guide | backend | source:guide-page |
| actor page-clone | Temporary clone | database | source:guide-clone |
| actor page-archify | Vendored Archify | security | source:explainer-deliver |
| phase | Validate |
| page-guide | page-clone | clone at the model's revision |
| page-guide | page-archify | validate, strict writing |
| page-archify | page-clone | verify each cited range |
| page-archify | page-guide | pass | return |
| phase | Deliver |
| page-guide | page-clone | clone again |
| page-guide | page-archify | finalize the explainer | emphasis |
| page-archify | page-guide | the page | return |

@steps id=page-steps
| step-page-read | Guide | Reads the draft and each file its `@diagram`, `@chart` and `@image` lines name; a link, another path or a missing file is refused.[](source:guide-read)[](source:ops-guide) | page-flow | page-guide |
| step-page-repo | Guide | A draft that names another repository URL or revision than the model is refused.[](source:guide-page) | page-flow | page-guide |
| step-page-clone | Temporary clone | Shares the checkout's objects, with `origin` at the model's URL and `HEAD` at its revision, and is removed after use.[](source:guide-clone)[](source:ops-guide-clone) | page-flow | page-clone | | page-guide-to-page-clone-1,page-guide-to-page-clone-2 |
| step-page-validate | Vendored Archify | Validates the draft at the build's quality, with strict writing at showcase, and verifies every cited line range at the revision.[](source:guide-page)[](source:ops-guide-clone) | page-flow | page-archify | | page-guide-to-page-archify-1,page-archify-to-page-clone-1,page-archify-to-page-guide-1 |
| step-page-deliver | Vendored Archify | Writes the page as one standalone `<model id>.html`; the draft and Archify's receipts stay out of the delivery.[](source:explainer-deliver) | page-flow | page-archify | | page-guide-to-page-archify-2,page-archify-to-page-guide-2 |

Without a draft, the publisher writes one panel per view, each with a native diagram laid out on the same grid.[](source:ops-page)[](source:explainer-page) `archpub scaffold guide` writes that page as a starting draft.[](source:ops-scaffold)

## How is the overview checked and set in the edition? {#p-overview}

The overview is one 16:9 page that the author composes in Typst with the house class, and the print edition sets it after its contents. The class owns the page, the faces, the four type sizes and the palette.[](source:model-overview)[](source:model-house)

@diagram workflow id=overview-flow source=overview.workflow.json

@steps id=overview-steps
| step-ov-composition | Composition there? | A model may name a composition that is not there; the build is refused with `overview_composition_missing` and the path it looked at.[](source:build-composition) | overview-flow | ov-composition |
| step-ov-typst | Typst 0.15.1 on the path? | Any other version is refused, since the overview's bytes depend on it.[](source:typeset-version) | overview-flow | ov-typst |
| step-ov-stage | Stage and lint | Copies the composition, the house class and the model into one root that Typst may not leave. A package, a plugin, or a size, face or colour of its own is refused.[](source:typeset-stage)[](source:lint-rules) | overview-flow | ov-stage |
| step-ov-boxes | Read the text boxes | Each text the house class sets records its box, which the build reads back from Typst.[](source:ops-overview) | overview-flow | ov-boxes |
| step-ov-check | Text inside and apart? | Text stays 48 pt from either side and 16 pt from the top and the bottom, and never lies over other text.[](source:checks-boxes) | overview-flow | ov-check |
| step-ov-compile | Set in the edition | Only then does the edition set the composition in place, its text still text. Its page is delivered as `images/00-overview.png`.[](source:ops-overview) | overview-flow | ov-compile |
| step-ov-refused | Overview refused | Each refusal names the composition's line, and a Typst warning is refused as well.[](source:typeset-problems) | overview-flow | ov-refused |

## What does the manifest bind? {#p-manifest}

A delivery holds the print edition as `<model id>.pdf`, its page images, the page as `<model id>.html` and `manifest.json`.[](source:ops-delivery) The manifest holds no host path or user name, and the edition is dated by the revision's commit. The same model and version rebuild every byte on one platform.[](source:ops-manifest)[](source:contract-bytes)

@diagram erd id=manifest-erd source=manifest.erd.json

@steps id=manifest-steps
| step-mf-manifest | manifest.json | Names the publisher's version, the model's digest and size, the quality and the media.[](source:build-manifest) | manifest-erd | erd-manifest |
| step-mf-records | sources.records[] | Every owned or cited file, with its digest, its owner and the relations that cite it; this record is the edition's lock.[](source:bind-read)[](source:model-repo) | manifest-erd | erd-records |
| step-mf-supplies | supplies{} | The digest of each bundled supply the build ran, each checked against its own supply manifest.[](source:build-manifest)[](source:supply-verify) | manifest-erd | erd-supplies |
| step-mf-artifacts | artifacts[] | The path, size and SHA-256 of every file in the delivery.[](source:build-artifacts) | manifest-erd | erd-artifacts |
| step-mf-acceptance | acceptance.json | Written later by the reviewer, and names the manifest by its SHA-256.[](source:delivery-accept) | manifest-erd | erd-acceptance |

The manifest also keeps each view and plate with its measures, the overview's composition digest, and the details, statuses and files of every component and relation.[](source:ops-manifest)

## Who accepts a delivery, and how is it published? {#p-accept}

A build shows only that the delivery came from its inputs. A named reviewer accepts it, and tests and checks never stand in for that acceptance.[](source:contract-acceptance)

@diagram lifecycle id=delivery-life source=delivery.lifecycle.json

@steps id=delivery-steps
| step-life-delivered | Build in place | The build writes into a new directory beside `--out`. It is renamed into place only when every artifact and the manifest are written, so a refused build leaves nothing behind.[](source:ops-build)[](source:build-rename) | delivery-life | life-delivered |
| step-life-accepted | Accepted build | `archpub accept` verifies every artifact against the manifest, then records the reviewer, once.[](source:delivery-accept)[](source:ops-accept) | delivery-life | life-accepted |
| step-life-changed | delivery_changed | An artifact that differs from the manifest is refused, at acceptance and again at publication.[](source:delivery-verify) | delivery-life | life-changed |
| step-life-published | Published copy | `archpub publish` copies only an accepted delivery under its model id and version, and verifies the copy first.[](source:delivery-publish)[](source:ops-publish) | delivery-life | life-published |
| step-life-conflict | publish_conflict | A different delivery under the same version is refused; an identical one changes nothing.[](source:ops-publish) | delivery-life | life-conflict |

## How did Architecture Publisher get here? {#p-history}

Architecture Publisher's changelog opens with 0.1.0-alpha.0 on 2026-09-18.[](source:changelog-first) Its 0.4.0, on 2026-10-30, made it a general model-to-media publisher.[](source:changelog-040) The timeline starts there and shows nine releases, up to 0.12.0, that changed what an author or a reviewer meets.

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

| Moving this work from 5a26416 to 548637c | Count |
| ---------------------------------------- | ----- |
| Commits since the pin                    | 27    |
| Owned files modified, of 66              | 23    |
| Owned files deleted                      | 9     |
| Components with modified files           | 13    |
| Relations whose cited files changed      | 26    |
| Claims or relation files refused         | 5     |
| Newly uncovered files                    | 4     |

The refusals are the deleted rasterizer's claim and four relation files the release deleted. Three of the new files form the print edition's own component, and the house tokens join the house class.

@callout level=warning title="Archify checks only that a range exists"
| After a re-pin, a shifted citation would cite other text. Move it to its new range, and reread every touched one.[](source:model-shifted) |

- [ ] Run `archpub check --against <commit>` before you change `repository.revision`.[](source:model-repin)
- [ ] Give each newly uncovered file a claim, and recheck each relation whose files changed.[](source:model-repin)
- [ ] Move each shifted citation to its new range, and reread every touched one.[](source:model-shifted)
- [ ] Check and build again at the new revision, with no file left uncovered.[](source:ops-check)
