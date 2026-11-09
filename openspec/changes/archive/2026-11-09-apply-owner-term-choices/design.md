## Context

See [proposal.md](proposal.md). Each translation's `concepts.md` fixes its renderings, and its model, overview and
guide use them. A Chinese word may render two English terms: 来源 is also "source" and 配置 also "configuration".

## Goals / Non-Goals

**Goals:**

- Every translation reads as Chinese a careful engineer would write, and says exactly what its original says.
- Every occurrence of the seven terms reads as the owner chose, in all four files of each work.

**Non-Goals:**

- Changing a rendering the owner kept, or the film-approved renderings.
- Changing what any work claims.

## Decisions

- **Polish against the English, string by string.** A string that reads as translated is rewritten for meaning
  and idiom; one that already reads naturally stays. Card details become short Chinese notes, not translated
  "verb: object" pairs. The publisher's check holds each work to its ids, citations and strict writing.
- **Replace by meaning, not by string.** Each occurrence was read against the English original: in ETHOS, 来源 stays
  where it renders "source" and 配置 where it renders "configuration", and only provenance and profile change.
- **A changed term takes its compounds with it.** The house class's faces, tokens and rules were 本社 compounds, so they
  follow 版式类 rather than keep a morpheme the owner set aside.
- **A fixed rendering may still read as a sentence.** "Fails closed" is 出错即拒绝 as a term; where a sentence already
  names the failure, it reads 即拒绝, so no sentence says the failure twice.

## Risks / Trade-offs

- [A longer rendering may relayout a plate] → Each changed work is checked and built with Architecture Publisher 0.10.1,
  and its plates looked at, before the change is committed.
