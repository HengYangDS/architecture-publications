## 1. Forges

- [ ] 1.1 Declare GitHub and GitLab as publication peers with `main` mirroring `dev`, and no GitLab address in a tracked file; verify `ethos publish` reports a valid topology.
- [ ] 1.2 Lock Node 26.13.0 and ETHOS 0.2.0-beta.4 through mise; verify `mise install --locked` with the runners' mise 2026.10.25 installs both on a fresh store.
- [ ] 1.3 Project the verification into GitHub Actions and GitLab CI; verify `ethos lane project --check` reports no drift.

## 2. Documents

- [ ] 2.1 Add the MIT License and correct the contributing guide and the README; verify `npm run check` passes and no document says the repository has no Forge.
