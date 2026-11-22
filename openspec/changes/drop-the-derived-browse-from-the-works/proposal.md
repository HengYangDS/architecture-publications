## Why

Each of the six works states its repository's address twice: `repository.url`, and `repository.browse`, the same
address without `.git` followed by `/blob/{revision}/{path}`, in all twelve models (Architecture Publisher's research
page `docs/research/one-source.md`, "A model's repository, in the published works"). Architecture Publisher 0.17.0
derives that template from a GitHub or GitLab address when a model states none (its Change
`derive-a-file-s-address-from-the-forge`), so the works can state the address once.

## What Changes

- The twelve models of the six works drop `repository.browse`. Each was the template its address implies (read on
  2026-11-21: 12 of 12).
- The input check refuses a model that states a browse template beside a GitHub or GitLab address; a work on another
  host may still state one.
- The new rule's test stands in `tests/publication-repository.test.mjs`, beside the input tests; the custody
  fixture's git calls drop the caller's `GIT_*` variables.
- A second commit: ETHOS's `concepts.md` called the owner he ("profile and checkout are his choices"); it says the
  owner's choices. The owner has stated no pronouns. The publisher reads no `concepts.md`, so no edition changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work on GitHub or GitLab states its address once.

## Impact

Changed: the twelve `publications/*/*/model.json`, `tools/verification/publication-inputs.mjs`,
`tests/publication-inputs.test.mjs`, `README.md` (the release a work needs: 0.17.0) and
`CHANGELOG.md`; in the second commit `publications/ethos/concepts.md`. New: `tests/publication-repository.test.mjs`. It needs Architecture Publisher 0.17.0 as the release the works are built
with: an earlier release gives a work without the template no links. Built with 0.17.0, a delivery's pages, images
and figures keep their bytes, since the manifest and the data record the template the address implies, the one each
work stated; the delivered model loses the line, and so do the files that carry it or its digest.
