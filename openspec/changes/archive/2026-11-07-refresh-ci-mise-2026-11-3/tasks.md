## 1. Hosted supply

- [x] 1.1 Move `[supply] mise_version` to Mise 2026.11.3 and generate both pipelines again; done when `ethos lane project --check --json` reports both projections conforming. The check reports both projections conforming; only `.github/workflows/ci.yml` changed, at its Mise version.

## Workflow follow-up

- Archive this Change and prove the archived head once.
- Publish the archived head as a proposal to GitHub and GitLab, and wait for GitHub's `verify (macos-latest)` job and GitLab's macOS review job for that exact commit.
- Then land, close out, publish `dev` and `main` to GitHub and GitLab, observe the protected jobs on the landed head, and retire the proposal refs and the lane.
