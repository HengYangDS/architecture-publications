# The reviewer's procedure

Version 1, 2026-11-14. The procedure a holder of the reviewer's role follows on one delivery of one work. It is the
same for every holder. A holder may take the role for a work only after passing the seeded checks of this version
(`seeds.md`), and never for a work it wrote.

## What the reviewer is given

- The delivery directory as built: the edition, its page images, the page, `manifest.json` and, from the step that
  adds them, the reader file and the data.
- A checkout of the described repository at the commit the manifest names, and nothing later.
- This procedure and the value table of the publisher version that built the delivery.

It is not given the author's session, notes or memory, the answers to any seeded check, or an earlier review of the
same delivery.

## What the reviewer does

1. **Bytes.** Run `archpub verify <delivery>`. Stop and refuse if it fails.
2. **Statements.** For every statement that carries evidence, read the cited file, or the cited lines when it has
   a range, at the pinned commit, and give one verdict: `supported`, `not supported`, or `cannot tell` with the
   reason. A component's claim of a file is supported when the file is part of what the component is said to be. A
   relation is supported when a cited file shows the source using, calling, reading or producing the target, in
   the direction drawn. A written statement is supported when the cited lines say it.
3. **Questions.** For each entry of the question table the work marks as answered, confirm that the statements it
   points to answer that entry. For each entry marked silent, repeat the recorded search at the pin; a hit means the
   entry is not silent.
4. **Form.** Read every page at the base viewing condition, the whole page fitted to 1920 × 1080, and each plate
   again enlarged. Mark each instance of a defect class in the list below with its page and what it touches.
5. **Cannot judge.** List what this procedure does not let the reviewer decide, each with its page: above all
   whether a page reads well, which only a reader can say.

## Defect classes of form

A line or its end touches text. A label stands far from the thing it names. The key shows a mark the figure lacks,
or lacks one the figure shows. Two different marks cannot be told apart at the base condition. One character stands
alone on a line. Text is cut, overlaps or leaves its frame. A frame or boundary is open where it should close. A
large area of a page is blank beside a crowded one. Two pages set the same kind of text in different sizes. A page
says something of the system that no statement of the work holds.

## What the reviewer hands over

One record, a JSON file beside the delivery:

- `role`: `reviewer`; `holder`: an identifier of the holder, and `onBehalfOf` when it reviews under a delegation,
  with the delegation's scope and end;
- `procedure`: this version; `selfReview`: true when the holder also wrote or built the work, which a reader of the
  record must be able to see;
- `given`: what the reviewer was given to read, by path and digest;
- `verdicts`: the count of each verdict, and every statement not judged `supported` with its reason;
- `form`: each defect found, by class and page; `cannotJudge`: the list of step 5;
- `decision`: `accept` or `refuse`. One statement `not supported`, one failed byte check, or one entry wrongly
  marked silent refuses the delivery. Defects of form refuse it when they change what a page says; otherwise they
  are listed and the delivery may be accepted.

The reviewer signs nothing it did not read. A record never says more than the reviewer did: a statement not opened
is `cannot tell`.
