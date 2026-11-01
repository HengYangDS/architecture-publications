# Architecture Publisher

[`model.json`](model.json) is an Architecture Model of how Architecture
Publisher turns an architecture model into posters and a page. It pins
`architecture-publisher` at `3bf75fdd078164c45437a0252f26b5e98e643677` and cites
27 source files by SHA-256: twenty-two components, twenty-eight relations and
three views, the overview from the editor through acceptance and publication,
the grid layout and the media.

The model was read from the publisher package and its vendored supplies at that
revision. Its relations are calls between the selected modules, not every
function, and it leaves out the repository's quality tooling and CI. Until
`009e84c` the model lived in Architecture Publisher's own repository, under
`editions/self/`. Architecture Publisher does not maintain this model, and a
built delivery is not an endorsement by its project.

```sh
archpub check publications/architecture-publisher/model.json --repo <architecture-publisher checkout>
archpub build publications/architecture-publisher/model.json --repo <architecture-publisher checkout> --out build/architecture-publisher
```
