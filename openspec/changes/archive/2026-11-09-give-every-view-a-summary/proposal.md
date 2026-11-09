## Why

Where a view's figure leaves part of the body, its plate sets the view's
summary and where each part lives. Forty of the works' 41 views have no
summary, so the reader gets the paths without the sentence that explains the
figure. The owner asked for a summary on every view. Two works also trail
their repositories' latest releases: OpenAI Responses Proxy is at v5.1.9 and
Architecture Publisher at v0.10.1.

## What Changes

- Every view of every work carries a summary in English and in Chinese, drawn
  from what its model says about that view's parts.
- The input check refuses a view without a summary, in a work and in a
  translation, and the input specification states the rule.
- Two works move to their repositories' latest releases, from the re-pin
  worklist `archpub check --against` reports:
  - OpenAI Responses Proxy at v5.1.10 (`a36a33c`)
  - Architecture Publisher at v0.10.2 (`4fcd4d0`), which sets a summary alone
    when its paths do not fit
- Building the works needs Architecture Publisher 0.10.2 or later, and the
  README says so.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: every view declares a summary.

## Impact

- Every work's `model.json`, in English and in `zh-CN`.
- The OpenAI Responses Proxy and Architecture Publisher works: their pins,
  citations, versions and the facts those releases changed.
- `tools/verification/publication-inputs.mjs` and its test, the README and the
  changelog.
