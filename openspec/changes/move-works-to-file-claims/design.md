## Context

In model version 2 a component claims the repository paths it owns, a
directory ending in `/` or one file, and a relation names the files that
evidence it. With a checkout, Architecture Publisher gives each file in the
coverage scope to its most specific claim at the model's revision and records
every cited file with its digest, owner and citing relations in the delivery's
manifest. It refuses a version 1 model and names `archpub migrate`, which
converts one with each component claiming the files its sources listed. The
ETHOS and AIGW models were written by generators kept outside this repository,
whose ordered path rules decided each file's component.

## Goals / Non-Goals

**Goals:**

- Every work is a version 2 model the current publisher reads.
- A reviewer reads the ETHOS and AIGW path rules in their models.

**Non-Goals:**

- Changing a work's components, relations, views, overview or guide.
- Re-pinning a described repository.

## Decisions

- **The ETHOS and AIGW claims are their generators' rules.** Each component
  claims the paths its rule listed, in the rule's order, and the publisher's
  most specific claim reproduces the generators' attribution: every AIGW file
  and 447 of the 455 ETHOS files keep their component. Exact files, as
  `archpub migrate` writes them, were rejected for these two works: 455 and
  210 paths would hide the rules again.
- **ETHOS's package initializers go to the components the rules name.** The
  generator gave a one-line `__init__.py` to the component of the first file in
  its package, overriding the rules that named six initializers for Contracts
  and schemas. The claims follow the rules: those six go to Contracts and
  schemas, `src/ethos/adapters/repo/__init__.py` to Git and process
  observation, whose directory claim holds it, and
  `src/ethos/adapters/mutation/__init__.py`, which no rule named, joins the
  other initializers in Contracts and schemas.
- **A claim that owns no file is dropped.** The rules gave Contracts and
  schemas `src/ethos/resources/`, whose every file a deeper claim takes; the
  publisher refuses such a claim.
- **Outside systems claim no files.** Seven files were cited by their owner
  and by the outside system they reach. Each now has its owner alone, and the
  relations to Git, the OpenSpec CLI, the native tools and the Forges cite them
  as before.
- **The Architecture Publisher work is converted by `archpub migrate`.** Its
  catalog was written by hand, one file per source, so its claims are those
  files.
- **The input check reads version 2.** It requires at least one claimed file
  and checks no digest, which the publisher records in the manifest.

## Risks / Trade-offs

- [A re-pin adds a file under a claimed directory] → It goes to that claim, and
  `archpub check --repo` counts it in the coverage. A file under no claim is
  listed as uncovered.
- [The generators retire] → Their rules are now the claims, and the models they
  wrote stay in Git.
