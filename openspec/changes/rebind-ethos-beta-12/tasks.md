## 1. Runtime

- [ ] 1.1 Replace the 0.2.0-beta.11 declaration in `.config/mise/config.toml` with 0.2.0-beta.12 for linux-arm64,
      linux-x64 and macos-arm64, checked against the release's `SHA256SUMS` and asset digests, drop the two Windows
      declarations, limit the lock's platforms to those three and lock again with native `mise lock`. Done when the
      lock holds ETHOS 0.2.0-beta.12 and Node for those three platforms only, no 0.2.0-beta.11 entry remains and it
      keeps `lockfile_version = 3`.
- [ ] 1.2 Bind the repository family to the 0.2.0-beta.12 runtime with the locked console's `hook install`, keeping
      0.2.0-beta.11 as the rollback. Done when `ethos status` reports the lane under the 0.2.0-beta.12 runtime.
- [ ] 1.3 Check both pipelines with `ethos lane project --check --json` under the 0.2.0-beta.12 runtime. Done when it
      reports both projections conforming.

## 2. Records

- [ ] 2.1 Drop the Windows line from the example in `openspec/config.yaml`. Done when no file of the repository's
      configuration names Windows.
- [ ] 2.2 Record the move under Changed in the Changelog. Done when `mise run check` passes.
