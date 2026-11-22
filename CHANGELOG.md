# Changelog

All notable changes to this repository are documented in this file.

The format is based on [Keep a Changelog], and this repository adheres to [Semantic Versioning].
Versions below `1.0.0` remain pre-release contracts and may contain incompatible changes.

## [Unreleased]

### Added

- `tests/publication-repository.test.mjs`, the test that a work on GitHub or GitLab states its repository's
  address once.
- `questions/question-table.json`, the 27 questions a work is checked against, each asking one thing, with
  a test of the table's form; and the matrices of three works filled against it by hand.
- `trials/`, the rules and records of the trials that Architecture Publisher's roadmap opens with: the
  reviewer's procedure and seeded checks with the record of the first run, the reader experiment's protocol and
  item bank, and the definitions of the comparison of lines on screen.
- The records of those trials, each with its data, and one page on what they decided: the reader experiment (a
  work's model and guide text beside its repository raise a reader's recall from 0.450 to 0.652; one hand-written
  page of constraints does not), the reviewer's check on defects of form (no holder passes by eye), the comparison
  of lines on screen with a first figure-reading check, and the author's timing, whose protocol is added.
- A summary on every view of every work, in English and in Chinese, set beside
  its figure in the print edition. The input check refuses a view without one.
- Each work's page shows how its system got here: a timeline of the releases
  that changed what it does for its users, up to the pin, each at its tag's time
  and citing its changelog section. The AIGW, ETHOS, Film Kit and Architecture
  Publisher pages quote the file their reader writes from the pinned revision,
  and the AIGW, ETHOS, Film Kit and OpenAI Responses Proxy pages list the values
  their sources fix.
- The input check refuses a work's question or summary that opens with the work's name, which the cover sets
  directly above them.

### Changed

- The twelve models of the six works no longer state `repository.browse`: Architecture Publisher 0.17.0 derives
  the template from a GitHub or GitLab address, and each work's was the one its address implies. The input
  check refuses a template stated beside such an address. The pages, images and figures keep their bytes; each
  delivery's model, and the files that carry it or its digest, lose the line.
- Every view is reached from its work's overview: ETHOS's lane step gains the station Status and its overview a
  short block on the runtime every hook runs; AIGW Client's block "What the operator does" and Film Kit's step
  "Package" name their works' first view. Each in both languages. The input check refuses a view its overview
  names nowhere (`tests/publication-overview.test.mjs`); the tests' shared model, directory and writer stand in
  `tests/fixtures/works.mjs`, and `npm test` runs every test file.
- Each work's Chinese question no longer opens with the work's name, which its cover sets directly above it.
- Seven summaries are turned so that no line of theirs stands with too little to fill it, its spaces or
  characters stretched past the house's limits: in English plates 03 and 06 of Architecture Publisher, plate 03
  of Film Kit and plate 05 of OpenAI Responses Proxy; in Chinese the ETHOS cover, the overview of Architecture
  Publisher and plate 04 of OpenAI Responses Proxy. Each says what it said before, as its other language does.
- A work's cover says its name once, in its title. The summaries of ETHOS, AIGW Client and Film Kit open
  with what the work does, in both languages, and the guidelines' Chinese summary turns the sentence whose
  spread line ended before 「OpenSpec」. The ETHOS relation into the release part names the build identity it
  admits, and plate 06 of Architecture Publisher says its Explainer page part makes the page.
- The AIGW Client work names its team file by its file: the scope names `manifests/team.toml`, and the
  overview's block on team files gives the command as `setup --from team.toml`.
- Each work names the palette its edition is drawn in, the same in both languages: ETHOS Indigo, the Data
  Department Work Guidelines Soot, Architecture Publisher Persimmon, AIGW Client Patina, Film Kit Sappan and the
  OpenAI Responses Proxy Chestnut. The Chinese editions name their editor 衡阳.
- Two measurements are made again at their works' pins. The ETHOS page's figure of one full proof holds the gates
  of a proof that v0.2.0-beta.10 ran on 2026-11-19, where it held one of v0.2.0-beta.6; the table of a pin move
  in Architecture Publisher's own page holds the work's move from v0.14.0 to v0.15.0, where it held the move
  from v0.9.0 to v0.10.0.
- Every work states its overview in its model, in both languages, and the twelve `overview.typ` compositions
  are gone: Architecture Publisher 0.15.0 draws the overview from the statement and refuses a model that names a
  composition. The input check holds a work's languages to one shape of statement and refuses a Typst file beside
  a model. The works' READMEs and term tables, the repository's README and `CONTRIBUTING.md` say so. Film Kit's
  statement names the detail audit, which its composition lacked.
- The Chinese of the six works is corrected after readings by readers other than its writer. Each term table renders
  a term by the thing it names in its work, and each Chinese model and overview composition follows its table: a
  secret is 凭据, 令牌 or 密钥 by what it is, a fetch 抓取, a checkout as a thing 检出目录; ETHOS's Attestation is
  存证, its proof 核验 and its profile 治理配置. The reasons of excluded paths that three Chinese models gave in
  English are Chinese.
- The six Chinese guides, which a work's page in a browser is built from, follow the corrected term tables and
  Chinese models, in the article and in the labels of its figures. A reader other than the writer read each guide
  against its English, and a second reader confirmed every change. DDWG's release declaration is 发布配置, Film
  Kit's bound 限值, its recognition proxy 只作旁证的识别结果 and Architecture Publisher's lock 锁文件 in their term
  tables too, and OpenAI Responses Proxy's table no longer repeats two rows.
- The works name roles, not kinds of holder: Architecture Publisher's Chinese work says 「角色」 and 「审阅者」,
  its English work `Roles`, and the Responses proxy's Chinese work 「运维者」. A test refuses 「人员」 and
  「审阅人」 in a work's Chinese files and term table.
- The repository's checks run on ETHOS 0.2.0-beta.11, the hosted GitHub job installs Mise 2026.11.11
  instead of 2026.11.9, and the hosted jobs keep their CI artifacts for 14 days.
- The repository's tools run on Node 26.13.1, a security release, and its format check on Prettier
  3.10.1.
- OpenAI Responses Proxy is pinned at v6.0.3, Architecture Publisher at
  v0.16.0, Film Kit at v0.26.0, ETHOS at v0.2.0-beta.11 and AIGW at v0.8.3.
  Building the works needs Architecture Publisher 0.15.0 or later. The
  Architecture Publisher work lists the `skill` command, describes strips,
  palettes, age bands and the sealed acceptance of an edition, and claims
  `src/style.mjs`. The Film Kit work claims the engine's own draft and picture
  repair, its Spotlight readback and the label matches of its picture gate.
  At v0.14.0 the Architecture Publisher work describes details set as a justified paragraph in a language written
  without spaces between words, the house faces measured with their pair kerning, and a key set by its baseline. At
  v0.2.0-beta.10 the ETHOS work describes the blank-line owner of every format, the Markdown list rule, package
  markers, and the repair preview a refusal names as its next action.
  At v5.1.12 the Responses proxy work describes how a stream that ends with a top-level `error` event is ended and
  reported, and what `--port` and `--timeout-seconds` refuse. At v0.7.1 the AIGW work describes a client check that
  starts each client without a parent agent session's variables.
  At v0.22.2 the Film Kit work describes the check of an assembled soundtrack before its picture, a caption cue's
  typeset text and the edge slivers the picture comparison measures, and claims the edge-sliver module. At v0.7.2
  the AIGW work describes what a client check says of a client's own warning or error.
  At v6.0.0 the Responses proxy work no longer describes a drain as something the proxy does: upgrade, rollback and
  reload replace a listener only by handoff, a runtime without both handoff capabilities is refused, and the history
  records the release that removed the drain. At v0.22.3 the Film Kit work describes the levelling of each segment
  within its chapter.
  At v0.8.0 the AIGW work says that AIGW no longer takes over or migrates a Keychain item that 0.3.5 or earlier
  stored, that a program rollback moves no credential and is refused on a Homebrew installation, and that an empty
  Token counts as a missing one; its commands, not its entry, reach program updates, and its history ends at the
  release.
  At v6.0.1 the Responses proxy work says that the log names how every admitted response ended, a JSON response's
  among them, and its history ends at the release.
  At v0.8.1 the AIGW work says that a command asks the credential store once about a provider's Token and once
  about its balance credentials, and again only after it stores or removes that credential; its history ends at
  0.8.1, whose `aigw use` says that an entered Token was not kept when its selection fails.
  At v6.0.3 the Responses proxy work says that a handoff request that ends without the listener's answer is waited
  out before the previous release is restored, that an installed payload is read only through the generation the
  selector names, and that `uninstall` reads the payload generations before it removes the native service; its
  history ends at the release. At v0.23.1 the Film Kit work describes the detail audit, an uncaptioned picture
  derived from the captioned one and the qualification of the renderer for it, the records `preflight` asks for
  and its readiness receipt, the duration records, a narration's processes and the delivery folder a film names;
  it claims the fifteen files new in its scope, two of them as new parts, and its history ends at the release.
  At v0.15.0 the Architecture Publisher work says that a model states its overview and the publisher draws it, that
  a delivery holds the model, the pinned edition as data and a reader file, and that `archpub compare` stands beside
  acceptance; it claims the files new in its scope, `src/facts/` and `src/pinned/` as new parts, names no holder for
  `publish`, and its history ends at the release.
  At v0.8.2 the AIGW work says how a model's label is derived when its ID adds to its family's, that a configuration
  or a team file in which two models of one provider have one label is refused, that the team file keeps each
  provider's newest qualifying model of a product line and leaves a client's selection, what Codex's catalog alias
  shows, and that Hermes's configuration is read and written through `go.yaml.in/yaml/v4`; the inputs of the Hermes
  adapter's tests leave its scope, and its history ends at the release.
  At v0.24.0 the Film Kit work describes the engine's native renderer, which draws a film's pictures on a canvas of
  `@napi-rs/canvas` with no browser, in spans joined by stream copy, and what a render receipt names of it; the one
  reader of a film's `@font-face` rules; the judgment of a take that the audition, `judge` and `converge` share,
  with a take held to its words by reading; and the host's load in a duration record. Two parts join it, the take
  judgment and the native renderer, with thirteen relations more than it had, and its history ends at the release.
  At v0.24.1 the Film Kit work describes the engine's native renderer, which draws a film's pictures on a canvas of
  `@napi-rs/canvas` with no browser, in spans joined by stream copy, and what a render receipt names of it; the one
  reader of a film's `@font-face` rules; the judgment of a take that the audition, `judge` and `converge` share,
  with a take held to its words by reading; and the host's load in a duration record. Two parts join it, the take
  judgment and the native renderer, with thirteen relations more than it had, and its history ends at the release.
  The release 0.24.1 moves the repository's supply only, and the work pins it.
  At v0.8.3 the AIGW work says that `aigw setup --from` applies the team file whatever becomes of each Token, which
  providers it asks about in a terminal, what it does with a Token that its provider does not accept and with a
  prompt that is cancelled, that its JSON document has schema version 4 with a Token's state and reason, that a
  Token is validated by one request to its provider's catalog and what that request cannot refuse, and that the team
  file names four providers and recommends for each client a model on each; its history ends at the release.
  At v0.26.0 the Film Kit work says that a review round is prepared by one command, that a film's release record is
  written from its delivered build, that one run lists what a release asks of a film, that each edition's packaged
  film is scanned for still pictures under speech and that the verification and the delivery require that scan, and
  that `converge` counts a settled edition against its runtime; the seven new files of the two releases have their
  owners, and its history ends at the release.
  At v0.16.0 the Architecture Publisher work says that each plate's figure and key are delivered alone, as PNG on a
  transparent ground and as SVG, that the edition ends with an index of the parts linked from the contents, that a
  page's image is 3840 px wide by default, and that a build asks Archify once to validate and write its page; its
  history ends at the release.
  At v0.2.0-beta.11 the ETHOS work says that a release build of ETHOS pins itself in the repository's Mise
  configuration when it adopts one, that `ethos release accept` accepts a release, that `ethos host status` reads
  the host's queue, that `ethos publish --observe-hosted` reads a head's hosted runs without granting authority, and
  that an obligation which only reports refuses no path; the five new files of the release have their owners, and
  its history ends at the release.
- The ETHOS work claims the application layer and the operation catalog. The
  AIGW work uses the client's new vocabulary: it no longer has a renaming
  component, and its catalog, readiness, configuration and rollout panels follow
  v0.7.0.
- The Film Kit work names its subject Film Kit, as its project does, and keeps
  `filmkit` for the package, its commands and paths. Its motion audit lists dash
  snaps, and its 1080p films are averaged over each 2×2 block and keyed every 2 s.
- Each work's term table opens as `<title>: term renderings`, is introduced in
  English and names the revision it cites; the film repositories are cited by
  their public names at their releases. The input check refuses a README or term
  table that does not name its work's title and pinned revision.
- Each work holds each of its languages in a directory of its own, `en/` and
  `zh/`, with the same files, and its term table `concepts.md` beside them; each
  English model names its locale. The input check refuses any other layout, and
  each language is built from its own directory:
  `archpub build publications/<work>/<language>/model.json`.

### Fixed

- The page of constraints that the reader experiment gave its readers for ETHOS states the per-file ceiling as 500
  lines, from the decision record that corrects it, where it said 512 from a stale one. The experiment's record
  quotes the line as the readers had it; no item asked for the ceiling and no score changes.

## [0.1.0] - 2026-11-09

### Added

- Six works, each an Architecture Model that Architecture Publisher draws as a print edition and an
  interactive page: ETHOS, AIGW Client Projection, Architecture Publisher, Data Department Work
  Guidelines, filmkit and OpenAI Responses Proxy.
- Each work's model in format version 3, in English and in a zh-CN translation with its own
  overview, guide and table of term renderings.
- Checks of the works' inputs and formatting, and publication of the repository to GitHub and
  GitLab.
- `VERSION` as the repository's only version source.

[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[Semantic Versioning]: https://semver.org/spec/v2.0.0.html
