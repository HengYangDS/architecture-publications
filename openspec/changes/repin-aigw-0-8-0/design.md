## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.8.0`, run with Architecture Publisher
0.14.0 on 2026-11-16, lists what the re-pin has to do:

| Work | Release | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---- | ------- | ------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| AIGW | v0.8.0  | 49 of 245           | 83, 38, 0                            | 10 and 23                          | 5, none            |

Forty-five cited files are modified and four are deleted: `internal/cli/self/custody.go`,
`internal/secret/native/migration_darwin.go`, `internal/secret/predecessor_darwin.go` and
`internal/secret/predecessor_other.go`. The five refusals are these files in the lists of three relations
(`commands-use-cases`, `commands-terminal`, `credentials-platform`).

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says that AIGW takes over or migrates a Keychain item, or that a program rollback moves
  a credential.

**Non-Goals:**

- An `edition` object in the model, and the print edition: plates are rebuilt when the work is next published.
- A new view or question.
- Correcting what the review of 2026-11-15 found in this work beyond the statements this re-pin rewrites: those
  findings belong to the item `six-works`.

## Decisions

1. Move each shifted citation mechanically, and reread each listed component and relation against the diff of its
   files between the two pins.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin; no citation is touched.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, so the citations still say what
     they said; the words about a component can be wrong although its citations hold, and the diff shows where.
   - Applies to: the guide, its diagram files and the model, in both languages alike.
2. A deleted file leaves the file list of each relation that names it; the relation stays while other files carry
   it.
   - Rests on: the five refusals of the worklist, and the lists of the three relations, each of which names other
     files that exist at the tag.
   - Considered: removing the relations; keeping the files with a note.
   - Chosen because: a relation's files are evidence that it exists at the pin. A file that is gone is no
     evidence, and the remaining ones still are.
   - Applies to: `relations[].files` of both models.
3. What the work says of the removed behaviour is removed where it described the present, and kept where it is
   history.
   - Rests on: the section `## [0.8.0]` of AIGW's `CHANGELOG.md` at v0.8.0.
   - Considered: marking the parts `retired`; removing every mention.
   - Chosen because: a work describes what the pinned source implements, and history is true as history. The same
     rule decided the proxy's drain in the re-pin of 2026-11-15.
   - Applies to: the model, the guide, the diagram files and the overview, in both languages.
4. The release enters the work's history as its last event.
   - Rests on: the rule the works' histories follow (a release enters when it changed what the system does for
     its users), and the two entries of the release marked breaking.
   - Considered: leaving the history at 0.7.2.
   - Chosen because: a user who rolls back, or who holds a Keychain item from 0.3.5 or earlier, meets different
     behaviour.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [A mention of the removed behaviour survives] → The work's directory is searched in both languages for the
  takeover, the migration and the credential step of a rollback after the rewrite; what remains is history.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
