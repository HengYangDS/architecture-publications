## 1. The input check

- [x] 1.1 Write the tests of the changed check first: a model that names `overview.typ` fails, and a work whose languages state overviews of different shapes fails with the first place that differs. Done when both fail on the unchanged check. Both tests fail on the unchanged check, each for the reason it names.
- [x] 1.2 Change `tools/verification/publication-inputs.mjs`: an `overview` is a statement, a Typst file beside a model fails, and a work's languages state one shape. Done when the tests of 1.1 pass. The tests of 1.1 pass, with the test of every work.

## 2. The statements

- [x] 2.1 State the overview in each of the twelve models and remove the twelve `overview.typ` files. Done when `mise run check` passes and each of the twelve models checks `ok` with Architecture Publisher 0.15.0. `mise run check` passes, and the released 0.15.0 built each of the twelve models into a delivery (07:43:37).
- [x] 2.2 Name the detail audit in Film Kit's statement in both languages, read by a reader other than the writer. Done when both Film Kit models check `ok`. Both Film Kit models name the detail audit and build with 0.15.0; the wording was read by a reader other than the writer on 2026-11-18.
- [ ] 2.3 Have a reader other than the writer read the six Chinese overview pages as the publisher set them, against the English at each place, and settle each finding at the source. Done when the findings are settled, the changed models build with Architecture Publisher 0.15.0 and a reader confirms the changed places.

## 3. The Architecture Publisher work

- [x] 3.1 Re-pin the work at v0.15.0 in both languages from the re-pin worklist: move the shifted citations, reread the touched ones and the listed components and relations, give each file new in scope an owner, make what the work says agree with the release, bring the history to the pin, and name the pin in the README, the term table and the scope. Done when both models verify with `--against v0.15.0`: every citation the same, nothing refused and no file in scope without an owner. Both models verify whole against `v0.15.0` with the released checker: every file in scope owned, every citation the same, nothing refused.
- [x] 3.2 Have a reader other than the writer read the Chinese the move added or changed and settle each finding at the source. Done when the findings are settled and both models still verify. Three readers' findings and a committee's wording are settled at the source (`repin-10/read/`, `committee-20261119-role/RECORD.md` in the publisher's work directory), and both models verify after them.

## 4. The words about the works

- [x] 4.1 Make each work's README, the repository's README and `CONTRIBUTING.md` say that the model states the overview and the publisher draws it, with 0.15.0 as the lowest version of the publisher. Done when no file of the repository names `overview.typ` as a part of a work. No README, term table or contributor's guide names `overview.typ` as a part of a work. It is still named by the test of its refusal, by the publisher's work where it says what 0.15.0 retired, and by the dated records under `questions/` and `trials/`, which describe the works as they were read then.
- [x] 4.2 Record the change under `Unreleased` in `CHANGELOG.md`. Done when `mise run check` passes. `mise run check` passes.
