## 1. Runtime

- [x] 1.1 Replace the 0.2.0-beta.4 declaration in `.config/mise/config.toml` with the one published with 0.2.0-beta.5, checked against the release's `SHA256SUMS` and asset digests, and lock it again with native `mise lock` from Mise 2026.10.25; done when the lock holds 0.2.0-beta.5 for every platform it held 0.2.0-beta.4 for, no 0.2.0-beta.4 entry remains, the Node entries are unchanged and `lockfile_version` stays 3. The release read back with all five platforms, each declaration checksum equal to `SHA256SUMS` and to the asset digest. The official Mise 2026.10.25 binary, whose digest equals its release asset, wrote the lock: it holds 0.2.0-beta.5 for the same six platforms as before, each checksum equal to `SHA256SUMS`, with no 0.2.0-beta.4 entry, identical Node entries and `lockfile_version = 3`.
- [x] 1.2 Bind the repository family to the 0.2.0-beta.5 runtime with the locked console's `hook install`, keeping 0.2.0-beta.4 as the rollback; done when `ethos status` reports the lane ready under the 0.2.0-beta.5 runtime. The locked console reports 0.2.0-beta.5 (`da5b278057c9`, OpenSpec 1.16.0), and `hook install` binds the family to runtime `a4492b26ceca` with rollback `188a01e193d0` (0.2.0-beta.4). `status` passes; the lane is dirty only with this Change's edits.

## Workflow follow-up

- Archive this Change and prove the archived head once.
- Publish the archived head as a proposal to GitHub and GitLab, and wait for GitHub's `verify (macos-latest)` job and GitLab's macOS review job for that exact commit.
- Then land, close out, publish `dev` and `main` to GitHub and GitLab, observe the protected jobs on the landed head, and retire the proposal refs and the lane.
