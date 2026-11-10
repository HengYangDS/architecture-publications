## Context

See [proposal.md](proposal.md). The input check reads each work's files, languages and models offline; it does not run
the publisher or reach a Forge. `archpub check --repo` resolves every claim and citation at the pinned revision, and
`--against <tag>` lists what a new pin moves.

## Goals / Non-Goals

**Goals:**

- The Film Kit work describes Film Kit's latest release.
- Each subject is named in prose as its project names it.
- A README and a term table that a new pin leaves behind fail the input check.

**Non-Goals:**

- Checking offline that a pin is its repository's latest release: that needs the Forge, and `archpub check --against`
  measures it.
- Film Kit's own README, which titles itself `filmkit`: the film session owns that repository and has been told.

## Decisions

- **Display name in prose, slug in code.** Film Kit names the product and the work in titles, headings, sentences,
  labels and the list of works, in both languages; Chinese keeps it in Latin type, as it keeps OpenAI Responses Proxy.
  `filmkit` stays where it is an identifier: the package and its imports, commands, paths, the model id and the
  repository's name.
- **One heading for the term tables:** `# <title>: term renderings`, the English model's title followed by what the
  table holds, as the README describes it. The introduction is English, as every repository document is.
- **Pins named where a reader meets them.** The README names the full revision and the term table its first seven
  characters; the input check reads both against the English model. The table's rows were checked at the pin: for the
  publisher's table, no file it cites changed the term between `548637cc` and v0.10.2.
- **Film repositories by public name and release.** `ethos-film` v1.0.1 (`c33e60f`) and
  `data-department-work-guidelines-film` v1.2.0 (`f286c43`), whose `content/concepts.toml` is unchanged since the
  contract the DDWG table cites.
- **Claims read again on every changed file.** The 23 shifted citations move by the worklist; the five touched ranges,
  and the eight components and twelve relations on modified files, are read at v0.18.0 and changed only where the
  source now says otherwise: the motion audit's jumps at stage cuts and dash snaps, the 1080p films' keyframe every
  2 s, and 112 files in scope.

## Risks / Trade-offs

- [The check holds only what the inputs say, not what is current] → The standing comparison with each repository's
  latest release stays a step of every report.
