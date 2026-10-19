# Design

## Context

`package.json` owns this repository's toolchain. Without a `name` field, npm names the root
package after the directory that holds `package.json` and records that name in
`package-lock.json`. `npm ci` installs from the lock; neither the input tests nor the formatting
gate read the name.

## Goals / Non-Goals

**Goals:** make `package-lock.json` independent of the checkout path.

**Non-Goals:** changing dependencies, scripts, the formatter settings or any publication.

## Decisions

- Use the repository name, `architecture-publications`, which is also the name npm writes in the
  canonical checkout.
- Regenerate the lock with npm instead of editing it, so npm remains the only writer of its own
  output.

## Risks / Trade-offs

- [A later checkout under another directory name] → The declared name takes precedence over the
  directory name, so npm writes the same lock there.
