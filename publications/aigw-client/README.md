# AIGW Client Projection

[`model.json`](model.json) is an Architecture Model of how AIGW turns operator
intent into guarded native client projections. It pins `aigw-cli` at
`ed9f0fd54c5c768e21df10354234d1646b683297` and cites 14 source files by
SHA-256: twelve components, eleven relations and four views, the overview and
the authority, Adapter and transaction mechanisms.

The model was converted from the Client Projection claim model of `aigw-cli`
`e2eca41`. Its claims were checked again against every source that changed
before the current pin. It covers selected control-plane owners, not the whole
product or release approval. AIGW does not maintain this model, and a built
delivery is not an AIGW endorsement.

```sh
archpub check publications/aigw-client/model.json --repo <aigw-cli checkout>
archpub build publications/aigw-client/model.json --repo <aigw-cli checkout> --out build/aigw-client
```

[`source.json`](source.json) records the original claim model and edition
project with their digests. Both are retained at the preservation commit it
names and are verified there, not kept as current files.
