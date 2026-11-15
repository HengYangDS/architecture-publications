# Your task: the guide's statements of one work

You hold the reviewer's role for the work in `work/`. Read `PROCEDURE.md` first. You do its step 2, "Statements",
for every statement of the work's guide, and nothing else. The described repository at the work's pinned commit is
in `repository/`: read files there and nowhere else. Read nothing outside this directory. Do not use the network.

## What to judge

- **Each sentence, bullet and table cell of `work/guide/guide.archify.md` that is followed by a source marker**,
  written `[](source:<id>)`. The line `@source <id> … path="…" lines=<first>:<last>` names the file and lines.
  Supported when the cited lines say what the sentence says, all of it; several markers after one sentence are read
  together.
- **Each node and each connection of the guide's diagram files** (`work/guide/*.json`) that carries a source (a
  path with a line or a line range). Supported when the cited lines show it.
- A sentence of the guide that states a fact of the system and carries no marker gets `cannot tell` with the reason
  `no evidence`. Headings, questions and sentences that only lead to the next are not statements.

Open the cited lines. A statement whose lines you did not open is `cannot tell`. Give `not supported` only when the
lines say otherwise or do not say it; say what they say, and where in the repository the statement is said, if you
see it.

Then read `work/overview.typ`. Its sentences carry no evidence and get no verdict. List each one that says more
than, or other than, what the model and the guide state, with the statement it comes nearest to.

## How to hand over

Write only inside `out/`. After each ten statements append your findings so far to `out/findings.jsonl`, one JSON
object per line, so that an interrupted session loses little. When every statement is judged, write `out/record.json`:

```json
{
  "work": "<model id>", "half": "guide", "holder": "codex", "procedure": 1,
  "judged": { "sentences": 0, "diagram": 0 },
  "verdicts": { "supported": 0, "not supported": 0, "cannot tell": 0 },
  "findings": [
    { "statement": "guide <source id>[, <source id>]: <the sentence's first words> | diagram <file> <node or connection id>",
      "verdict": "not supported | cannot tell",
      "reason": "<what the cited lines say instead, or why it cannot be told>",
      "evidence": "<path>:<first line>-<last line> of what you read" }
  ],
  "overview": [ { "line": 0, "text": "<the sentence>", "differs": "<how, and from which statement>" } ],
  "not_read": ["<statements you did not reach>"]
}
```

`findings` holds every statement not judged `supported`, and no other. Write reasons in English and quote the
work's own words as they stand. Then reply with the one line `record written`.
