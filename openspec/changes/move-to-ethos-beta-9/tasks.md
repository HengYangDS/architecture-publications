## 1. Runtime

- [x] 1.1 Replace the 0.2.0-beta.8 declaration in `.config/mise/config.toml` with the one published
      with 0.2.0-beta.9, checked against the release's `SHA256SUMS` and asset digests, and lock it
      again with native `mise lock`; done when the lock holds 0.2.0-beta.9 for every platform it
      held 0.2.0-beta.8 for, no 0.2.0-beta.8 entry remains, the Node entries are unchanged and it
      keeps `lockfile_version = 3`.
- [x] 1.2 Bind the repository family to the 0.2.0-beta.9 runtime with the locked console's
      `hook install`, keeping 0.2.0-beta.8 as the rollback; done when `ethos status` reports the
      lane ready under the 0.2.0-beta.9 runtime.
- [x] 1.3 Check both pipelines against the 0.2.0-beta.9 common model; done when
      `ethos lane project --check --json` reports both projections conforming. The declaration's five platform checksums equal the release's `SHA256SUMS` and the asset digests; the lock, written with Mise 2026.11.7, which reproduces the 0.2.0-beta.8 lock byte for byte, holds 0.2.0-beta.9 for the same six platform entries, keeps Node 26.13.0 and `lockfile_version = 3`, and has no 0.2.0-beta.8 entry. `CURRENT` names the 0.2.0b9 runtime and `ROLLBACK` the 0.2.0-beta.8 one; status after the bind passes in the lane. The check reports `conforming` under 0.2.0-beta.9, so the workflow does not change.

## 2. ETHOS work

- [ ] 2.1 Re-pin the ETHOS work at v0.2.0-beta.9 in both languages: update the claims, relations and
      guide citations the worklist names, add beta.9 to the history and name the pin in the README,
      term table, scope and overview; done when `archpub check --repo` against v0.2.0-beta.9
      refuses nothing, leaves no file uncovered and finds every citation the same.

## 3. Record

- [ ] 3.1 Record the move under `Unreleased` in `CHANGELOG.md`; done when `mise run check` passes and
      both ETHOS pages build with Architecture Publisher 0.12.0.
