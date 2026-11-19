## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.8.3`, run on 2026-11-20 with the
released Architecture Publisher 0.15.0 on the work as it names its team file, lists what the re-pin has to do:

| Work        | Release | Files in scope changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ----------- | ------- | ---------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| AIGW Client | v0.8.3  | 10 of 242, and one new | 83, 55, 5                            | 5 and 7                            | none               |

The changed files are the command's setup of a team file with its report, the invocation's context and failures,
the Token probe, the configuration store's file and manifest, the terminal's prompt and the team file; the new file
asks for a team file's Tokens and falls under a claim that names its directory.

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says what its release no longer does.

**Non-Goals:**

- A new part, view or question: the new file belongs to a part the work has, and the release adds no subject the
  work lacks.
- The plates of the print edition: they are rebuilt when the works are next built.

## Decisions

1. Move each shifted citation mechanically; reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched range holds changed
     lines, so its citing words are read against the release's text and its range is set anew.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the section of the repository's `CHANGELOG.md` for 0.8.3, at the new tag, and the diff of the listed
     components' files between the two pins.
   - Considered: describing every entry of the release; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. The guide's section on the team file already says what applying the file needs and does, so what the
     command now does with Tokens is said there; an entry the work has no place for is left out.
   - Applies to: the model with its overview statement, the guide and the diagram files, in both languages.
3. 0.8.3 enters the work's history.
   - Rests on: the rule the works' histories follow, that a release enters when it changed what the system does
     for a role that uses it.
   - Considered: naming the release at the pin only.
   - Chosen because: a setup that stopped at a Token its provider refused now applies the team file and reports
     that provider, which an operator meets.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends, in both languages.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each, and readers other than the writer read the Chinese
  the move added or changed.
- [A guide's citation under a path the page's checker refuses] → Two claims about a Token's refusal cite the
  release's changelog section, since the page's writing checks refuse a citation under `internal/secret/`; each was
  read against the probe's source at the new tag.
