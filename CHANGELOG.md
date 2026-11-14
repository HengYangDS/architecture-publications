# Changelog

All notable changes to this repository are documented in this file.

The format is based on [Keep a Changelog], and this repository adheres to [Semantic Versioning].
Versions below `1.0.0` remain pre-release contracts and may contain incompatible changes.

## [Unreleased]

### Added

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

### Changed

- The works name roles, not kinds of holder: Architecture Publisher's Chinese work says 「角色」 and 「审阅者」,
  its English work `Roles`, and the Responses proxy's Chinese work 「运维者」. A test refuses 「人员」 and
  「审阅人」 in a work's Chinese files and term table.
- The repository's checks run on ETHOS 0.2.0-beta.10.
- The repository's tools run on Node 26.13.1, a security release, and its format check on Prettier
  3.10.1.
- OpenAI Responses Proxy is pinned at v5.1.12, Architecture Publisher at
  v0.14.0, Film Kit at v0.22.2, ETHOS at v0.2.0-beta.10 and AIGW at v0.7.2.
  Building the works needs Architecture Publisher 0.10.2 or later. The
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
