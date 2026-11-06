## Context

See [proposal.md](proposal.md). The repository holds no secret and no private
address: every blob and commit message reachable from `dev` was scanned for
them before this Change. Each described repository is public on GitHub.

## Goals / Non-Goals

**Goals:**

- `dev` and `main` on both Forges at the accepted head, each verified by its own
  CI.

**Non-Goals:**

- Publishing deliveries. A delivery stays outside this repository, and a place
  for readers to find the works is separate work.
- Any change to a work.

## Decisions

- **GitLab's identity stays out of tracked files.** The owner decided that a
  private peer's host, port and path appear in no tracked content. Each clone
  keeps them in its Git configuration, `remote.gitlab.url` and
  `remote.gitlab.forgeRepository`, and `.ethos/release.toml` names only the
  remote. GitHub's address is public and stays in the declaration.
- **`main` mirrors `dev`, and nothing is tagged.** The works have no release
  cycle of their own, because each pins its repository's release. So
  `mirror = "accepted_ff"` keeps one accepted head, and the repository declares
  no release tags, version or change log.
- **mise owns the tools CI needs.** The lock names Node and the ETHOS console
  with their checksums. It is written in format 3, which the CI runners' mise
  2026.10.25 reads.
- **One macOS job on each Forge.** No input of a work depends on the platform.
  GitLab uses the project's two runners on the shared macOS guest, and GitHub
  uses `macos-latest`.
- **MIT.** All seven sibling repositories carry it.

## Risks / Trade-offs

- [The shared macOS guest is busy] → The job is short, runs one at a time and is
  announced to the other sessions before it starts.
