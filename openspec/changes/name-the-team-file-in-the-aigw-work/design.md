## Context

See [proposal.md](proposal.md). The page of the same work already names `team.toml` four times, from the product's
README and from `manifests/team.toml` itself; the edition's two places that speak of the team file did not.

## Goals / Non-Goals

**Goals:**

- A reader of the edition finds the team file by its name where the edition speaks of it.

**Non-Goals:**

- Any other wording of the work. What its limits say and how its questions repeat their titles are other findings
  of the same reading and are not touched here.

## Decisions

1. The scope names the tracked file with its directory; the overview names the file as the command takes it.
   - Rests on: the product's README at v0.8.2, which tracks the file as `manifests/team.toml` and has a team save
     it as a local `team.toml` and run `aigw setup --from team.toml`; the owner's question of 2026-11-19 21:05.
   - Considered: the block's title naming the file. A team may keep its file under any name, and the title speaks
     of team files in general; the command is where the product's own text fixes a name.
   - Chosen because: each place then says what the source says at that place, and the overview's block still fits
     its page (built with Architecture Publisher 0.15.0 before the Change was proposed).
   - Applies to: the AIGW Client work, both languages.

## Risks / Trade-offs

- A longer command in the overview's block could push the page past its height; the build of the Chinese edition
  at the changed words stays on one page.
