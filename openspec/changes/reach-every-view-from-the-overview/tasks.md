## 1. The views and the rule

- [x] 1.1 Name the four views on their works' overviews in both languages: ETHOS's station Status and its runtime block, AIGW Client's operator block and Film Kit's step Package. Done when the six models verify and differ from the base only there. The six models verify in the lane, edited only at the station, the block and the two views' elements (apply.py checks each against the intended model).
- [x] 1.2 Make the input check refuse a view its overview names nowhere, with its test in `tests/publication-overview.test.mjs`, the shared model, directory and writer in `tests/fixtures/works.mjs`, and `npm test` running every test file. Done when the new test fails on a model that leaves a view unnamed and `npm test` passes. `tests/publication-overview.test.mjs` refuses a model that leaves a view unnamed; `npm test` runs every test file and passes; `.gitattributes` names the fixture tooling, so the proof takes no test for one that no command runs.

## 2. The editions

- [x] 2.1 Build the six editions with Architecture Publisher 0.16.0 from the base and from the lane, and measure them. Done when every build passes, none reports `overview_view_unreached`, and the line measures read as at the base. Twelve builds with Architecture Publisher 0.16.0: no head build reports an unreached view, and the line measures read as at the base (run/measure-work/summary.txt of the work directory).

## 3. Record

- [x] 3.1 Record the change in `CHANGELOG.md`. Done when `mise run check` passes. `CHANGELOG.md` records the change; `mise run check` passes.
