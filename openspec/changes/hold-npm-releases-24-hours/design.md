## Context

See [proposal.md](proposal.md). The owner set a 24-hour release age for every governed repository on
19 November 2026 and asked that each repository write it in its own configuration. This repository
declares Mise's age; npm, which installs its packages, reads its age from the user configuration of
whichever host runs it. filmkit 0.24.1 holds npm's age in a repository-owned file that Mise names
as npm's user configuration.

## Goals / Non-Goals

**Goals:**

- State this repository's npm release age in its own configuration, read by every npm that Mise
  runs here.

**Non-Goals:**

- An exemption list: npm resolves no package here that the owner maintains, so no release waits
  for its age.
- Changing any gate, check, publication, the Node or npm release or the lockfile.

## Decisions

- Use filmkit 0.24.1's form: `min-release-age=1` in `.config/npm/npmrc`, named by
  `NPM_CONFIG_USERCONFIG = "{{ config_root }}/.config/npm/npmrc"` under Mise's `[env]`, with
  `npm_config_userconfig = false` because npm reads environment names case-insensitively. A
  repository-owned file keeps the value in the repository, as the owner asked, and Mise's
  environment reaches every task and hosted job that runs npm through Mise.
- Inside the tree npm then reads no user configuration. The host's `~/.npmrc` holds `fund`,
  `prefix`, `update-notifier` and the age today (key names read on 20 November 2026); the
  repository's tasks run no global install, so `prefix` is unused here.

## Risks / Trade-offs

- [A hosted job runs npm outside Mise's environment] → The hosted jobs run the repository's verbs
  through Mise; the proposal's hosted runs qualify the change on both Forges before landing.
- [npm ignores an unknown key silently] → The lane reads `npm config get min-release-age` through
  Mise and requires `1`.

## Migration Plan

Add the file and the two lines, read npm's effective configuration, prove the archived head and
qualify it on both Forges' jobs; Archpub publishes it. To roll back, remove the file and the two
lines.
