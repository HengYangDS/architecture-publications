# Changelog

All notable changes to this repository are documented in this file.

The format is based on [Keep a Changelog], and this repository adheres to [Semantic Versioning].
Versions below `1.0.0` remain pre-release contracts and may contain incompatible changes.

## [Unreleased]

### Added

- A summary on every view of every work, in English and in Chinese, set beside
  its figure in the print edition. The input check refuses a view without one.
- Each work's page shows how its system got here: a timeline of the releases
  that changed what it does for its users, up to the pin, each at its tag's time
  and citing its changelog section. The AIGW, ETHOS, Film Kit and Architecture
  Publisher pages quote the file their reader writes from the pinned revision,
  and the AIGW, ETHOS, Film Kit and OpenAI Responses Proxy pages list the values
  their sources fix.

### Changed

- The repository's checks run on ETHOS 0.2.0-beta.8.
- OpenAI Responses Proxy is pinned at v5.1.10, Architecture Publisher at v0.11.0
  and Film Kit at v0.19.0. Building the works needs Architecture Publisher 0.10.2
  or later.
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
