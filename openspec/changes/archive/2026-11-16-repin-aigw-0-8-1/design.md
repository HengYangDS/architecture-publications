## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.8.1`, run with Architecture Publisher
0.14.0 on 2026-11-17 on the work as it stands on `dev` (46571f94), lists what the re-pin has to do:

| Work | Release | Owned or cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---- | ------- | ---------------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| AIGW | v0.8.1  | 11 of 241                    | 94, 32, 0                            | 3 and 6                            | none               |

The components are `commands`, `credentials` and `domain`. The relations are `commands-use-cases`,
`commands-activation`, `commands-terminal`, `commands-credential-helper`, `commands-program-updates` and
`credentials-platform`.

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says of the credential store, of `aigw use` or of a build what 0.8.1 no longer does.

**Non-Goals:**

- An `edition` object in the model, and the print edition: plates are rebuilt when the work is next published.
- A new view, part or question.

## Decisions

1. Move each shifted citation mechanically.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin; no citation is touched.
   - Considered: rereading every citation.
   - Chosen because: a shifted range holds the same bytes at new line numbers.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the section `## [0.8.1]` of AIGW's `CHANGELOG.md` at v0.8.1, and the diff of the three listed
     components' files between the two pins.
   - Considered: describing every command's count of credential operations; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. A statement the release made untrue is corrected; how often a command asks the store is said only where
     the work already speaks of a command's use of it.
   - Applies to: the model, the guide, the diagram files and the overview, in both languages.
3. The release enters the work's history.
   - Rests on: the work's own timeline, which holds every release from v0.5.0 to v0.8.0, patch releases among
     them, and the release's Fixed entry on `aigw use`, which changes what its user is told.
   - Considered: leaving the history at 0.8.0.
   - Chosen because: the timeline's own rule is every release, and a user of `aigw use` meets a different message.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
