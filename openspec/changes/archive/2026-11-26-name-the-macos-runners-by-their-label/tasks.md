## 1. Runner tags

- [x] 1.1 Select the macOS runners by `macos-latest` and their role, and generate the pipeline; done when the
      projection check reports it conforming and only the jobs' tags changed. The two lists name `macos-latest` and the role; the projection check reports the pipeline conforming, and only its tag lines changed.
- [x] 1.2 Record the move in the Changelog's Unreleased section; done when the repository check passes. The Unreleased section's Changed list records the move; `mise run check` passes.
