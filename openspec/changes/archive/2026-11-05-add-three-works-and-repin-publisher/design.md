## Context

See [proposal.md](proposal.md). A work is one Architecture Model with its
README, an optional overview composition and an optional guide directory; the
input check admits nothing else. Architecture Publisher 0.8.0 resolves each
model's claims at its pinned revision and checks a guide's cited lines there.

## Goals / Non-Goals

**Goals:**

- Each work describes its repository as released, with every file of its scope
  owned and every guide claim cited.

**Non-Goals:**

- Re-pinning the ETHOS work before ETHOS publishes its beta.
- Accepting or publishing deliveries; that stays with the owner.

## Decisions

- **Pin at the latest release.** The owner chose releases over development
  heads: a release is the version people run, and it does not move under the
  work.
- **A scope without `include`.** The DDWG, filmkit and proxy works take the
  whole repository and exclude tests, tools, change history and the rest by
  path, each with its reason. The publisher ignores an exclusion outside an
  `include` list, so this is the only form in which every left-out file carries
  its reason in the model.
- **Every guide diagram fits its panel.** At 1440 × 900 the reader shows a
  notice instead of a diagram too wide for its panel. Each guide is written so
  every preview fits, as the ETHOS and AIGW guides do.
- **Drafting notes stay out.** The evidence behind each claim and relation is
  in the cited files at the pinned revision; the input check admits no other
  file.
- **ETHOS waits for its beta.** Its guide's waterfall is one measured proof, so
  the work is re-pinned with the ETHOS release whose proof it shows.

## Risks / Trade-offs

- [The pinned releases age as the repositories move] → For each work,
  `archpub check --against` reports what a re-pin would change.
