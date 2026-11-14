## 1. AIGW

- [ ] 1.1 Re-pin AIGW at v0.7.1 in both languages from the re-pin worklist: move the 15 shifted citations, reread the touched one and the 7 listed components and 14 relations, describe what 0.7.1 changes in setup and check, add the release to the history where the history's rule admits it, and name the pin in the README, term table and scope. Done when `archpub check --repo` with `--against v0.7.1` lists every citation the same and nothing refused or uncovered, for both models.

## 2. OpenAI Responses Proxy

- [ ] 2.1 Re-pin the Responses proxy at v5.1.12 in both languages from the re-pin worklist: move the 20 shifted citations, reread the 3 touched ones and the 2 listed components and 5 relations, describe how a stream that ends with an `error` event is ended and reported and what `--port` and `--timeout-seconds` refuse, add 5.1.11 and 5.1.12 to the history where the history's rule admits them, and name the pin in the README, term table and scope. Done when `archpub check --repo` with `--against v5.1.12` lists every citation the same and nothing refused or uncovered, for both models.

## 3. Record

- [ ] 3.1 Record both re-pins under `Unreleased` in `CHANGELOG.md`. Done when `mise run check` passes and both works' models build their pages with Architecture Publisher 0.14.0 without a warning.
