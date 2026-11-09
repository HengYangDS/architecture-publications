# Architecture Publications

Architecture models of selected systems, authored and published outside the
systems they describe. Each work under `publications/` is one Architecture
Model that Architecture Publisher (`archpub`) draws as a print edition and an
interactive page. The described repositories gain no files, dependencies or
diagram checks.

## Works

- [ETHOS](publications/ethos/README.md): how ETHOS turns official intent and
  fresh facts into proven repository change, and what it holds every
  repository to.
- [AIGW Client Projection](publications/aigw-client/README.md): how one
  reviewed configuration becomes guarded native projections in every client.
- [Architecture Publisher](publications/architecture-publisher/README.md): how
  Architecture Publisher turns an architecture model into a print edition and a
  page.
- [Data Department Work Guidelines](publications/ddwg/README.md): how the
  guidelines lead a reader to the rule that owns a task, and how a change to them
  is proposed, checked and released.
- [filmkit](publications/filmkit/README.md): how filmkit rebuilds a film's two
  editions from its tracked sources, and what holds each step to its inputs.
- [OpenAI Responses Proxy](publications/openai-responses-proxy/README.md): how
  the proxy makes a Codex Responses turn portable across third-party providers,
  and how it installs and keeps its own listener running.

Each work also holds its Chinese translation in `zh-CN/`: a `zh-CN` model of
the same architecture, with the work's id and revision, its overview and guide
in Chinese, and `concepts.md`, the table that fixes each term's rendering beside
the file that defines the term. Built with `archpub build`, it gives the work's
Chinese edition and page.

A model pins the described repository to a full commit. Each component claims
the directories and files it owns, and each relation names the files that
support it; the publisher reads them at that commit and records each file's
SHA-256 in the delivery's manifest. A model's `editors` name the people who
edited it; a model or a delivery built from it is not an endorsement by the
described project.

## Building and publishing

Run the publisher with a checkout of the described repository. `check` resolves
every claim and cited file at the pinned revision without changing the
checkout; `build` writes a new delivery under the ignored `build/` directory.
The works are model version 3 and every view carries a summary, which needs
Architecture Publisher 0.10.2 or later, and the print edition needs Typst
0.15.1 on the path. A work whose model
names an overview composition gets it in its edition, after the contents. A work whose model names a guide gets
that guide as its page, with every line range it cites checked at the pinned
revision.

```sh
archpub check publications/ethos/model.json --repo ../ethos
archpub build publications/ethos/model.json --repo ../ethos --out build/ethos
archpub accept build/ethos --reviewer "<name>"
archpub publish build/ethos --to <root>
```

Only the person reviewing the delivery accepts it, and only an accepted
delivery is published. Deliveries are not committed here.

## Input checks

`npm test` checks that each work holds only its model, its README, an optional
`source.json`, the overview composition its model names, the directory of
the guide it names and its translations. A translation holds its model, its
term table and the overview and guide it names, and its model must be in the
directory's locale and name the work's id and revision. It checks that each model is in the publisher's format with
a full revision, claims at least one file and titles every view, and that no
two works share a model id. It does not run the publisher or a described
product; `archpub check --repo` is the full validation.

A `source.json` records originals preserved from a described repository: its
source revision and tree, the preservation commit and each member's digest.
Members with `storage: "git"` are read from that commit, so originals of a
retired input format stay verifiable without being current files.

`ethos prove --full --execute --json` runs the same tests through the native
ETHOS coverage and static-analysis providers, plus `npm run format:check`.

## Formatting

Run `npm run format:check` to check formatting and `npm run format:fix` to fix
it. Prettier formats the Markdown, YAML, JSON and JavaScript files and Taplo
the TOML files, both locked by npm, with their configuration under
`.config/checks/`.

## License

The models, guides and tools are under the [MIT License](LICENSE).
