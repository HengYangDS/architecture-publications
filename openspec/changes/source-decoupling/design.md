## Context

The diagram product must not transfer authoring, assembly or qualification
burden into the repositories it describes. An independent editorial owner is
distinct from both source products and the generic Publisher.

## Goals and Non-goals

Preserve meaning, unique artwork and accepted delivery. Remove active dependence
on drawing-specific source integrations. This transition does not create a
source ontology, governance service or second Publisher implementation.

## Decisions

- `publications/` owns each work's source pins, editorial data and artwork.
- Source-specific adaptation lives here, not in ETHOS, AIGW or generic Publisher.
- Source products are accessed through explicit pinned read-only Git objects;
  output, scratch and evidence stay outside those source roots.
- Public Publisher input and output contracts own mechanical compilation.
  Native Archify owns HTML; independent SVG/PNG6000 owns static composition.
- Removed wrappers, Providers and source-CI controllers are not copied as live
  compatibility layers. Unique historical material remains available in Git.

## Migration and Recovery

Copy and compare exact selected inputs before source deletion. Generate plain
Claim Model and Edition Project inputs and test a direct public build. Record
source tree and source-member digests, external origin and declared limits.
Do not imply source endorsement or current implementation acceptance.
Accepted user-delivery bytes are preserved throughout migration.

Incomplete original executable adapters remain recoverable from their exact
preservation commit, not as active code with broken imports. The same member
manifest selects current files or Git-retained originals and verifies both.
Native ETHOS code-quality providers measure the small input checker and its
tests; the original Prettier owns formatting. No new source-side obligations
or renderer implementation are introduced by these input checks.

## Acceptance

A complete external input can be qualified and rebuilt with no drawing-specific
files, executable dependencies or writes in either source product. Source
pre/post Git state agrees. Source semantic, artwork, installation and remote
publication acceptance remain separate facts.
