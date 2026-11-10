## Context

See [proposal.md](proposal.md). `.config/ci/verification.toml` holds the hosted jobs' Mise release,
and ETHOS's common model generates both pipelines from it. GitHub's macOS job installs Mise through
`jdx/mise-action` with that version; GitLab's macOS runner uses the Mise its guest provides.

Mise 2026.11.5 adds `mise dot files` and `status.show_env_ignore`, and fixes relative paths in
`mise dot` commands, a missing note when dot files are saved by hand, and 401 errors caused by stale
`~/.netrc` credentials. None of these reaches the bootstrap, the lock or the tools this repository
declares. An existing lockfile keeps its version until `mise lock --upgrade`.

## Goals / Non-Goals

**Goals:**

- Install Mise 2026.11.5 in the hosted job that bootstraps Mise.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration or the Node release.
- Changing the lockfile format; no step runs `mise lock --upgrade`.
- The Mise that GitLab's macOS runner provides, which its guest owns.
- Raising the Mise floor, which states the oldest Mise that reads this configuration.

## Decisions

- Move only `[supply] mise_version`, and let the native projection regenerate the workflow.
- Leave `jdx/mise-action` as the installed common model pins it; that pin moves with an ETHOS
  release.

## Risks / Trade-offs

- [Mise 2026.11.5 changes the hosted bootstrap] → The proposal's hosted runs on both Forges qualify
  it before landing; restoring the 2026.11.4 parameter rolls it back.

## Migration Plan

Move the Mise parameter, generate both pipelines, prove the archived head and qualify it on GitHub's
and GitLab's macOS jobs. To roll back, restore the 2026.11.4 parameter.
