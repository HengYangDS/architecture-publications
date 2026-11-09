## MODIFIED Requirements

### Requirement: Each work is one pinned Architecture Model

Each work SHALL hold, in each of its languages, one Architecture Model that the
current Architecture Publisher reads, every one pinned to the same full commit
of the described repository, claiming at least one file, under one id no other
work uses. The input check SHALL verify that identity without running the
publisher or the described product; resolving claims and cited files at the
revision remains the publisher's check against a checkout.

#### Scenario: A work declares a usable model

- **WHEN** the input check reads a work whose model in each language has the
  publisher's format and version, a full commit revision and at least one
  claimed file
- **THEN** the work passes
- **AND** no publisher, source product or network is invoked

#### Scenario: A model is not pinned exactly

- **WHEN** a work's model declares another format or version, an abbreviated or
  missing revision, or no claimed file
- **THEN** the input check fails for that work

#### Scenario: Two works publish under one id

- **WHEN** two works declare the same model id
- **THEN** the input check fails

### Requirement: A work may hold its overview composition

A work MAY hold one Typst composition beside each of its models when the model
names it in `overview`. The input check SHALL admit that file and SHALL fail a
work whose model names a composition its language directory lacks or a path
outside that directory. Beside its guide's directory, a language directory
SHALL hold no file other than its model and that composition.

#### Scenario: A named composition

- **WHEN** a work's model names `overview.typ` and its language directory holds
  that file
- **THEN** the work passes

#### Scenario: A named composition that is missing

- **WHEN** a work's model names `overview.typ` and its language directory does
  not hold it
- **THEN** the input check fails for that work

#### Scenario: An unnamed Typst file

- **WHEN** a language directory holds a `.typ` file its model does not name
- **THEN** the input check fails for that work

### Requirement: Every view has a summary

Each view of a work, in each of its languages, SHALL declare a summary that
answers the view's question from what its model says about the parts it shows,
so that a plate whose figure leaves part of the body explains that figure.

#### Scenario: A view without a summary

- **WHEN** a work's model in any of its languages declares a view with no
  summary, or one that is blank
- **THEN** the input check fails and names that view

## ADDED Requirements

### Requirement: A work holds each of its languages in a directory of its own

A work SHALL hold each of its languages, the source language included, in a
directory named by its model's language: the locale's language subtag,
lowercase, such as `en/` and `zh/`. Every language directory SHALL hold the
same files at the same paths, and every model SHALL name its locale and the
work's id and revision. Beside them a work SHALL hold only its README, an
optional custody record and, in more than one language, `concepts.md`, the
table of term renderings across them.

#### Scenario: A work in English and Chinese

- **WHEN** a work holds `en/` with an `en` model and `zh/` with a `zh-CN` model,
  both of the work's id and revision and with the same files, and holds
  `concepts.md` beside them
- **THEN** the work passes

#### Scenario: A directory not named by its model's language

- **WHEN** a work holds `zh-CN/`, or a `zh/` that holds an `en` model
- **THEN** the input check fails for that work

#### Scenario: Languages that hold different files

- **WHEN** `zh/` lacks a diagram that `en/` holds in its guide
- **THEN** the input check fails for that work

#### Scenario: A language that lags another

- **WHEN** the model in `zh/` names another revision than the model in `en/`
- **THEN** the input check fails for that work

#### Scenario: Two languages without a term table

- **WHEN** a work holds `en/` and `zh/` but no `concepts.md`
- **THEN** the input check fails for that work

#### Scenario: A model at the work's root

- **WHEN** a work holds `model.json` beside its language directories
- **THEN** the input check fails for that work

## REMOVED Requirements

### Requirement: A work may hold its translations

**Reason**: A translation's directory beside the original's files made one
language the work and the others its appendices; every language now has a
directory of its own with the same files.

**Migration**: Move each work's root model, overview and guide to `en/`, its
`zh-CN/` to `zh/` and `concepts.md` to the work's root, and name `en` in each
English model.
