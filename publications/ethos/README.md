# ETHOS

[`model.json`](model.json) is an Architecture Model of how ETHOS turns
official intent and fresh facts into proven repository change, and what it
holds every repository to. It pins ETHOS at v0.2.0-alpha.28
(`424d325386784633839b1abf52a4ac394e412a76`) and cites all 455 files of its
coverage scope by SHA-256: the `src/ethos` package, `system/`, the npm launcher
in `distributions/npm/` and the repository's own `.ethos/` binding. Forty-one
components and eighty-five relations are drawn in eleven views: one change
from intent to the accepted branch, where a checkout stands, the plan, the
proof, what may mutate the repository, a Work Lane's life and the commits it
may make, publication to every peer, the structure every governed repository
shares, the runtime every hook runs and the surfaces that reach them.

[`overview.typ`](overview.typ) is the work's overview page, composed with
Architecture Publisher's house class: the repository's roles above one change,
the TransitionPlan every step is, and the structure every governed repository
shares.

Each component cites every file that ordered path rules attribute to it, so no
file in the scope is missed or cited twice. A relation is kept only when an
import in the source backs it, and cites the importing modules; relations are
imports and calls, not runtime order. The model leaves out the repository's
tests, tools, CI and documentation. ETHOS does not maintain this model, and a
built delivery is not an ETHOS endorsement.

```sh
archpub check publications/ethos/model.json --repo <ethos checkout>
archpub build publications/ethos/model.json --repo <ethos checkout> --out build/ethos
```

Building the overview needs Typst 0.15.1 on the path.

[`source.json`](source.json) records the design and artwork preserved from
ETHOS `e60fec5` with their digests. They describe a retired publication
contract and are retained at the preservation commit it names, not kept as
current files.
