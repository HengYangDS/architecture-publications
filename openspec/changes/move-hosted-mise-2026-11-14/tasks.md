## 1. Hosted supply

- [x] 1.1 Move `[supply] mise_version` and the workflow's Mise line to Mise 2026.11.14; done when The parameter and the workflow's line moved; the check reports the projections conforming, and no other generated line changed.
      `ethos lane project --check --json` reports the projections conforming and only the two Mise
      lines changed.
- [x] 1.2 Record the move in the Changelog's Unreleased section; done when the repository check The Unreleased section names Mise 2026.11.14; `mise run check` passes.
      passes.

## 2. Lock compatibility

- [x] 2.1 Check the tracked version-3 lock with Mise 2026.11.14's `mise lock --check` before the Mise 2026.11.14 names only platforms ETHOS does not build (macos-x64), as the earlier moves did; the lock's bytes are unchanged.
      proof; done when it passes, or its only problems are platforms the release does not build and
      are named in this task, and the lock's bytes are unchanged.
