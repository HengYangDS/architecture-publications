## ADDED Requirements

### Requirement: A work may hold its overview composition

A work MAY hold one Typst composition beside its model when the model names it
in `overview`. The input check SHALL admit that file, SHALL fail a work whose
model names a composition the work lacks or a path outside the work's
directory, and SHALL admit no file other than the model, its README, a custody
record and that composition.

#### Scenario: A named composition

- **WHEN** a work's model names `overview.typ` and the work holds that file
- **THEN** the work passes

#### Scenario: A named composition that is missing

- **WHEN** a work's model names `overview.typ` and the work does not hold it
- **THEN** the input check fails for that work

#### Scenario: An unnamed Typst file

- **WHEN** a work holds a `.typ` file its model does not name
- **THEN** the input check fails for that work
