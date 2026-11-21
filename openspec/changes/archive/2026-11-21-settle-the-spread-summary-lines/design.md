## Context

See [proposal.md](proposal.md). The measures are `loose-lines/wide-gaps.py` and `loose-lines/tracked-cjk.py` of the
publisher's working record, run on the twelve editions built by Architecture Publisher 0.16.0 at the works' pins.

## Goals / Non-Goals

**Goals:**

- No line of a summary, on a cover or a plate, is stretched past the house's limits in either language.

**Non-Goals:**

- The product's own rule for a line that cannot be filled: Architecture Publisher's queue item `edition-map` holds
  the line-breaking rules, and a rule there serves every work; this Change settles the four lines the measure found.

## Decisions

1. Turn the sentence so the line fills, rather than shorten it.
   - Rests on: the seven lines read in the built editions: each held too little to fill, and the next token could
     not join it.
   - Considered: removing words, which loses facts; breaking a part's name, which the edition keeps whole.
   - Chosen because: a turned sentence keeps every fact, and Film Kit's and OpenAI Responses Proxy's English now
     follow their Chinese more closely. In Chinese, a few characters added before the Latin word let the line fill
     with characters, which break anywhere.
   - Applies to: four English plate summaries, the ETHOS summary, and two Chinese summaries of Architecture
     Publisher and OpenAI Responses Proxy.
2. Accept a rewording only on the built edition.
   - Rests on: a line's break depends on the face, the measure and the part names' marks, which only the build
     sets.
   - Considered: predicting breaks by counting characters; three variants of each line were built under one
     ticket and the ones that measured clean were taken.
   - Chosen because: the measure on the build is the acceptance the owner's words ask for.
   - Applies to: the twelve editions built from a tree equal to the lane's.

## Risks / Trade-offs

- [A turned sentence spreads another line] → The twelve editions are built from a tree equal to the lane's and
  measured again before the lane lands.
