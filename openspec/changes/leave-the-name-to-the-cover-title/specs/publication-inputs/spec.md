## MODIFIED Requirements

### Requirement: A work's summary does not open with its name

A work's question and summary, in each of its languages, SHALL open with what is
asked or done and not with the first word of the work's title, or the whole
title where the title has no space, because the cover sets the title directly
above them.

#### Scenario: A summary that opens with the work's name

- **WHEN** a work's model in any of its languages has a summary that begins with the first word of its title, as a word of its own
- **THEN** the input check fails for that work

#### Scenario: A question that opens with the work's name

- **WHEN** a work's model in any of its languages has a question that begins with the first word of its title, as a word of its own
- **THEN** the input check fails for that work

#### Scenario: A summary that opens with what the work does

- **WHEN** a work's question and summary begin with any other word
- **THEN** the work passes
