# AIGW Client Projection

[`model.json`](model.json) is an Architecture Model of how AIGW turns one
reviewed configuration into guarded native projections in every admitted
client. It pins `aigw-cli` at v0.6.0
(`9c26591fb3efec088075a7ba18b6dae6d840eacf`) and cites all 210 production
files of its coverage scope by SHA-256: `cmd/`, `internal/`, the team manifest
and `go.mod`. Twenty-two components, forty-three relations and six views show
the configuration and its owners, the admitted clients and their seam, what a
command reports, the program itself and one projection from plan to
compensation.

[`overview.typ`](overview.typ) is the work's overview page, composed with
Architecture Publisher's house class: the control plane projected into each
client, the transaction every projection is, and who owns what.

Each component cites every production file that ordered path rules attribute
to it. A relation is kept only when a Go import backs it, and cites the
importing package's files. The scope leaves out the tests beside the code with
`**/*_test.go` and their inputs, and the repository's tools, CI and
documentation. AIGW does not maintain this model, and a built delivery is not
an AIGW endorsement.

```sh
archpub check publications/aigw-client/model.json --repo <aigw-cli checkout>
archpub build publications/aigw-client/model.json --repo <aigw-cli checkout> --out build/aigw-client
```

Checking the coverage scope needs an Architecture Publisher that reads a glob
in a coverage path; building the overview needs Typst 0.15.1 on the path.

[`source.json`](source.json) records the original claim model and edition
project with their digests. Both are retained at the preservation commit it
names and are verified there, not kept as current files.
