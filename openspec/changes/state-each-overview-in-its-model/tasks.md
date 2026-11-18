## 1. The input check

- [ ] 1.1 Write the tests of the changed check first: a model that names `overview.typ` fails, and a work whose languages state overviews of different shapes fails with the first place that differs. Done when both fail on the unchanged check.
- [ ] 1.2 Change `tools/verification/publication-inputs.mjs`: an `overview` is a statement, a Typst file beside a model fails, and a work's languages state one shape. Done when the tests of 1.1 pass.

## 2. The statements

- [ ] 2.1 State the overview in each of the twelve models and remove the twelve `overview.typ` files. Done when `mise run check` passes and each of the twelve models checks `ok` with Architecture Publisher 0.15.0.
- [ ] 2.2 Name the detail audit in Film Kit's statement in both languages, read by a reader other than the writer. Done when both Film Kit models check `ok`.

## 3. The Architecture Publisher work

- [ ] 3.1 Re-pin the work at v0.15.0 in both languages from the re-pin worklist: move the shifted citations, reread the touched ones and the listed components and relations, give each file new in scope an owner, make what the work says agree with the release, bring the history to the pin, and name the pin in the README, the term table and the scope. Done when both models verify with `--against v0.15.0`: every citation the same, nothing refused and no file in scope without an owner.
- [ ] 3.2 Have a reader other than the writer read the Chinese the move added or changed and settle each finding at the source. Done when the findings are settled and both models still verify.

## 4. The words about the works

- [ ] 4.1 Make each work's README, the repository's README and `CONTRIBUTING.md` say that the model states the overview and the publisher draws it, with 0.15.0 as the lowest version of the publisher. Done when no file of the repository names `overview.typ` as a part of a work.
- [ ] 4.2 Record the change under `Unreleased` in `CHANGELOG.md`. Done when `mise run check` passes.
