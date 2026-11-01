# Architecture Publications

Architecture models of selected systems, authored and published outside the
systems they describe. Each work under `publications/` is one Architecture
Model that Architecture Publisher (`archpub`) draws as posters and an
interactive map. The described repositories gain no files, dependencies or
diagram checks.

## Works

- [ETHOS](publications/ethos/README.md): how one repository change becomes a
  proven commit on the accepted branch.
- [AIGW Client Projection](publications/aigw-client/README.md): how operator
  intent becomes guarded native client projections.
- [Architecture Publisher](publications/architecture-publisher/README.md): how
  Architecture Publisher turns an architecture model into posters and a page.

A model pins the described repository to a full commit and cites the files that
support each component and relation by SHA-256. Its `attribution` names this
repository as the editor; a model or a delivery built from it is not an
endorsement by the described project.

## Building and publishing

Run the publisher with a checkout of the described repository. `check` verifies
every source at the pinned revision without changing the checkout; `build`
writes a new delivery under the ignored `build/` directory.

```sh
archpub check publications/ethos/model.json --repo ../ethos
archpub build publications/ethos/model.json --repo ../ethos --out build/ethos
archpub accept build/ethos --reviewer "<name>"
archpub publish build/ethos --to <root>
```

Only the person reviewing the delivery accepts it, and only an accepted
delivery is published. Deliveries are not committed here.

## Input checks

`npm test` checks that each work holds only its model, its README and an
optional `source.json`, that each model is in the publisher's format with a
full revision, cites at least one source, gives every source a digest and
titles every view, and that no two works share a model id. It does not run the publisher or a
described product; `archpub check --repo` is the full validation.

A `source.json` records originals preserved from a described repository: its
source revision and tree, the preservation commit and each member's digest.
Members with `storage: "git"` are read from that commit, so originals of a
retired input format stay verifiable without being current files.

`ethos prove --full --execute --json` runs the same tests through the native
ETHOS coverage and static-analysis providers, plus `npm run format:check`.

## Formatting

Run `npm run format:check` to check formatting and `npm run format:fix` to fix
it. Prettier formats the Markdown, YAML, JSON and JavaScript files and Taplo
the TOML files, both from the host's installation with their configuration
under `.config/checks/`.
