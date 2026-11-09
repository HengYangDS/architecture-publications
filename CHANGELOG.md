# Changelog

All notable changes to this repository are documented in this file.

The format is based on [Keep a Changelog], and this repository adheres to [Semantic Versioning].
Versions below `1.0.0` remain pre-release contracts and may contain incompatible changes.

## [Unreleased]

### Added

- A summary on every view of every work, in English and in Chinese, set beside
  its figure in the print edition. The input check refuses a view without one.

### Changed

- OpenAI Responses Proxy is pinned at v5.1.10 and Architecture Publisher at
  v0.10.2. Building the works needs Architecture Publisher 0.10.2 or later.

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
