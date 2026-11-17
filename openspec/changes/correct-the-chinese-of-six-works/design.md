## Context

See [proposal.md](proposal.md). The corrections were made outside this repository, on copies of the files as they
stand on `dev` (98652e7e), in four steps, each by a holder other than the one before:

| Step                                                       | Who                         | Result                                            |
| ---------------------------------------------------------- | --------------------------- | ------------------------------------------------- |
| A first reading of each work's Chinese against its English | six readers, one a work     | 158 findings                                      |
| The corrections, the term table first                      | six editors, one a work     | the tables, then the models                       |
| A second reading of the corrected Chinese                  | six readers, none an editor | 68 findings, most made or left by the corrections |
| A reading of every string changed after it                 | the same six readers        | 9 findings, applied and not read again            |

Every reader and editor was an agent. Where a reader could not judge a rendering from the sentence, the described
repository's source was read for the thing the word names.

## Goals / Non-Goals

**Goals:**

- A term names in Chinese the thing it names in its work, as a Chinese engineer of that field writes it.
- One thing has one name within a work's table and model.
- A sentence reads as written Chinese and says what the English says.

**Non-Goals:**

- The Chinese guides (`zh/guide/`), which the page in a browser is built from. No reader has read them against
  their English yet, and they hold the old renderings (ETHOS's guide says 证明 61 times). They are the next Change.
- A change of any English text, and a rule or a check of wording in this repository.

## Decisions

1. Correct the term table before the text, and treat it as a record of what was decided, by concept.
   - Rests on: the readers' findings, in which a wrong rendering stood wherever its table row had been applied.
   - Considered: correcting each finding where it stands; the table would then go on producing the fault.
2. Take a rendering from the thing in the described repository, not from the English sentence.
   - Rests on: ETHOS's "authority", sorted from its sentences into two renderings and found by its source to be one
     thing in all eleven places, the standing to perform an effect: 授权.
   - Considered: one rendering for one English word across works; the same word names different things in them.
3. Follow the owner's and the films' concept tables where a work shares a concept with a film.
   - Rests on: the owner's decisions of 2026-11-18, and the ETHOS film's table for Attestation and proof.
4. Hold every correction to wording alone by a comparison with the files before: the same structure, ids, files and
   citations, and in every string the same numbers, identifiers and Latin words.
   - Rests on: an editor of wording can change a number or an identifier without meaning to.
   - Considered: review by eye.
5. Carry the corrected sentences into the overview compositions, and leave the guides to the next Change.
   - Rests on: a composition places its sentences by coordinates and stays the overview until the publisher draws
     that page from the model. Each corrected sentence replaces the old one where the composition places it, with
     the composition's own line breaks; a longer one keeps its place by a break or a wider column. The publisher's
     check of each composition passes (no text over another, none outside the page), and every changed region was
     looked at for a text over a line and for a bad break.
   - Considered: waiting for the statements; the overview page would speak the old words beside plates that speak
     the new ones for as long as that takes. Until the guides follow, a Chinese delivery's page in a browser does.

## Risks / Trade-offs

- A label that grew longer may not fit where an overview composition places it by `label-of`. The publisher's
  check of each work refuses a text that overlaps another; a composition that it refuses is given the label's old
  width by a shorter rendering, or the Change waits for the statements.
- Every reader was an agent of one family. What a person who writes Chinese for a living would still change is
  not known.
