# Architecture Publisher

[`model.json`](model.json) is an Architecture Model of how Architecture
Publisher turns an architecture model into posters, a page and an overview. It
pins `architecture-publisher` at `97c2079a33d1772343593d6609145b5dd6d41358`,
and its components own all 55 files under `src/`, its coverage scope, each
claimed by name: twenty-five components, thirty-four relations and five views,
the overview from the editor through acceptance and publication, the checks,
the grid layout, the media and the LikeC4 import.

[`overview.typ`](overview.typ) is the work's overview page, composed with the
publisher's house class: the four owners of a build, the path one build takes
between them, and what each step refuses.

The model was read from the publisher package at that revision. Its relations
are calls between the selected modules, not every function, and it leaves out
the repository's quality tooling and CI. Until `009e84c` the model lived in
Architecture Publisher's own repository, under `editions/self/`. Architecture
Publisher does not maintain this model, and a built delivery is not an
endorsement by its project.

```sh
archpub check publications/architecture-publisher/model.json --repo <architecture-publisher checkout>
archpub build publications/architecture-publisher/model.json --repo <architecture-publisher checkout> --out build/architecture-publisher
```

Building the overview needs Typst 0.15.1 on the path.
