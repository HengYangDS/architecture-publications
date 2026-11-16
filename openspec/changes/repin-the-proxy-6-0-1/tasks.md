## 1. OpenAI Responses Proxy

- [x] 1.1 Re-pin the proxy at v6.0.1 in both languages from the re-pin worklist: move the 29 shifted citations, reread the 2 touched ones and the 5 listed components and 17 relations, make what the work says of a response's end, of the log and of a client's close agree with 6.0.1, add the release to the history, and name the pin in the README, term table and scope. Done when `archpub check --repo` with `--against v6.0.1` lists every citation the same and nothing refused or uncovered, for both models. Both models verify at v6.0.1 with 177 citations the same and nothing refused or uncovered (the worklist's 174 and three new ones). The two touched citations keep their sentences: `code-gate` now ends at line 340 and `code-transport-error` at 478. One detail of `response-delivery` says that a JSON response's ending is reported too; the guide's paragraph on the log says that every admitted response's ending is named; the row on an expired deadline is unchanged, because the release's entry is about a write to the client that times out.

## 2. Record

- [ ] 2.1 Record the re-pin under `Unreleased` in `CHANGELOG.md`. Done when `mise run check` passes.
