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

[`guide/guide.archify.md`](guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It opens
with what ETHOS is for, who reaches it and what adoption writes, then follows
one change from a lane to every peer and a lane's life with its recoveries. It
shows what decides whether an effect runs, what one transition binds, the parts
that carry a change and where one full proof spends its time. It ends with the
evidence planes, why local proof is enough and when it is not, what every
repository shares, the principles behind the design and what is still open.
Each claim cites a line range at v0.2.0-alpha.28, and the diagrams the draft
names sit beside it. The proof's timings were measured on 2026-11-03, on
Architecture Publisher's own proof under this ETHOS release.

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

Checking the work needs an Architecture Publisher that delivers a guide as the
page; building the overview needs Typst 0.15.1 on the path.

[`source.json`](source.json) records the design and artwork preserved from
ETHOS `e60fec5` with their digests. They describe a retired publication
contract and are retained at the preservation commit it names, not kept as
current files.
