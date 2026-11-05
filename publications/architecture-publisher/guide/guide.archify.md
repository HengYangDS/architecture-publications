# How does Architecture Publisher turn an architecture model into posters, a page and an overview? {#guide}

`archpub` reads one model, binds the files its components claim at the pinned revision and plans its views. It lays each view out on one grid, draws poster pages, delivers one Archify page and typesets the author's overview.[](source:contract-processing) A manifest binds every artifact to its inputs, and a named reviewer accepts the delivery before it is published.[](source:contract-product)[](source:contract-acceptance)

- [The model is the only source of meaning](block:p-model): the publisher never infers architecture from code.[](source:model-meaning)[](source:contract-meaning)
- [Git is only read](block:p-files): each file comes from the pinned commit, and the checkout never changes.[](source:model-repo)
- [A layout with an overlap is never drawn](block:p-layout), and a view that no layout draws is refused, not shrunk.[](source:contract-layout-floor)
- [Only an accepted delivery is published](block:p-accept), and never over a different one.[](source:contract-acceptance)

@answer scope="Architecture Publisher v0.8.0 · commit a2f4224 · its source and its own documents · re-pin counts measured on 2026-11-05"
@meta locale=en style=editorial
@source contract-product title="The product" path="docs/product-contract.md" lines=13:20
@source contract-meaning title="Who owns meaning and form" path="docs/product-contract.md" lines=22:27
@source contract-processing title="The six steps of a build" path="docs/product-contract.md" lines=50:62
@source contract-bytes title="The same inputs, the same bytes" path="docs/product-contract.md" lines=64:65
@source contract-guide title="The guide and the generated page" path="docs/product-contract.md" lines=82:91
@source contract-poster-floor title="The poster quality floor" path="docs/product-contract.md" lines=95:103
@source contract-layout-floor title="Cards, wires and no overlap" path="docs/product-contract.md" lines=107:114
@source contract-acceptance title="Acceptance and publication" path="docs/product-contract.md" lines=126:130
@source contract-counts title="Counts, never refusals" path="docs/product-contract.md" lines=136:138
@source model-meaning title="The only source of meaning" path="docs/reference/model.md" lines=11:17
@source model-fields title="Top-level fields" path="docs/reference/model.md" lines=56:78
@source model-unknown title="Unknown fields" path="docs/reference/model.md" lines=80:82
@source model-claims title="The most specific claim" path="docs/reference/model.md" lines=141:158
@source model-repo title="Reading at the revision" path="docs/reference/model.md" lines=160:168
@source model-version-one title="From version 1" path="docs/reference/model.md" lines=181:187
@source model-coverage title="Coverage paths and globs" path="docs/reference/model.md" lines=200:206
@source model-repin title="The re-pin worklist" path="docs/reference/model.md" lines=228:240
@source model-shifted title="Shifted and touched citations" path="docs/reference/model.md" lines=242:245
@source model-overview title="The overview composition" path="docs/reference/model.md" lines=249:253
@source model-house title="What the house class provides" path="docs/reference/model.md" lines=266:275
@source model-groups title="Groups" path="docs/reference/model.md" lines=319:325
@source model-views title="Views" path="docs/reference/model.md" lines=329:337
@source model-views-plan title="Declared and planned views" path="docs/reference/model.md" lines=349:353
@source ops-check title="archpub check" path="docs/reference/operations.md" lines=47:57
@source ops-build title="archpub build" path="docs/reference/operations.md" lines=58:60
@source ops-media title="Media, widths and quality" path="docs/reference/operations.md" lines=61:69
@source ops-migrate title="Import, scaffold and migrate" path="docs/reference/operations.md" lines=70:80
@source ops-exit title="Exit status and refusals" path="docs/reference/operations.md" lines=85:91
@source ops-rows title="Rows, placement and channels" path="docs/reference/operations.md" lines=98:112
@source ops-overlap title="A layout never overlaps" path="docs/reference/operations.md" lines=113:118
@source ops-poster-page title="A poster page" path="docs/reference/operations.md" lines=140:144
@source ops-gates title="The four balance gates" path="docs/reference/operations.md" lines=151:155
@source ops-sparse title="Sparse pages and refusals" path="docs/reference/operations.md" lines=159:167
@source ops-text title="Outlined text and PNG widths" path="docs/reference/operations.md" lines=167:172
@source ops-page title="The generated page" path="docs/reference/operations.md" lines=174:184
@source ops-page-grid title="The page's diagrams on the same grid" path="docs/reference/operations.md" lines=185:190
@source ops-overview title="The overview" path="docs/reference/operations.md" lines=251:264
@source ops-guide title="The guide" path="docs/reference/operations.md" lines=268:275
@source ops-guide-clone title="Sources verified at the revision" path="docs/reference/operations.md" lines=277:285
@source ops-scaffold title="A starting guide" path="docs/reference/operations.md" lines=287:289
@source ops-delivery title="The delivery's files" path="docs/reference/operations.md" lines=296:306
@source ops-manifest title="The manifest" path="docs/reference/operations.md" lines=308:324
@source ops-accept title="archpub accept" path="docs/reference/operations.md" lines=328:330
@source ops-publish title="archpub publish" path="docs/reference/operations.md" lines=332:336
@source readme-layout title="Layout is a grid" path="README.md" lines=86:93
@source build-prepare title="One build's route" path="src/build.mjs" lines=137:176
@source build-composition title="A missing composition" path="src/build.mjs" lines=116:135
@source build-artifacts title="Every artifact's digest" path="src/build.mjs" lines=321:338
@source build-manifest title="The manifest record" path="src/build.mjs" lines=377:422
@source build-rename title="Renamed into place" path="src/build.mjs" lines=423:439
@source load-top title="The model's fields" path="src/model/load.mjs" lines=39:48
@source load-problems title="Every problem in one pass" path="src/model/load.mjs" lines=54:63
@source load-files title="Claims and cited files" path="src/model/load.mjs" lines=119:157
@source load-version title="A version 1 model" path="src/model/load.mjs" lines=159:169
@source load-views title="Tiers or members" path="src/model/load.mjs" lines=355:384
@source paths-coverage title="Checking the coverage scope" path="src/model/paths.mjs" lines=35:75
@source git-read title="Read-only Git" path="src/sources/git.mjs" lines=8:31
@source git-commit title="The pinned commit" path="src/sources/git.mjs" lines=45:55
@source scope-glob title="Globs matched by Git" path="src/sources/scope.mjs" lines=29:51
@source scope-at title="The scope at a commit" path="src/sources/scope.mjs" lines=86:128
@source bind-owner title="The most specific claim" path="src/sources/bind.mjs" lines=82:87
@source bind-refuse title="files_unresolved" path="src/sources/bind.mjs" lines=110:129
@source bind-read title="One batch of digests" path="src/sources/bind.mjs" lines=130:149
@source views-plan title="Planning the views" path="src/plan/views.mjs" lines=130:158
@source views-undrawn title="What no view draws" path="src/plan/views.mjs" lines=160:178
@source views-admit title="Admitting every view" path="src/plan/views.mjs" lines=200:223
@source edition-compose title="Pages of one to three plates" path="src/poster/compose/edition.mjs" lines=7:17
@source edition-admitted title="Balanced, sparse or draft" path="src/poster/compose/edition.mjs" lines=115:131
@source raster title="PNG with resvg" path="src/poster/raster.mjs" lines=29:47
@source guide-read title="Reading the draft" path="src/map/guide.mjs" lines=131:161
@source guide-page title="The draft as the page" path="src/map/guide.mjs" lines=163:215
@source guide-clone title="A temporary clone" path="src/map/guide.mjs" lines=243:263
@source explainer-page title="One panel per view" path="src/map/explainer.mjs" lines=208:219
@source explainer-deliver title="Finalizing with Archify" path="src/map/explainer.mjs" lines=289:299
@source typeset-version title="Typst 0.15.1" path="src/overview/typeset.mjs" lines=45:61
@source typeset-stage title="Staging the composition" path="src/overview/typeset.mjs" lines=84:115
@source typeset-problems title="Refusals at the composition's line" path="src/overview/typeset.mjs" lines=136:167
@source lint-rules title="What a composition may not do" path="src/overview/lint.mjs" lines=3:20
@source checks-boxes title="Text inside and apart" path="src/overview/checks.mjs" lines=22:56
@source supply-verify title="Supplies verified by digest" path="src/supply.mjs" lines=21:39
@source delivery-verify title="Verifying a delivery" path="src/delivery.mjs" lines=11:36
@source delivery-accept title="Recording an acceptance" path="src/delivery.mjs" lines=52:77
@source delivery-publish title="Publishing a copy" path="src/delivery.mjs" lines=79:136
@source worklist-fates title="What became of each file" path="src/sources/worklist.mjs" lines=5:12
@source worklist-citation title="How a cited range fares" path="src/sources/worklist.mjs" lines=63:67
@source worklist-repin title="The worklist" path="src/sources/worklist.mjs" lines=97:110

## What does a model hold, and when is it refused? {#p-model}

An author writes the model; `archpub import likec4` writes one from a LikeC4 workspace, and `archpub migrate` from a version 1 model.[](source:model-meaning)[](source:ops-migrate) The loader reports every problem with its JSON path in one pass, and nothing is built from an invalid model.[](source:load-problems)

@diagram class id=model-map source=model.class.json

@steps id=model-steps
| step-model-file | model.json | Requires `format`, `version` 2, `id`, `title`, `question`, `components` and `relations`; `overview` and `guide` name files beside it.[](source:load-top)[](source:model-fields) | model-map | model-file |
| step-model-components | components[] | Each claims the paths it owns: a directory ending in `/`, or one file. No path is claimed twice.[](source:load-files)[](source:model-claims) | model-map | model-components |
| step-model-relations | relations[] | Each connects two components and cites single files as its evidence.[](source:load-files) | model-map | model-relations |
| step-model-views | views[] | Each declares exactly one of `tiers` or `members`.[](source:load-views)[](source:model-views) | model-map | model-views |
| step-model-coverage | coverage{} | Names the paths the model describes and those it leaves out, each with a reason; a path may be a glob.[](source:paths-coverage)[](source:model-coverage) | model-map | model-coverage |

@facts
| Version 1 model | Refused with the command that converts it.[](source:load-version)[](source:model-version-one) |
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

Each view is drawn as one poster plate. The plan keeps a view only when a poster page can lay it out.[](source:model-views)[](source:views-admit)

@diagram workflow id=plan-flow source=plan.workflow.json

@steps id=plan-steps
| step-plan-declared | Views declared? | A model that declares views gets those views, in their order.[](source:views-plan)[](source:model-views-plan) | plan-flow | plan-declared |
| step-plan-admit | Admit each declared view | Each view must lay out on a poster page; the refusal names every view that does not.[](source:views-admit) | plan-flow | plan-admit |
| step-plan-whole | One view of every component | Without declared views, the publisher first tries one view that draws the whole model.[](source:views-plan) | plan-flow | plan-whole |
| step-plan-groups | Groups declared? | A model too large for one poster is drawn as one card per group, then one view per group.[](source:model-groups) | plan-flow | plan-groups |
| step-plan-refused | Plan refused | Without groups, the build stops with `plan_requires_structure` and asks for groups or views.[](source:views-plan) | plan-flow | plan-refused |

`archpub check` also lists the components and relations that no planned view draws. It reports them and never refuses the model for them.[](source:views-undrawn)[](source:contract-counts)

## How is a view laid out without an overlap? {#p-layout}

Posters and the page's diagrams use one grid. Posters set it with their own type sizes, the page with Archify's text metrics.[](source:readme-layout)[](source:ops-page-grid)

@diagram architecture id=layout-map source=layout.architecture.json

@steps id=layout-steps
| step-lay-rows | Rows | Declared tiers are the rows, in order. Otherwise every relation points down or stays within one row.[](source:ops-rows) | layout-map | lay-rows |
| step-lay-placement | Placement | Places the cards in their rows exactly, with the fewest weighted crossings, bends and unused columns.[](source:ops-rows) | layout-map | lay-placement |
| step-lay-wires | Wires | Run the relations between rows as buses, corridors, lanes beside the cards and straight arrows.[](source:ops-rows) | layout-map | lay-wires |
| step-lay-solver | Channel solver | Gives each channel the routing with the fewest crossings, then, on posters, the fewest route defects.[](source:ops-overlap) | layout-map | lay-solver |
| step-lay-measure | Neatness measure | A diagonal, a shared segment, a wire through a card or a touching label rejects that layout.[](source:ops-overlap) | layout-map | lay-measure |

@callout level=note title="Refused, never shrunk"
| A view is refused only when no row wrapping, width or type step lays it out. Text is never shrunk, and nothing is cropped.[](source:readme-layout)[](source:contract-layout-floor) |

## When is a poster page printed? {#p-posters}

A poster page is 2400 × 1350 px with no text below 14 px. It holds one to three views that share no component.[](source:ops-poster-page) Its text is outlined from the bundled faces, and each page is written as SVG and as PNG.[](source:ops-text)[](source:raster)

@diagram lifecycle id=poster-life source=poster.lifecycle.json

@steps id=poster-steps
| step-poster-candidate | Candidate page | The composer packs views onto a page until it is full, and never draws a component twice.[](source:edition-compose) | poster-life | poster-candidate |
| step-poster-gates | Four gates passed? | Each page is measured for its largest blank rectangle, blank bands, holes and centre of mass.[](source:ops-gates) | poster-life | poster-gates |
| step-poster-balanced | Balanced page | A page that passes all four gates is printed.[](source:edition-admitted) | poster-life | poster-balanced |
| step-poster-sparse | Sparse page | When its figures already stand at the largest type step, the model has too little to fill the page, and it is printed as sparse.[](source:ops-sparse) | poster-life | poster-sparse |
| step-poster-draft | Draft page | Only `--quality standard` prints a page that misses a gate, as a draft that records what it misses.[](source:edition-admitted)[](source:ops-media) | poster-life | poster-draft |
| step-poster-refused | poster_unbalanced | Otherwise the build is refused with the closest page's measures and limits.[](source:ops-sparse) | poster-life | poster-refused |

The manifest records each page's admission and the gates it misses.[](source:contract-poster-floor)

## How is the page made and checked? {#p-page}

The page is one standalone `index.html`, delivered by the vendored Archify 3.2.0. When the model names a draft in `guide`, that draft is the page.[](source:contract-guide)[](source:ops-guide)

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
| page-archify | page-guide | index.html | return |

@steps id=page-steps
| step-page-read | Guide | Reads the draft and each file its `@diagram`, `@chart` and `@image` lines name; a link, another path or a missing file is refused.[](source:guide-read)[](source:ops-guide) | page-flow | page-guide |
| step-page-repo | Guide | A draft that names another repository URL or revision than the model is refused.[](source:guide-page) | page-flow | page-guide |
| step-page-clone | Temporary clone | Shares the checkout's objects, with `origin` at the model's URL and `HEAD` at its revision, and is removed after use.[](source:guide-clone)[](source:ops-guide-clone) | page-flow | page-clone | | page-guide-to-page-clone-1,page-guide-to-page-clone-2 |
| step-page-validate | Vendored Archify | Validates the draft at the build's quality, with strict writing at showcase, and verifies every cited line range at the revision.[](source:guide-page)[](source:ops-guide-clone) | page-flow | page-archify | | page-guide-to-page-archify-1,page-archify-to-page-clone-1,page-archify-to-page-guide-1 |
| step-page-deliver | Vendored Archify | Writes the page as one standalone `index.html`; the draft and Archify's receipts stay out of the delivery.[](source:explainer-deliver) | page-flow | page-archify | | page-guide-to-page-archify-2,page-archify-to-page-guide-2 |

Without a draft, the publisher writes one panel per view, each with a native diagram laid out on the same grid.[](source:ops-page)[](source:explainer-page) `archpub scaffold guide` writes that page as a starting draft.[](source:ops-scaffold)

## How is the overview typeset and checked? {#p-overview}

The overview is one 16:9 page that the author composes in Typst with the house class. The class owns the page, the faces, the four type sizes and the palette.[](source:model-overview)[](source:model-house)

@diagram workflow id=overview-flow source=overview.workflow.json

@steps id=overview-steps
| step-ov-composition | Composition there? | A model may name a composition that is not there; the build is refused with `overview_composition_missing` and the path it looked at.[](source:build-composition) | overview-flow | ov-composition |
| step-ov-typst | Typst 0.15.1 on the path? | Any other version is refused, since the overview's bytes depend on it.[](source:typeset-version) | overview-flow | ov-typst |
| step-ov-stage | Stage and lint | Copies the composition, the house class and the model into one root that Typst may not leave. A package, a plugin, or a size, face or colour of its own is refused.[](source:typeset-stage)[](source:lint-rules) | overview-flow | ov-stage |
| step-ov-boxes | Read the text boxes | Each text the house class sets records its box, which the build reads back from Typst.[](source:ops-overview) | overview-flow | ov-boxes |
| step-ov-check | Text inside and apart? | Text stays 48 pt from either side and 16 pt from the top and the bottom, and never lies over other text.[](source:checks-boxes) | overview-flow | ov-check |
| step-ov-compile | overview.svg and PNG | Only then are the SVG and one PNG per width written, so the same inputs give the same bytes.[](source:ops-overview) | overview-flow | ov-compile |
| step-ov-refused | Overview refused | Each refusal names the composition's line, and a Typst warning is refused as well.[](source:typeset-problems) | overview-flow | ov-refused |

## What does the manifest bind? {#p-manifest}

A delivery holds the poster pages, `index.html`, the overview and `manifest.json`.[](source:ops-delivery) The manifest holds no time, host path or user name, so the same model and version rebuild every byte on one platform.[](source:ops-manifest)[](source:contract-bytes)

@diagram erd id=manifest-erd source=manifest.erd.json

@steps id=manifest-steps
| step-mf-manifest | manifest.json | Names the publisher's version, the model's digest and size, the quality and the media.[](source:build-manifest) | manifest-erd | erd-manifest |
| step-mf-records | sources.records[] | Every owned or cited file, with its digest, its owner and the relations that cite it; this record is the edition's lock.[](source:bind-read)[](source:model-repo) | manifest-erd | erd-records |
| step-mf-supplies | supplies{} | The digest of each bundled supply the build ran, each checked against its own supply manifest.[](source:build-manifest)[](source:supply-verify) | manifest-erd | erd-supplies |
| step-mf-artifacts | artifacts[] | The path, size and SHA-256 of every file in the delivery.[](source:build-artifacts) | manifest-erd | erd-artifacts |
| step-mf-acceptance | acceptance.json | Written later by the reviewer, and names the manifest by its SHA-256.[](source:delivery-accept) | manifest-erd | erd-acceptance |

The manifest also keeps each view and page with its measures, the overview's composition digest, and the details, statuses and files of every component and relation.[](source:ops-manifest)

## Who accepts a delivery, and how is it published? {#p-accept}

A build shows only that the delivery came from its inputs. A named reviewer accepts it, and tests and checks never stand in for that acceptance.[](source:contract-acceptance)

@diagram lifecycle id=delivery-life source=delivery.lifecycle.json

@steps id=delivery-steps
| step-life-delivered | Build in place | The build writes into a new directory beside `--out`. It is renamed into place only when every artifact and the manifest are written, so a refused build leaves nothing behind.[](source:ops-build)[](source:build-rename) | delivery-life | life-delivered |
| step-life-accepted | Accepted build | `archpub accept` verifies every artifact against the manifest, then records the reviewer, once.[](source:delivery-accept)[](source:ops-accept) | delivery-life | life-accepted |
| step-life-changed | delivery_changed | An artifact that differs from the manifest is refused, at acceptance and again at publication.[](source:delivery-verify) | delivery-life | life-changed |
| step-life-published | Published copy | `archpub publish` copies only an accepted delivery under its model id and version, and verifies the copy first.[](source:delivery-publish)[](source:ops-publish) | delivery-life | life-published |
| step-life-conflict | publish_conflict | A different delivery under the same version is refused; an identical one changes nothing.[](source:ops-publish) | delivery-life | life-conflict |

## What does moving the pin change? {#p-repin}

Before moving `repository.revision` to a later commit, run `archpub check --against <commit>`. The re-pin worklist resolves the model's claims at both commits and never refuses the check.[](source:model-repin)[](source:worklist-repin)

@diagram tree id=worklist-tree source=worklist.tree.json

@steps id=worklist-steps
| step-wl-components | Per component | Its owned files that were modified, moved with the component their new path falls to, or deleted, and the files its claims take in.[](source:model-repin) | worklist-tree | wl-components |
| step-wl-relations | Per relation | The cited files that changed, as Git's rename detection reads them.[](source:worklist-fates) | worklist-tree | wl-relations |
| step-wl-refused | Refused at the later commit | The claims that would own no file and the relation files that would be gone; a build there refuses both.[](source:model-repin) | worklist-tree | wl-refused |
| step-wl-uncovered | Newly uncovered files | Files of the scope that fall under no claim at the later commit.[](source:model-repin) | worklist-tree | wl-uncovered |
| step-wl-citations | Cited line ranges | Each range the draft and its diagrams cite: the same, shifted, moved with its file, touched by a change, or gone.[](source:worklist-citation)[](source:model-repin) | worklist-tree | wl-citations |

| Moving this work from 97c2079 to a2f4224 | Count |
| ---------------------------------------- | ----- |
| Commits since the pin                    | 54    |
| Owned files modified, of 55              | 10    |
| Components with modified files           | 8     |
| Relations whose cited files changed      | 14    |
| Claims or relation files refused         | 0     |
| Newly uncovered files                    | 4     |

Each of the four new files has a component of its own in this edition.

@callout level=warning title="Archify checks only that a range exists"
| After a re-pin, a shifted citation would cite other text. Move it to its new range, and reread every touched one.[](source:model-shifted) |

- [ ] Run `archpub check --against <commit>` before you change `repository.revision`.[](source:model-repin)
- [ ] Give each newly uncovered file a claim, and recheck each relation whose files changed.[](source:model-repin)
- [ ] Move each shifted citation to its new range, and reread every touched one.[](source:model-shifted)
- [ ] Check and build again at the new revision, with no file left uncovered.[](source:ops-check)
