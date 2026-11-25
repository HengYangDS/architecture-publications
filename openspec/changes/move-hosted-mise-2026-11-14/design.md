## Context

See [proposal.md](proposal.md). `.config/ci/verification.toml` holds the hosted GitHub job's Mise
release, and ETHOS's common model generates the pipelines from it. The GitLab jobs run the CI macOS
guest's own Mise, which moved to 2026.11.14 on 26 November 2026 at 05:50, so this Change moves the
GitHub job to the release the GitLab jobs already run. The releases from 2026.11.12 to 2026.11.14
add opt-in features (`mise audit`, `mise upgrade --vulnerable`, a per-tool `bump` option, global
task filters in `mise run`, a sandbox for cached tasks on Linux) and change no default that the
hosted jobs use. Three of their fixes and changes touch what the jobs do:

- 2026.11.12 records platforms that a tool has no build for in a new `unsupported_platforms` list
  of `mise.lock`, and `mise lock --check` then passes for them; the lock format version is
  unchanged. The earlier moves named one such problem, `http:ethos` on macos-x64.
- 2026.11.13 stops the config search at a ceiling path that goes through a symlink; the GitLab
  jobs set `MISE_CEILING_PATHS` to the directory above the checkout.
- 2026.11.14 refuses an invalid `#MISE` header of a file task; no tracked file holds such a header.

## Goals / Non-Goals

**Goals:**

- Install Mise 2026.11.14 in the hosted GitHub job, as the GitLab jobs already do.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration or tool release.
- Changing the lockfile; no step runs `mise lock`, so the new `unsupported_platforms` list is not
  written.
- Raising the Mise floor, which states the oldest Mise that reads this configuration.

## Decisions

- Move only `[supply] mise_version` and the line the projection writes from it; ETHOS's projection
  check then holds the workflow to the model. The Change takes a lane of its own, so that one proof
  and one pair of hosted runs cover it.

## Risks / Trade-offs

- [Mise 2026.11.14 changes the hosted bootstrap] → The proposal's hosted runs on both Forges qualify
  it before landing; restoring the earlier parameter rolls it back.
- [The lock check reads the tracked lock differently] → Task 2.1 runs it with 2026.11.14 before the
  proof and records what it names.
