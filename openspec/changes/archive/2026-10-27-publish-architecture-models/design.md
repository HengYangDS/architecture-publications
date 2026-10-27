## Context

The current inputs were written for the retired claim-model and edition
pipeline: the AIGW claim model, edition project and build request, and the
ETHOS design graph and artwork preserved from ETHOS revision `e60fec5`.
`source.json` records each preserved original with its source revision and
digest; most are current files, and four ETHOS adapters are already retained
only at the preservation commit. Architecture Publisher 0.4.0 reads one
Architecture Model per publication and verifies its sources against a checkout
of the described repository. See the proposal for why the works must move.

## Goals / Non-Goals

**Goals:**

- Each work is buildable by the current publisher from this repository alone
  plus a checkout of the described repository.
- Every statement in a model cites source files pinned by digest at a full
  commit, and the preserved originals stay verifiable.

**Non-Goals:**

- Committing deliveries; they are built under the ignored `build/` directory
  and published by the user's acceptance to a destination outside Git.
- Reproducing the retired composition or its quality contract.

## Decisions

1. **The model is authored here, not in the source.** `attribution` names this
   repository as the editor, and the described repository gains no files. This
   keeps the existing source and editorial requirements unchanged.
2. **AIGW is converted and re-pinned to the current tree.** Its components,
   relations, details, sources, groups and four views come from the claim
   model and edition questions. The model pins `aigw-cli` `ed9f0fd5`, after
   every claim was read against the eleven source files that changed since
   `68876f0`: the seven Adapter operations, the admission-ordered registry of
   four Adapters, the secrets dependency, registry-only client selection,
   preflight with compensated apply, and the CLI's synchronizer composition all
   hold. The old limit cited a 64-digit "source revision" that is not an
   `aigw-cli` commit; the limits now state the selection boundary without it.
   Keeping the `68876f0` pin was rejected: a publication should describe the
   current tree when its claims still hold. The publisher's own AIGW test
   fixture keeps `68876f0`.
3. **ETHOS is authored from the implemented code, not converted.** The
   preserved semantic graph encodes the retired contract's assertions and
   visual obligations against files at `e60fec5`. The new model describes the
   implementation at `ad9108d7` as an overview and three mechanism views. Each
   component is one responsibility a reader can follow, citing every module
   that implements it, and a command is a detail of the step it runs rather
   than a card of its own. A first draft with one card per module and per
   command group had 30 components and 45 relations; its command hubs and
   cross-cutting stores made the map unroutable at its 14 px floor and the
   overview a dense web, so the published model has 20 components and 26
   relations. On 2026-10-27 the user decided that the preserved quality
   contract no longer binds.
4. **Retired inputs move to Git storage.** Every former member is recorded
   with `storage: "git"` and verified at the preservation commit, so the
   working tree holds only the model, the README and the custody record.
   Deleting the custody record would lose evidence that is verifiable today;
   keeping the files would leave two models per work and an active request for
   a retired publisher. The AIGW edition member records the original bytes at
   the preservation commit; its later 6000 px edit was an input of the retired
   publisher and remains in Git history. The build request was never a source
   original and is removed.
5. **The input check owns identity and custody; the publisher owns
   validation.** The check reads each model as data: format, version, a full
   revision, a digest for every source and a unique id. It does not duplicate
   the publisher's schema, and running `archpub check` here was rejected
   because the 0.4.0 package is not yet released and the source checkouts are
   not available to this repository's proof. A later change can add that run
   once a release is installable.

## Risks / Trade-offs

- [The described repository moves on] → The pin and digests keep each model's
  evidence exact; re-pinning means re-reading the changed sources, and
  `archpub check` names every actual digest.
- [A converted claim loses a qualifier] → Each relation keeps its sources and
  details; the conversion is reviewed against the preserved claim model, which
  stays verifiable at the preservation commit.
- [A consumer still reads a removed file] → The retired publisher was the only
  consumer of these formats and this repository's test the only reader; the
  custody test keeps every original verifiable.
- [The preservation commit becomes unreachable] → The custody test fails when
  it cannot read a member; this repository's history is never rewritten.

## Migration Plan

Reverting the change's commits restores the former files, and the originals
can always be read from the preservation commit.
