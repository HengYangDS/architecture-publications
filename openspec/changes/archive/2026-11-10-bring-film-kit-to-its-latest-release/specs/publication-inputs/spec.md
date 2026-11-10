## ADDED Requirements

### Requirement: A work's README and term table name its subject and pin

A work's README SHALL open with its model's title as its heading and name the
full revision the work pins. Its term table SHALL open with that title followed
by ": term renderings" and name the revision's first seven characters. The
title is that of the model in English, or in the work's first language when it
has none.

#### Scenario: A README and a term table of the work's pin

- **WHEN** a work's README opens with `# Shop` and names its full revision, and
  its `concepts.md` opens with `# Shop: term renderings` and names the
  revision's first seven characters
- **THEN** the work passes

#### Scenario: A README left behind by a new pin

- **WHEN** a work's models pin a revision its README does not name
- **THEN** the input check fails for that work

#### Scenario: A term table under another heading

- **WHEN** a work's `concepts.md` opens with another heading than its title
  followed by ": term renderings"
- **THEN** the input check fails for that work
