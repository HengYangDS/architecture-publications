## 1. One address

- [x] 1.1 Drop `repository.browse` from the twelve models of the six works. Done when no model states it and every model verifies. No model states `repository.browse`; every model verifies (`tests/publication-inputs.test.mjs` passes in the lane).
- [x] 1.2 Refuse a browse template beside a GitHub or GitLab address in the input check, with its test in `tests/publication-repository.test.mjs`, and make the custody fixture's git calls drop the caller's `GIT_*` variables. Done when the new test fails on the unchanged check and both test files pass. On the unchanged check the new test failed with a missing rejection (the maintainer's rehearsal, `pub-one-address/REPORT.md`); in the lane both files pass.

## 2. Nothing a reader sees changes

- [x] 2.1 Build the twelve editions with Architecture Publisher 0.17.0 at the lane's base and its head, with one `SOURCE_DATE_EPOCH`. Done when `archpub compare` lists no plate for any pair, and every file it lists carries the model or its digest. 12 of 12 pairs compare as allowed: no plate, and no listed file but the model, the data, the reader file, the edition and the manifest.

## 3. Record

- [x] 3.1 Say in `README.md` that a work needs Architecture Publisher 0.17.0 or later, and record the change in `CHANGELOG.md`. Done when `mise run check` passes. `README.md` names 0.17.0; `CHANGELOG.md` records the change; `mise run check` passes.

## 4. The owner's pronoun

- [x] 4.1 Say the owner's choices where ETHOS's `concepts.md` said `his`. Done when no `he`, `him` or `his` is left outside quotations in the works' and the repository's Markdown (archived Changes and released changelog sections aside) and `mise run check` passes. `concepts.md` says the owner's choices; no `he`, `him` or `his` is left outside quotations; `mise run check` passes.
