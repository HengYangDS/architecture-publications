## MODIFIED Requirements

### Requirement: A work may hold its overview composition

A work MAY hold one Typst composition beside its model when the model names it
in `overview`. The input check SHALL admit that file and SHALL fail a work
whose model names a composition the work lacks or a path outside the work's
directory. Beside its guide's directory, a work SHALL hold no file other than
the model, its README, a custody record and that composition.

#### Scenario: A named composition

- **WHEN** a work's model names `overview.typ` and the work holds that file
- **THEN** the work passes

#### Scenario: A named composition that is missing

- **WHEN** a work's model names `overview.typ` and the work does not hold it
- **THEN** the input check fails for that work

#### Scenario: An unnamed Typst file

- **WHEN** a work holds a `.typ` file its model does not name
- **THEN** the input check fails for that work

## ADDED Requirements

### Requirement: A work may hold its guide

A work MAY hold the guide its model names in `guide`: an Archify explainer
draft at `<directory>/<name>.archify.md`, in a directory of its own beside the
model. The input check SHALL admit that directory, and SHALL fail a work whose
model names a guide the work lacks or a path of another shape, or whose guide's
directory holds anything but regular files. Which files the draft names and
whether its citations hold remain the publisher's check.

#### Scenario: A named guide

- **WHEN** a work's model names `guide/guide.archify.md` and the work holds that
  draft and the diagram it names in `guide/`
- **THEN** the work passes

#### Scenario: A named guide that is missing

- **WHEN** a work's model names `guide/guide.archify.md` and the work does not
  hold it
- **THEN** the input check fails for that work

#### Scenario: A guide outside a directory of its own

- **WHEN** a work's model names `guide.archify.md`, `../guide/guide.archify.md`
  or `guide/parts/guide.archify.md`
- **THEN** the input check fails for that work

#### Scenario: An unnamed directory

- **WHEN** a work holds a directory its model does not name as its guide's
- **THEN** the input check fails for that work

#### Scenario: A link or a directory inside the guide's directory

- **WHEN** a work's guide directory holds a symbolic link or a directory
- **THEN** the input check fails for that work
