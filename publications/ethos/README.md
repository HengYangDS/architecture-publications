# ETHOS

[`en/model.json`](en/model.json) is an Architecture Model of how ETHOS turns
official intent and fresh facts into proven repository change, and what it
holds every repository to. It pins ETHOS at v0.2.0-beta.9
(`999784081fa3de9a97879ac17862f425b8120437`), and its components own all 515
files of its coverage scope: the `src/ethos` package, `system/` and the
repository's own `.ethos/` binding.
Forty-two components and ninety relations are drawn in eleven views: one
change from intent to the accepted branch, where a checkout stands, the plan,
the proof, what may mutate the repository, a Work Lane's life and the commits
it may make, publication to every peer, the structure every governed
repository shares, the runtime every hook runs and the surfaces that reach
them.

[`en/overview.typ`](en/overview.typ) is the work's overview page, composed with
Architecture Publisher's house class: the repository's roles above one change,
the TransitionPlan every step is, and the structure every governed repository
shares.

[`en/guide/guide.archify.md`](en/guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It opens
with what ETHOS is for, who reaches it and what adoption writes, then follows
one change from a lane to every peer and a lane's life with its recoveries. It
shows what decides whether an effect runs, what one transition binds, the parts
that carry a change and where one full proof spends its time. It ends with the
evidence planes, why local proof is enough and when it is not, what every
repository shares, the principles behind the design and what is still open.
Each claim cites a line range at v0.2.0-beta.9, and the diagrams the draft
names sit beside it. The proof's timings were measured on 2026-11-08, on
Architecture Publisher's own proof under ETHOS v0.2.0-beta.6.

Each component claims the directories and files its path rules name, and each
file goes to its most specific claim, so every file in the scope has one owner.
The outside systems claim none; the relations that reach Git, the OpenSpec
CLI, the native tools and the Forges cite the files that make the call. A
relation is kept only when an import in the source backs it, and cites the
importing modules; relations are imports and calls, not runtime order. The
model leaves out the repository's tests, tools, CI and documentation. ETHOS
does not maintain this model, and a built delivery is not an ETHOS endorsement.

[`zh/`](zh/) holds the same files in Chinese, and [`concepts.md`](concepts.md)
fixes each term's Chinese rendering beside the file that defines it. Each
language is checked and built from its own directory.

```sh
archpub check publications/ethos/en/model.json --repo <ethos checkout>
archpub build publications/ethos/en/model.json --repo <ethos checkout> --out build/ethos/en
```

Checking and building the work needs Architecture Publisher 0.10.2 or later,
which reads model version 3, and building the edition needs Typst 0.15.1 on the
path.

[`source.json`](source.json) records the design and artwork preserved from
ETHOS `e60fec5` with their digests. They describe a retired publication
contract and are retained at the preservation commit it names, not kept as
current files.
