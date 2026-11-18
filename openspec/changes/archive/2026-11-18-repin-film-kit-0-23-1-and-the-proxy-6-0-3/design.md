## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>`, run with Architecture
Publisher 0.14.0 on 2026-11-18 on each work as it stands on `dev` (b02bc6ff), lists what the re-pins have to do:

| Work                   | Release | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---------------------- | ------- | ------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| Film Kit               | v0.23.1 | 29 of 124, 1 moved  | 54, 57, 31                           | 15 and 39                          | 3 and 15           |
| OpenAI Responses Proxy | v6.0.3  | 28 of 86            | 108, 41, 28                          | 12 and 26                          | none               |

Film Kit's three refusals are one move: `src/filmkit/delivery/documents_folder.py` is `src/filmkit/delivery/folder.py`
at the new pin, which the part `delivery` claims and the relations `delivery-packaging` and `delivery-host-tools`
cite. Its fifteen uncovered files are new: the detail audit and its modules, the band audit, the derivation and
the qualification of a picture, the browser and the ground of a picture, the detail gates, the duration records,
and the processes of a narration and of a command's children.

## Goals / Non-Goals

**Goals:**

- Each work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of a work says what its release no longer does.

**Non-Goals:**

- The overview drawn from a statement in the model: the works take it with Architecture Publisher 0.15.0, in a
  Change of their own. Until then each work keeps its overview composition, corrected only where a release made
  one of its statements untrue.
- An `edition` object in the model, and the print edition: plates are rebuilt when the works are next published.
- A new view or question.

## Decisions

1. Move each shifted citation mechanically and reread each touched one.
   - Rests on: the worklists above, computed by the publisher's own check at the new pins.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched one does not; reading
     only the touched ones spends the reading where the text changed.
   - Applies to: citations of each guide and its diagram files, in both languages alike.
2. A work's words change only where a release changed a fact the work states.
   - Rests on: the sections of each repository's `CHANGELOG.md` for its releases, at the new tag, and the diff of
     the listed components' files between the two pins.
   - Considered: describing every entry of a release; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. A statement a release made untrue is corrected, and a behaviour the work already describes is made to
     agree with the release.
   - Applies to: the model, the guide, the diagram files and the overview composition, in both languages.
3. Every file in a work's scope is owned by a part: by the part whose subject it implements, and by a new part
   only where no part of the work has that subject.
   - Rests on: the works' own rule that a file in scope is owned, which the check reports as `uncovered`; Film
     Kit's fifteen new files.
   - Considered: narrowing the scope to leave the new files out; one part for all of them.
   - Chosen because: the detail audit is a fourth audit of the picture and belongs with the three the work
     describes; a file that implements no described subject, such as the duration records, needs a part that says
     what it is, with its relations, or the work is silent on what the release added.
   - Applies to: Film Kit's models, in both languages, and the views that draw the parts concerned.
4. A release enters a work's history only if it changed what the system does for a role that uses it.
   - Rests on: the rule the works' histories follow.
   - Considered: entering every release; leaving the histories at the old pins.
   - Chosen because: Film Kit 0.23.0 gives a film's author a fourth audit, a faster build and a renamed
     declaration key, and the proxy's 6.0.2 and 6.0.3 change what an operator meets at a failed handoff, in
     `status` and at `uninstall`. Film Kit 0.23.1 moves the supply, and a film that adopts it narrates anew: it
     enters if the work's history holds releases of that kind, and is named at the pin otherwise.
   - Applies to: each `guide/history.timeline.json` and the guide's prose on where the timeline ends.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
- [A change of an overview composition's words breaks the page its author placed] → The publisher's check typesets
  the page and refuses text outside its area or over other text; each such change is listed, so that the statement
  that replaces the composition takes it too.
