# AIGW Client Projection

[`en/model.json`](en/model.json) is an Architecture Model of how AIGW turns one
reviewed configuration into guarded client files in every admitted client. It
pins `aigw-cli` at v0.7.0 (`9bf7612c9678d6fc02eade0eda637be1b450af87`), and its
components own all 245 production files of its coverage scope: `cmd/`,
`internal/`, the team file and `go.mod`. Twenty-one components, forty relations
and six views show the configuration and its owners, the admitted clients and
their seam, what a command reports, the program itself and one sync from plan
to compensation.

[`en/overview.typ`](en/overview.typ) is the work's overview page, composed with
Architecture Publisher's house class: the control plane projected into each
client, the transaction every projection is, and who owns what.

[`en/guide/guide.archify.md`](en/guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It opens
with who uses AIGW, how a team gets started and what its configuration holds,
then shows one sync as a guarded transaction, a newer edit that survives a
rollback and where a client's Token comes from. It ends with how much each
check proves, what happens to a provider's models over time, the parts that
keep the clients in step, why one guarded transaction, what AIGW leaves to
others, how it is released and what is still open. Each claim cites a line
range at v0.7.0, and the diagrams the draft names sit beside it.

Each component claims the directories and files its path rules name, and each
production file goes to its most specific claim. A relation is kept only when
a Go import backs it, and cites the importing package's files. The scope leaves
out the tests beside the code with `**/*_test.go` and their inputs, and the
repository's tools, CI and documentation. AIGW does not maintain this model,
and a built delivery is not an AIGW endorsement.

[`zh/`](zh/) holds the same files in Chinese, and [`concepts.md`](concepts.md)
fixes each term's Chinese rendering beside the file that defines it. Each
language is checked and built from its own directory.

```sh
archpub check publications/aigw-client/en/model.json --repo <aigw-cli checkout>
archpub build publications/aigw-client/en/model.json --repo <aigw-cli checkout> --out build/aigw-client/en
```

Checking and building the work needs Architecture Publisher 0.10.2 or later,
which reads model version 3, and building the edition needs Typst 0.15.1 on the
path.

[`source.json`](source.json) records the original claim model and edition
project with their digests. Both are retained at the preservation commit it
names and are verified there, not kept as current files.
