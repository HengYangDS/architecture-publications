## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v6.0.1`, run with Architecture Publisher
0.14.0 on 2026-11-16 on the work as it stands on `dev` (877f6893), lists what the re-pin has to do:

| Work                   | Release | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---------------------- | ------- | ------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| OpenAI Responses Proxy | v6.0.1  | 7 of 86             | 143, 29, 2                           | 5 and 17                           | none               |

The two touched citations are `code-gate` (`src/openai_responses_proxy/relay/responses.py`) and
`code-transport-error` (`src/openai_responses_proxy/relay/exchange.py`).

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says of a response's end, of the log or of a client's close what 6.0.1 no longer does.

**Non-Goals:**

- An `edition` object in the model, and the print edition: plates are rebuilt when the work is next published.
- A new view, part or question.
- Correcting what the review of 2026-11-15 found in this work beyond the statements this re-pin rewrites: those
  findings belong to the item `six-works`.

## Decisions

1. Move each shifted citation mechanically and reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched one does not; reading
     only the touched ones spends the reading where the text changed.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the section `## [6.0.1]` of the proxy's `CHANGELOG.md` at v6.0.1, and the diff of the five listed
     components' files between the two pins.
   - Considered: describing every new log line; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. The release is mostly about the log's lines; the work names few of them, and a list of log events
     belongs to the proxy's own documents. A statement the release made untrue is corrected; a behaviour the work
     already describes (the answer at an expired deadline, the end of a stream) is made to agree with 6.0.1.
   - Applies to: the model, the guide, the diagram files and the overview, in both languages.
3. The release enters the work's history only if it changed what the proxy does for the role that runs it.
   - Rests on: the rule the works' histories follow, and the release's Fixed entries: the proxy no longer writes a
     second answer after a timed-out write, and ends a connection it used to leave open.
   - Considered: entering every release; leaving the history at 6.0.0.
   - Chosen because: an operator reading the log and a client on a failed stream both meet different behaviour, so
     the release enters, as one event in the form of the earlier ones.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
