# ETHOS

[`model.json`](model.json) is an Architecture Model of how ETHOS carries one
repository change from official intent to a proven commit on the accepted
branch. It pins ETHOS at `ad9108d70cc6a974eaf9271d06ccf5c7e8f33152` and cites
65 source files by SHA-256: twenty components, twenty-six relations and four
views, the overview and the intent and plan, proof and hook mechanisms.

The model was read from the implemented command plane in `src/ethos`. Each
component is one responsibility and cites the modules that implement it; a
command is a detail of the step it runs. Relations are imports and calls in the
source, not runtime order. The model leaves out the MCP server, lane handoff,
signature and paradigm repair, and `land --release`. ETHOS does not maintain
this model, and a built delivery is not an ETHOS endorsement.

```sh
archpub check publications/ethos/model.json --repo <ethos checkout>
archpub build publications/ethos/model.json --repo <ethos checkout> --out build/ethos
```

[`source.json`](source.json) records the design and artwork preserved from
ETHOS `e60fec5` with their digests. They describe a retired publication
contract and are retained at the preservation commit it names, not kept as
current files.
