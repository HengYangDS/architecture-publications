## Why

The ETHOS and AIGW works describe code that has since moved. ETHOS is pinned
at `ad9108d`, 214 commits before v0.2.0-alpha.28, and 43 of its 65 cited
sources have changed; AIGW is pinned at `ed9f0fd`, 200 commits before v0.6.0,
and 12 of its 14 have moved or been deleted. Run against their repositories,
the works cite 65 of 1,854 and 14 of 1,542 tracked files, and neither has an
overview page.

## What Changes

- The ETHOS work is re-pinned at v0.2.0-alpha.28 (`424d325`). Its coverage
  scope is the `src/ethos` package, `system/`, the npm launcher and the
  repository's own `.ethos` binding, and it cites all 455 files there with
  their digests, through 41 components, 85 relations and 11 views. Every
  relation is an import in the source, and every relation is drawn.
- The AIGW work is re-pinned at v0.6.0 (`9c26591`). Its coverage scope is
  `cmd/`, `internal/`, the team manifest and `go.mod`, leaving out the tests
  beside the code and their inputs, and it cites all 210 production files
  there, through 22 components, 43 relations and 6 views.
- Each work names an overview composition set in the house class.
- The ETHOS work is delivered with its posters and overview. Its page waits
  for a redesign within Archify's four-diagram scale: Archify 3.2.0 cuts the
  check receipt of the 11-view page at 64 KiB on macOS.
- The overviews of all three works said every source is in the interactive
  page, which cites only each component's first source. Each masthead now
  gives the number of files the work reads, each cited by its SHA-256, and
  each imprint says the page holds every view, step by step.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None; the input check already admits a work's composition.

## Impact

The two works' models, READMEs and new compositions, the Architecture
Publisher work's composition, and the repository README. The ETHOS work's `source.json` and AIGW's keep recording their
preserved originals, which stay at their preservation commit.
