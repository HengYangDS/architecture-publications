# Contributing

This repository holds Architecture Models of systems it does not own. A contribution adds a work,
corrects a model or its README, or changes the input checks that guard them. The described
repositories gain nothing: no file, dependency or check of theirs changes.

## What a work holds

Each work is a folder under `publications/` with exactly:

- `model.json`, an Architecture Model in Architecture Publisher's format. It pins the described
  repository to a full commit, cites the files that support each component and relation by SHA-256,
  titles every view, and names this repository as its editor in `attribution`.
- `README.md`, which states what the model shows, the commit it pins, what it leaves out, and how to
  check and build it.
- An optional `source.json`, which records originals preserved from the described repository by
  their digests.

A model describes what the pinned source implements, not what its project plans. When the described
repository moves, a new pin is a change to the work, made and checked like any other.

## Check a model against its source

`npm test` checks the inputs alone: each work's members, the model format, the full revision, the
cited sources and their digests, the view titles and unique model ids. Before proposing a model
change, also check it with a checkout of the described repository:

```sh
archpub check publications/<work>/model.json --repo <checkout>
```

`check` verifies every cited source at the pinned revision without changing the checkout.

## Deliveries stay outside

`archpub build` writes a delivery under the ignored `build/` directory, and deliveries are never
committed here. Only the person reviewing a delivery accepts it with `archpub accept`, and only an
accepted delivery is published with `archpub publish`. An agent prepares builds; it does not accept
them.

## Local checks

`mise install --locked` installs the locked Node and ETHOS, and `mise run bootstrap` the locked npm
packages. `mise run check` runs the formatters' checks and the input tests, and `mise run fix`
applies the formatters: Prettier for Markdown, YAML, JSON and
JavaScript, and Taplo for TOML, configured under `.config/checks/`.

## Change through ETHOS

Every change follows an ETHOS Work Lane and an OpenSpec Change:

1. `ethos status --root . --json`, then start a lane and create the Change with the official
   OpenSpec CLI.
2. Obtain `ethos lane prewrite` admission for the exact paths before editing.
3. Commit the change; the Change's `tasks.md` is its only progress record.
4. Archive the Change, run `ethos prove --full --execute --json` on the archived head, then
   `ethos land` and close out.
5. `ethos publish` sends the accepted head to GitHub and GitLab, whose CI runs the same proof.

Write new prose in English, and keep each document within 500 lines that are not blank.
