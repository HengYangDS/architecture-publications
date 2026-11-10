## 1. Input check

- [x] 1.1 Write failing tests: a README not headed by the model's title or not naming the full revision, and a term table not headed `<title>: term renderings` or not naming the revision's first seven characters, are refused by name; verify they fail on the current check and that the test of the six works fails on their term tables.
- [x] 1.2 Check a work's README and term table in `verifyWork`, and give the six term tables that heading, an English introduction and their pins, citing the film repositories by public name at their releases; verify `npm test` passes and no table cites a path on a host.

## 2. Film Kit at v0.18.0

- [x] 2.1 Pin both models and their guide diagrams at v0.18.0 (`acc1eda`), move the 23 shifted citations, read the five touched ranges and the claims on the twelve modified files again, count 112 files in scope, and name the subject Film Kit in prose in both languages; verify `archpub check --repo` passes for both languages and `--against v0.18.0` moves nothing.
- [x] 2.2 Name Film Kit in the repository's list of works and record the changes under `[Unreleased]` in `CHANGELOG.md`; verify `mise run check` passes.
- [x] 2.3 Build both languages' edition and page of Film Kit with released Architecture Publisher 0.10.2; verify both build and read the masthead, the changed plates and the guide's changed passages in both languages.
