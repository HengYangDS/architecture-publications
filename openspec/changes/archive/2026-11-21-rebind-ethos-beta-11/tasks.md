## 1. Runtime

- [x] 1.1 Replace the 0.2.0-beta.10 declaration in `.config/mise/config.toml` with the one published
      with 0.2.0-beta.11, checked against the release's `SHA256SUMS` and asset digests, and lock it
      again with native `mise lock`; done when the lock holds 0.2.0-beta.11 for every platform it
      held 0.2.0-beta.10 for, no 0.2.0-beta.10 entry remains and it keeps `lockfile_version = 3`.
      The release's declaration (sha256 `af619718…`) replaced the table and its comment; `mise lock`
      kept `lockfile_version = 3`, changed only `http:ethos`, and holds 0.2.0-beta.11 for the same
      platform entries, each checksum equal to `SHA256SUMS`.
- [x] 1.2 Bind the repository family to the 0.2.0-beta.11 runtime with the locked console's
      `hook install`, keeping 0.2.0-beta.10 as the rollback; done when `ethos status` reports the
      lane ready under the 0.2.0-beta.11 runtime. CURRENT names the 0.2.0-beta.11 runtime
      `8c663b10…` and ROLLBACK the 0.2.0-beta.10 runtime `526c2eba…`; with this Change named,
      `ethos status` reports the lane ready.
- [x] 1.3 Regenerate both pipelines with `ethos lane project --apply` after the bind; done when
      `ethos lane project --check --json` reports both projections conforming and the change adds
      only the 14-day retention lines. The applied preview added one `retention-days: 14` line to
      the GitHub workflow and two `expire_in: 14 days` lines to the GitLab pipeline, and the check
      reports both projections conforming.
- [x] 1.4 Name 0.2.0-beta.11 in the Changelog line about the checks' ETHOS release; done when the
      repository check passes. The Changelog line names ETHOS 0.2.0-beta.11 and the 14-day
      retention; `mise run check` exits 0.

## Workflow follow-up

- Archive this Change and prove the archived head once.
- Publish the proposal, wait for both forges' review jobs, land, publish `dev` and `main`, and read
  the protected jobs back; then retire the lane.
