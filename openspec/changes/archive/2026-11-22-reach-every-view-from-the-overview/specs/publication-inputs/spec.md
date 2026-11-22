## ADDED Requirements

### Requirement: Every view is reached from its work's overview

Each view a work's model declares, in each of its languages, SHALL be named by
an element of the work's overview statement: a step, a station, a block or a
further course that carries the view's id as `view`.

#### Scenario: A view the overview names

- **WHEN** a work's model declares a view and a block of its overview carries
  that view's id as `view`
- **THEN** the work passes

#### Scenario: A view the overview names nowhere

- **WHEN** a work's model declares a view that no element of its overview names
- **THEN** the input check fails for that work
