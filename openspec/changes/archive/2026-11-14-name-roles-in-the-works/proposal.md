## Why

The owner stated on 2026-11-14 that a role is objective and that a human, an agent or a team may hold it:
「角色是客观的，并且可以由带智能能力的人/agent/团队 来承担这个角色」. Looking at a plate of Architecture Publisher's
work he asked for 「人员」 to read 「角色」 and 「审阅人」 to read 「审阅者」, since an author or a reviewer need not be a
person. The work on the Responses proxy calls its operator 「运维人员」 in the same way, and the English work on
Architecture Publisher labels the same tier `People`.

## What Changes

- Architecture Publisher's Chinese work says 「角色」 for the tier of its author and reviewer and 「审阅者」 for the
  reviewer, in its model, overview, guide and term table; its English work labels the tier `Roles`.
- The Responses proxy's Chinese work says 「运维者」 for its operator, in its model, guide and term table.
- A test refuses 「人员」 and 「审阅人」 in a work's Chinese files and term table.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work's Chinese text names roles without presuming their holder is a person.

## Impact

`publications/architecture-publisher/` (`zh/model.json`, `zh/overview.typ`, `zh/guide/`, `en/model.json`,
`concepts.md`), `publications/openai-responses-proxy/` (`zh/model.json`, `zh/guide/`, `concepts.md`),
`tests/publication-inputs.test.mjs` and `CHANGELOG.md`. No citation, pin or view changes.
