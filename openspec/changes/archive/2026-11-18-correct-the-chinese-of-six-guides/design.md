## Context

The six works' Chinese was written from the English with a term table fixed first. On 2026-11-18 the tables, the
models and the overviews were corrected from readings by readers other than the writer, and the owner decided the
renderings the readers had questioned. The guides, which a work's page in a browser is built from, were outside
that Change. The census of the editions built that day counted the old renderings a corrected table had replaced:
none in an edition, 501 on ETHOS's Chinese page.

## Goals / Non-Goals

**Goals:**

- A Chinese guide names a thing as its work's corrected table and Chinese model name it.
- A Chinese guide reads as written Chinese and says what its English says.

**Non-Goals:**

- The English guides. The readers found faults in them, listed under the open questions.
- A page's structure, its figures' forms, or which sentences cite which lines.

## Decisions

1. Four passes, each by another reader than the one before.
   - A reader read each Chinese guide whole against its English, the corrected table, the Chinese model and the
     owner's decided renderings, and reported for every changed rendering whether each use names the row's thing,
     and every other fault of wording: 252 findings.
   - An editor put the findings into a copy of the guide and left open what its reader had chosen without a
     source: 237 applied.
   - The holder settled what was left, 19 places with four drawn titles of figures, by the product's own
     definition and then its source: ETHOS's authority by
     sense, 权威依据 where a judgment rests on it; ETHOS's CI supply as the image at `.config/ci/supply/`; Film
     Kit's traces and bound as its model names them; OpenAI Responses Proxy's refused replay as installing the
     installed release again, by the line that refuses it.
   - A second reader confirmed every changed text against its English: 38 findings, 34 taken. Not taken: Film
     Kit's bound as 界限 (the model says 限值 and the table row now follows) and its 向…看齐 for the verb of level
     (the model's verb); in OpenAI Responses Proxy "installation and removal", which its changelog says and the
     English guide shortens.
   - Rests on: the owner's rule that a text for readers is read through as Chinese by a reader other than its
     writer before it counts as done, and the first Change's finding that a rendering fixed by the English word
     is copied to every page.
2. The guide follows the model where a table and a model differ, and the table row moves.
   - Rests on: the model was read twice in the first Change; a table row is one cell. Three rows move: Film Kit's
     bound, Architecture Publisher's lock, DDWG's release declaration (decided on 2026-11-18, missed in its
     table).
3. A sentence the page's writing checks refuse is reworded, and read again.
   - The released publisher refused three pages built from the corrected guides: Archify's writing checks allow two
     的 in a sentence and fifty reading units, and take 仅供参考 in running text for a qualification. Eight
     sentences were reworded with their meaning kept, a reader confirmed four and proposed five changes, all
     taken; a transcript is now a 旁证 in Film Kit's guide and table, since the page cannot say 仅供参考.
   - Rests on: the page is the product's, and its checks are the guide's limits. The first three passes did not
     run them, so the faults came out only at the build.
4. A check on structure stands beside the readings.
   - Every figure file parses with the same keys, ids and sources as before; every source mark, anchor, directive,
     code span and number of the article stands as before, apart from Chinese words inside a directive's title
     and one "0.2.0" the English has.

## Risks / Trade-offs

- A label that grew may no longer fit its figure. Mitigation: the released publisher checks each work with its
  repository; a label that does not fit refuses the page.
- A reader is an agent, as the writer was. The second reader confirmed changes, not the sentences no finding
  touched.

## Open Questions

- The English guides: AIGW's parts figure says "one contract per client" where the guide says one for every
  client, and "third-party inference library" for a configuration library; Film Kit's guide says "the sample
  film's twelve films"; OpenAI Responses Proxy's says "a cooling provider answers 429 or 503" where the proxy
  answers, and "installation" where its changelog says installation and removal; ETHOS's lane figure calls one
  event "refused" on the state and "fails" on the edge into it. They need their own reading.
- Whether a legend entry and a node of one figure may differ (ETHOS: the step 存证 and its node Attestation).
