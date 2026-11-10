## Why

The Film Kit work pins v0.16.0 (`d6de895`), and Film Kit has released v0.17.0 and v0.18.0 (`acc1eda`) since. Measured
with `archpub check --against v0.18.0`: seven commits, twelve modified files and two new ones in the scope, and of 101
citations 23 shifted and 5 touched.

Every other work calls its subject by the display name its project uses, the name of its GitLab project and of its
README. Film Kit's GitLab project has been named "Film Kit" since 1 November, at the owner's word, yet the work, its
README and the repository's list of works call it "filmkit".

The six term tables open under six forms of heading, one is introduced in Chinese and the rest in English, the
publisher's table names a revision three commits of the work older than its pin, and the DDWG table cites the film's
concept contract by a path on the editor's host.

## What Changes

- The Film Kit work pins v0.18.0 in both languages, with every citation at its new lines and every claim on a changed
  file read again.
- Prose names the work and its subject Film Kit; the package, its commands, paths and ids keep `filmkit`.
- Each term table opens as `# <title>: term renderings`, is introduced in English and names the work's pinned revision;
  the film repositories are cited by their public names at their releases.
- The input check refuses a README not headed by its English model's title or not naming its full revision, and a
  term table not headed by that title or not naming the revision's first seven characters.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work's README and term table name its title and its pinned revision.

## Impact

`publications/filmkit/`, the six works' `concepts.md`, `publications/ddwg/concepts.md`, the root `README.md`,
`tools/verification/publication-inputs.mjs`, its tests and `CHANGELOG.md`. The described repositories are unchanged.
