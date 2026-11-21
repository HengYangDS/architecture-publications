# Architecture Publisher

[`en/model.json`](en/model.json) is an Architecture Model of how Architecture
Publisher turns an architecture model into a print edition and a page. It pins
`architecture-publisher` at v0.16.0
(`c99145758b41fbcd8fdf02d4b20768d48e4b90ff`), and its components own all 90
files of its coverage scope: the publisher's source under `src/`, its
`package.json` and the manifests of its six vendored supplies. Thirty-three
components, fifty-five relations and six views show one build from the author
to a published delivery, the files bound at the pinned revision, where a model
comes from, the grid layout, the print edition and the page.

The model's `overview` states the work's overview page, and the publisher draws
it: the four owners of a build, the path one build takes between them to two
media, and what each step refuses.

[`en/guide/guide.archify.md`](en/guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It follows
one build: what a model holds, how each file finds its owner at the pinned
revision, which views are drawn and how one is laid out, how a view becomes a
page of the print edition and how a plate draws its parts as cards with the
strips of their files, how the page and the overview are made and checked,
what the manifest binds and how a delivery is accepted and published. It shows
the releases that brought the publisher here and ends with what moving the pin
changes. Each claim about the product cites a line range at v0.16.0, and the
diagrams the draft names sit beside it. The re-pin counts were measured on
2026-11-18, when this work moved from v0.14.0 to v0.15.0. Of the moves before
it, the move to v0.10.1
changed no claim, the move to v0.10.2 changed only what a reading too tall for
the body does, the move to v0.11.0 only where a plate sets its summary, and the
move to v0.12.0 only the command list and line ranges. The move to v0.13.1
rewrote what the work says of how a plate draws its parts, what the manifest
records and what acceptance writes; it gave `src/style.mjs` to the delivery
builder and drew one new relation, from acceptance to the print edition, which
sets the colophon page. The move to v0.14.0 added how a plate sets a part's
details and its key and how the engine measures the house faces; the two files
the release added fall to the plate composer, and its relation to the typefaces
cites one of them, `src/poster/spread.mjs`. The move to v0.15.0 replaced
`overview.typ`, the overview its author composed, with the statement in the
model, and rewrote what the work says of how a plate draws a part, what the
manifest holds and what a delivery carries. It gave `src/manifest.mjs` and
`src/projection.mjs` to the delivery builder and added two components, each
with one relation from the delivery builder: the measured facts, which own
`src/facts/`, and the data and reader file, which own `src/pinned/`. Eight
relations cite other modules than before, three of them
`src/poster/part.mjs`. The move to v0.16.0 added claims about each plate's
figure files, the edition's index, the images' default width and the single
Archify run that validates and writes a build's page. It added no
component and no relation; the delivery builder's relation to the print edition
also cites `src/manifest.mjs`, which now takes the edition's file names.

Each component claims the directories and files its path rules name, and each
file goes to its most specific claim, so every file in the scope has one owner;
the roles and outside systems claim none. A relation is kept only when an
import or a process call in the source backs it, and cites the modules that
make it; the shared refusal type and the child environment are not drawn. The
scope leaves out the vendored programs, fonts and artwork the supply manifests
list, and the repository's tests, tools, documentation, OpenSpec changes and
CI. Until `009e84c` the model lived in Architecture Publisher's own repository,
under `editions/self/`. Architecture Publisher does not maintain this model, and
a built delivery is not an endorsement by its project.

[`zh/`](zh/) holds the same files in Chinese, and [`concepts.md`](concepts.md)
fixes each term's Chinese rendering beside the file that defines it. Each
language is checked and built from its own directory.

```sh
archpub check publications/architecture-publisher/en/model.json --repo <architecture-publisher checkout>
archpub build publications/architecture-publisher/en/model.json --repo <architecture-publisher checkout> --out build/architecture-publisher/en
```

Checking and building the work needs Architecture Publisher 0.15.0 or later,
the first that reads an overview stated in the model, and building the edition
needs Typst 0.15.1 on the path.
