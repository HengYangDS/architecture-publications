## Context

See [proposal.md](proposal.md). ETHOS's paradigm keeps `VERSION` as the only version source of a
repository that declares release tags, reads a Keep a Changelog 1.1.0 file with bracketed headings,
and asks for a `LICENSE` grant linked from the README. This repository already grants the MIT
License and links it from its README, and its `package.json` declares no version.

## Goals / Non-Goals

**Goals:**

- Give the repository one version, `0.1.0`, a changelog in the shared grammar and declared `v*`
  release tags.

**Non-Goals:**

- Tagging a release or publishing a Forge release.
- Changing any work, model, guide, check or publication behaviour.

## Decisions

- Start at `0.1.0`. The repository holds content whose contract is the work formats, which change
  with Architecture Publisher's releases; a zero major marks a pre-release contract, as in the other
  governed repositories, and `1.0.0` would claim more stability than the content has.
- Follow Architecture Publisher's changelog header, which states that versions below `1.0.0` remain
  pre-release contracts and may contain incompatible changes.
- Record in `[0.1.0]` what the repository already holds, so the first version has a description.

## Risks / Trade-offs

- [The first tag lands on a later commit than this section's date] → The owner decides when to tag;
  the section's date and content are revised in that release's own change if needed.
