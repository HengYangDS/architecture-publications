## Context

See [proposal.md](proposal.md). The owner's words stand in the publisher's working record of his asks (row 44);
the reader's report on the two names stands in the record of the set of 2026-11-20 (`works-lists-set/set-final/words/`);
the measure of spread lines is `loose-lines/` of the same record.

## Goals / Non-Goals

**Goals:**

- A cover says a work's name once, in its title.
- No line of a cover's summary is spread past the house's limit.
- A reader who meets two names in one edition reads at once whether they are one thing or two.

**Non-Goals:**

- The question under the title: the page uses it as its heading where a work has no guide, so it keeps the name.
- The plates' narrow summaries, whose spaces a justified line stretches in English; they are measured and settled by
  a Change of their own.
- The term tables: their rows already stand (`发布标识`, and `identity` rendered 构建标识; `讲解页`, `面板`).

## Decisions

1. Open each summary with what the work does.
   - Rests on: the cover's order (title, question, summary) in the publisher's edition at the works' pins.
   - Considered: dropping the name only where it opens two sentences running; one opening name under the title is
     the repetition the owner named.
   - Chosen because: a summary is read as the sentence under the title, so its subject is the work already.
   - Applies to: the summaries of ETHOS, AIGW Client and Film Kit, both languages. In AIGW Client's Chinese summary
     the name stands once, where 「归 AIGW 管」 says whose settings are written.
2. Refuse the opening name in the input check, not by a writer's care.
   - Rests on: the owner's hard requirement of 2026-11-20 that a rule be declared once and held by the product.
   - Considered: a word list per work; the title already names the work.
   - Chosen because: the first word of a title is the work's name for every work here, and a Chinese title without
     a space is its name whole, so one comparison holds all twelve models.
   - Applies to: `verifyModel`, each work's `summary`.
3. Turn the sentence, not the setting, where a line spreads.
   - Rests on: the measure of 2026-11-21 on the built editions: the guidelines' Chinese cover line at 1.073 em a
     character, every other cover line within the house's limit.
   - Considered: letting the line break inside 「OpenSpec」; a name does not break.
   - Chosen because: the turned sentence puts the name inside a line and says the same fact.
   - Applies to: `publications/ddwg/zh/model.json`, `summary`.
4. Name the thing the relation carries, and what the part makes.
   - Rests on: at the ETHOS pin `b10254f`, `src/ethos/adapters/repo/runtime/authority.py` imports `BuildIdentity`
     from `ethos.repository.release.identity`; at the Architecture Publisher pin, `src/map/explainer.mjs` line 11:
     the part makes the page.
   - Considered: merging 构建标识 into 发布标识, as the reader proposed; the source makes them two things.
   - Chosen because: the label then names the part's product in the part's own term, and one clause states what
     讲解页 makes.
   - Applies to: the ETHOS relation `runtime-release` and `views[5].summary` of Architecture Publisher, both
     languages.

## Risks / Trade-offs

- [A rewritten summary reads as a list without a subject] → Each was read by a reader other than the writer in its
  language against the title above it.
- [A title whose first word is common, so a summary may begin with it for another reason] → None of the six works
  has one; the rule compares the word as a word of its own, so "Filmmakers" passes under "Film Kit".
