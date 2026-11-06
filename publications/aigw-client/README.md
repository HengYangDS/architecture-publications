# AIGW Client Projection

[`model.json`](model.json) is an Architecture Model of how AIGW turns one
reviewed configuration into guarded native projections in every admitted
client. It pins `aigw-cli` at v0.6.1
(`abf05858f4092a3baf9acea0d5d7488b26898aa5`), and its components own all 208
production files of its coverage scope: `cmd/`, `internal/`, the team manifest
and `go.mod`. Twenty-two components, forty-three relations and six views show
the configuration and its owners, the admitted clients and their seam, what a
command reports, the program itself and one projection from plan to
compensation.

[`overview.typ`](overview.typ) is the work's overview page, composed with
Architecture Publisher's house class: the control plane projected into each
client, the transaction every projection is, and who owns what.

[`guide/guide.archify.md`](guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It opens
with who uses AIGW, how a team gets started and what its configuration holds,
then shows one sync as a guarded transaction, a newer edit that survives a
rollback and where a client's Token comes from. It ends with how much each
check proves, how a provider's model becomes a Route, the parts that keep the
clients in step, why one guarded transaction, what AIGW leaves to others, how
it is released and what is still open. Each claim cites a line range at
v0.6.1, and the diagrams the draft names sit beside it.

Each component claims the directories and files its path rules name, and each
production file goes to its most specific claim. A relation is kept only when
a Go import backs it, and cites the importing package's files. The scope leaves
out the tests beside the code with `**/*_test.go` and their inputs, and the
repository's tools, CI and documentation. AIGW does not maintain this model,
and a built delivery is not an AIGW endorsement.

```sh
archpub check publications/aigw-client/model.json --repo <aigw-cli checkout>
archpub build publications/aigw-client/model.json --repo <aigw-cli checkout> --out build/aigw-client
```

Checking the work needs an Architecture Publisher that reads model version 2
and a glob in a coverage path and delivers a guide as the page; building the
overview needs Typst 0.15.1 on the path.

[`source.json`](source.json) records the original claim model and edition
project with their digests. Both are retained at the preservation commit it
names and are verified there, not kept as current files.
