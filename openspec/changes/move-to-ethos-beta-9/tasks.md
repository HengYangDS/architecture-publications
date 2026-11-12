## 1. Runtime

- [ ] 1.1 Replace the 0.2.0-beta.8 declaration in `.config/mise/config.toml` with the one published
      with 0.2.0-beta.9, checked against the release's `SHA256SUMS` and asset digests, and lock it
      again with native `mise lock`; done when the lock holds 0.2.0-beta.9 for every platform it
      held 0.2.0-beta.8 for, no 0.2.0-beta.8 entry remains, the Node entries are unchanged and it
      keeps `lockfile_version = 3`.
- [ ] 1.2 Bind the repository family to the 0.2.0-beta.9 runtime with the locked console's
      `hook install`, keeping 0.2.0-beta.8 as the rollback; done when `ethos status` reports the
      lane ready under the 0.2.0-beta.9 runtime.
- [ ] 1.3 Check both pipelines against the 0.2.0-beta.9 common model; done when
      `ethos lane project --check --json` reports both projections conforming.

## 2. ETHOS work

- [ ] 2.1 Re-pin the ETHOS work at v0.2.0-beta.9 in both languages: update the claims, relations and
      guide citations the worklist names, add beta.9 to the history and name the pin in the README,
      term table, scope and overview; done when `archpub check --repo` with `--against
    v0.2.0-beta.9` refuses nothing, leaves no file uncovered and finds every citation the same.

## 3. Record

- [ ] 3.1 Record the move under `Unreleased` in `CHANGELOG.md`; done when `mise run check` passes and
      both ETHOS pages build with Architecture Publisher 0.12.0.
