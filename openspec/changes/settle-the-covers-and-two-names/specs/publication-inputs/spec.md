## ADDED Requirements

### Requirement: A work's summary does not open with its name

A work's summary, in each of its languages, SHALL open with what the work does
and not with the first word of the work's title, or the whole title where the
title has no space, because the cover sets the title directly above it.

#### Scenario: A summary that opens with the work's name

- **WHEN** a work's model in any of its languages has a summary that begins with the first word of its title, as a word of its own
- **THEN** the input check fails for that work

#### Scenario: A summary that opens with what the work does

- **WHEN** a work's summary begins with any other word
- **THEN** the work passes
