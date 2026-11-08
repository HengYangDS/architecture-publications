# Architecture Publisher

[`model.json`](model.json) is an Architecture Model of how Architecture
Publisher turns an architecture model into a print edition and a page. It pins
`architecture-publisher` at v0.10.1
(`1861b7ccbb6d57378d3e5f69ffc328579eec991b`), and its components own all 64
files of its coverage scope: the publisher's source under `src/`, its
`package.json` and the manifests of its six vendored supplies. Thirty-one
components, fifty-two relations and six views show one build from the author
to a published delivery, the files bound at the pinned revision, where a model
comes from, the grid layout, the print edition and the page.

[`overview.typ`](overview.typ) is the work's overview page, composed with the
publisher's house class: the four owners of a build, the path one build takes
between them to two media, and what each step refuses.

[`guide/guide.archify.md`](guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It follows
one build: what a model holds, how each file finds its owner at the pinned
revision, which views are drawn and how one is laid out, how a view becomes a
page of the print edition, how the page and the overview are made and checked,
what the manifest binds and how a delivery is accepted and published. It ends
with what moving the pin changes. Each claim about the product cites a line
range at v0.10.1, and the diagrams the draft names sit beside it. The re-pin
counts were measured on 2026-11-08, when this work moved from v0.9.0 to v0.10.0;
the move to v0.10.1 changed no claim.

Each component claims the directories and files its path rules name, and each
file goes to its most specific claim, so every file in the scope has one owner;
the people and outside systems claim none. A relation is kept only when an
import or a process call in the source backs it, and cites the modules that
make it; the shared refusal type and the child environment are not drawn. The
scope leaves out the vendored programs, fonts and artwork the supply manifests
list, and the repository's tests, tools, documentation, OpenSpec changes and
CI. Until `009e84c` the model lived in Architecture Publisher's own repository,
under `editions/self/`. Architecture Publisher does not maintain this model, and
a built delivery is not an endorsement by its project.

```sh
archpub check publications/architecture-publisher/model.json --repo <architecture-publisher checkout>
archpub build publications/architecture-publisher/model.json --repo <architecture-publisher checkout> --out build/architecture-publisher
```

Checking and building the work needs Architecture Publisher 0.10.0 or later,
which reads model version 3, and building the edition needs Typst 0.15.1 on the
path.
