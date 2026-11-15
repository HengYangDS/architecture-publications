# Your task: the model's statements of one work

You hold the reviewer's role for the work in `work/`. Read `PROCEDURE.md` first. You do its step 2, "Statements",
for every statement of `work/model.json`, and nothing else. The described repository at the work's pinned commit is
in `repository/`: read files there and nowhere else. Read nothing outside this directory. Do not use the network.

## What to judge

- **Each component**: its claim of files (`files`). Supported when each claimed file or directory exists in
  `repository/` and is part of what the component is said to be by its label and kind.
- **Each detail of a component** (each key of `details` with its values): supported when the component's claimed
  files show it.
- **Each relation**: supported when a file it cites (`files`) shows its source (`from`) using, calling, reading or
  producing its target (`to`), in that direction, in the sense of its label.
- A statement that names no file gets `cannot tell` with the reason `no evidence`.

Open the files. A verdict from a file's name alone is not a verdict: a statement whose file you did not open is
`cannot tell`. Give `not supported` only when the files you read say otherwise or do not say it; say what they say.

## How to hand over

Write only inside `out/`. After each ten statements append your findings so far to `out/findings.jsonl`, one JSON
object per line, so that an interrupted session loses little. When every statement is judged, write `out/record.json`:

```json
{
  "work": "<model id>", "half": "model", "holder": "codex", "procedure": 1,
  "judged": { "components": 0, "details": 0, "relations": 0 },
  "verdicts": { "supported": 0, "not supported": 0, "cannot tell": 0 },
  "findings": [
    { "statement": "component <id> | detail <component id>/<key> | relation <id>",
      "verdict": "not supported | cannot tell",
      "reason": "<what the files say instead, or why it cannot be told>",
      "evidence": "<path>:<first line>-<last line> of what you read" }
  ],
  "not_read": ["<statements you did not reach>"]
}
```

`findings` holds every statement not judged `supported`, and no other. Write reasons in English and quote the
work's own words as they stand. Then reply with the one line `record written`.
