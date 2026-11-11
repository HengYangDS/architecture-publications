## 1. Runtime

- [x] 1.1 Replace the 0.2.0-beta.7 declaration in `.config/mise/config.toml` with the one published
      with 0.2.0-beta.8, checked against the release's `SHA256SUMS` and asset digests, and lock it
      again with native `mise lock`; done when the lock holds 0.2.0-beta.8 for every platform it
      held 0.2.0-beta.7 for, no 0.2.0-beta.7 entry remains, the Node entries are unchanged and it
      keeps `lockfile_version = 3`. The release read back with all five platforms; the lock, written
      with the CI's Mise 2026.11.5, holds 0.2.0-beta.8 for the same six platform entries that held
      0.2.0-beta.7, keeps Node 26.13.0 unchanged and `lockfile_version = 3`, and has no 0.2.0-beta.7
      entry.
- [x] 1.2 Bind the repository family to the 0.2.0-beta.8 runtime with the locked console's
      `hook install`, keeping 0.2.0-beta.7 as the rollback; done when `ethos status` reports the
      lane ready under the 0.2.0-beta.8 runtime. The manifest of `CURRENT` names 0.2.0-beta.8 with
      source commit `9bf5bdda7` and that of `ROLLBACK` 0.2.0-beta.7; the paradigm repair reports
      `conforming`; status after the bind passes, dirty only by the lane's edits.
- [x] 1.3 Check both pipelines against the 0.2.0-beta.8 common model; done when
      `ethos lane project --check --json` reports both projections conforming. The check reports
      `conforming` under 0.2.0-beta.8, so the workflow does not change.
