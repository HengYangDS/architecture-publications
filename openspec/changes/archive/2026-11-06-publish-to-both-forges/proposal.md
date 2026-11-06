## Why

The works have stood on one local branch since the repository began. The GitHub
repository and the GitLab project created for them on 5 November are empty, and
on 6 November the owner asked that the works reach both Forges.

## What Changes

- GitHub and GitLab become the repository's publication peers, and `main` mirrors
  `dev`.
- mise locks Node and the ETHOS release, so CI installs what the local proof
  runs on.
- ETHOS projects one verification into GitHub Actions and GitLab CI.
- The repository gains the MIT License its sibling repositories carry, because
  it becomes public.
- The contributing guide and the README stop saying the repository has no Forge
  and that the formatters come from the host.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

`.ethos/release.toml`, `.config/mise/`, `.config/ci/`,
`.config/checks/ci-projection/`, `.github/workflows/ci.yml`, `.gitlab-ci.yml`,
`LICENSE`, `README.md` and `CONTRIBUTING.md`. No work changes.
