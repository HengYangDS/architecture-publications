## 1. Runtime

- [x] 1.1 Replace the 0.2.0-beta.9 declaration in `.config/mise/config.toml` with the one published
      with 0.2.0-beta.10, checked against the release's `SHA256SUMS` and asset digests, and lock it
      again with native `mise lock`; done when the lock holds 0.2.0-beta.10 for every platform it
      held 0.2.0-beta.9 for, no 0.2.0-beta.9 entry remains and it keeps `lockfile_version = 3`. The
      declaration is the release's own file (`sha256:2163ceaa…`), read back against `SHA256SUMS` and
      the asset digests; the lock holds 0.2.0-beta.10 for the same five platforms, holds no
      0.2.0-beta.9 entry and keeps `lockfile_version = 3`.
- [x] 1.2 Bind the repository family to the 0.2.0-beta.10 runtime with the locked console's
      `hook install`, keeping 0.2.0-beta.9 as the rollback; done when `ethos status` reports pass in
      the lane under the 0.2.0-beta.10 runtime. CURRENT names the 0.2.0-beta.10 runtime
      `526c2ebafeba` and ROLLBACK the 0.2.0-beta.9 runtime `9427601ab2b1`; `ethos status` reports
      pass in the lane, and the paradigm repair preview reports it conforming.
- [x] 1.3 Name 0.2.0-beta.10 in the Changelog line about the checks' ETHOS release; done when the
      repository check passes. The Changelog line names 0.2.0-beta.10; `mise run check` passes with
      12 tests, and the format check and the `markdown-lint`, `prose`, `openspec`, `config-quality`
      and `docs-registry` gates pass.

## 2. Hosted Mise

- [x] 2.1 Move `[supply] mise_version` to Mise 2026.11.8 and generate the pipelines again; done when
      `ethos lane project --check --json` reports both projections conforming. One occurrence moved
      in `.config/ci/verification.toml`; the generated GitHub workflow takes Mise 2026.11.8, the
      GitLab pipeline is unchanged, and the check reports both projections conforming. The lock was
      written and read with Mise 2026.11.8.
