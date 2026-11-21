## Why

On 2026-11-20 the owner found lines whose spaces a justified setting stretched because they held too few words
(「部分文字描述因文字过少，两端对其导致字间距过大，可以考虑适当调整行文，以优化排版」). Every page of the twelve
editions built by Architecture Publisher 0.16.0 was measured for both forms of it: an English line whose spaces grew
past the house's limit, which lets a space grow by a quarter of its width, and a Chinese line spread into single
characters. Seven lines were found. In each, the token after the line could not join it: a part's name or a code name
in English, a Latin word in Chinese. One of them, the first line of the ETHOS cover's Chinese summary, came from the
Change `settle-the-covers-and-two-names`, whose rewording put 「TransitionPlan」 at the head of the second line.

## What Changes

- Plates 03 and 06 of Architecture Publisher, plate 03 of Film Kit and plate 05 of OpenAI Responses Proxy are turned in
  English so their lines fill. Film Kit's says that Thought takes reads each thought aloud, as its Chinese does;
  OpenAI Responses Proxy's says that Deployment refuses a listener unless it declares both handoff capabilities, as
  its Chinese does.
- The ETHOS cover's Chinese summary opens with 「TransitionPlan」, which then stands inside the first line.
- The Chinese overview line of Architecture Publisher says that the reviewer runs its commands afterwards, and the
  Chinese plate of OpenAI Responses Proxy names `SHA256SUMS.sig` as the version's signature file, so the Latin word
  after each no longer meets a line that cannot fill.

Each says the same fact as before and as its other language. No pin moves and no citation changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. No behaviour of the repository's checks changes.

## Impact

`publications/{architecture-publisher,filmkit,openai-responses-proxy}/en/model.json` and
`publications/{ethos,architecture-publisher,openai-responses-proxy}/zh/model.json`: seven summaries.
`CHANGELOG.md`. The editions are rebuilt.
