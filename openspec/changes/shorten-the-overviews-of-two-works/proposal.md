## Why

Architecture Publisher's queue item `edition-map` sets a work's overview in three sizes: one to read across a room,
one to read on a screen and one to read when zoomed. When a page runs long, the overview no longer shrinks its notes
to a fourth size. In the publisher's drawing of that layout, eight of the twelve overviews (six works, each in two
languages) fit one page as they stand. The overviews of AIGW Client and of Architecture Publisher, in both languages,
ran 30 to 41 pt past the page's foot. On 2026-11-23 the owner chose to shorten these four statements, each saying all
it said, rather than shrink the notes again or let an overview take a second page.

## What Changes

- AIGW Client: the lists "Team files, without credentials" and "Changing a provider" become one list of two lines;
  the provider's acceptance of a new Token joins `provider rotate` in "What the operator does". "Who owns what" drops
  the endpoint product, which the course's step Endpoints states in the same words, and says that the Tokens are kept
  in the one store AIGW chooses. The notes of the client-file transaction and of the Tokens spur say the same in
  fewer words.
- Architecture Publisher: the step Author drops "each problem with its JSON path", which the block on refusals
  states; the line Git of "What the publisher may touch" drops "reads at the pinned revision", which the step
  Repository states; the English "What it will not do" says the same three things in fewer words.
- Each in both languages. No other work, check or tool changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None: the models' words change, not what the publications require of a model.

## Impact

Changed: four models (`publications/{aigw-client,architecture-publisher}/{en,zh}/model.json`) and `CHANGELOG.md`.
Built with Architecture Publisher 0.17.0, the four editions build as before. In the drawing of three sizes, each of
the four overviews fits one page.
