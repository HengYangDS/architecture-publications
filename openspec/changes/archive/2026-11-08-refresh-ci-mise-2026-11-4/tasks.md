## 1. Hosted supply

- [x] 1.1 Move `[supply] mise_version` to Mise 2026.11.4 and generate both pipelines again; done when `ethos lane project --check --json` reports both projections conforming. The check reports both projections conforming; only `.github/workflows/ci.yml` changed, at its Mise version.

## 2. Lock compatibility

- [x] 2.1 Read the tracked version-3 lock with the official Mise 2026.11.4 before landing; done when it lists the locked tools unchanged and the lock's bytes are unchanged. Mise 2026.11.4, whose macOS archive `d37c0138…` equals its API digest and `SHASUMS256.txt`, lists `http:ethos` 0.2.0-beta.6 and `node` 26.13.0 from the version-3 lock under `MISE_LOCKED=1` in an isolated environment, and the lock's bytes are unchanged.

## Workflow follow-up

- Archive this Change and prove the archived head once.
- Publish the archived head as a proposal to GitHub and GitLab, and wait for GitHub's `verify (macos-latest)` job and GitLab's macOS review job for that exact commit.
- Then land, close out, publish `dev` and `main` to GitHub and GitLab, observe the protected jobs on the landed head, and retire the proposal refs and the lane.
