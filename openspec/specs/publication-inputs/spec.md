# publication-inputs Specification

## Purpose

Keep architecture publication inputs independently owned and reproducible
through pinned source objects, exact member custody and explicit editorial
identity, without drawing-specific code or effects in source products.

## Requirements

### Requirement: Source repositories remain read-only

Publication SHALL select explicit pinned source material without adding drawing
files, executing source-owned diagram code or changing source repository state.

#### Scenario: A source product has no diagram integration

- **WHEN** the external editor selects existing design and source objects
- **THEN** standard publication input is produced outside that product
- **AND** source Git state remains unchanged

### Requirement: Editorial identity is separate from source authority

Editorial input SHALL preserve selected source identity and qualifiers while
naming its independent editor. A rendered or mechanically valid work SHALL NOT
imply source endorsement or current implementation acceptance.

#### Scenario: Preserved input is published by an external editor

- **WHEN** an external work uses an exact original input
- **THEN** its origin and source pins remain inspectable
- **AND** editorial and source acceptance remain separately recorded

### Requirement: Preserved originals do not become active compatibility code

The editorial repository SHALL distinguish current local members from originals
retained in its exact Git preservation commit. Both SHALL keep their declared
member hashes. An original in a format the current publisher no longer reads
SHALL be retained in Git rather than kept as a current file. Input
qualification SHALL use native behavior, coverage, static analysis and
formatting without executing either source product.

#### Scenario: A removed adapter is needed for recovery

- **WHEN** a historical member is selected with Git storage
- **THEN** its original bytes are verified at the preservation commit
- **AND** the member is not required as executable code in the current worktree

#### Scenario: A work moves to the current model format

- **WHEN** a work's former inputs are recorded with Git storage
- **THEN** every recorded original verifies at the preservation commit
- **AND** the work's current files are only its model, its description and its
  custody record

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

### Requirement: Model prose describes the architecture

A work's model text, its title, question, summary, scope, limits, view
questions and details, SHALL describe the architecture and what the model
covers and leaves out. It SHALL NOT state that sources were verified or by
which digest; the publisher's manifest records each cited file's digest at the
pinned revision.

#### Scenario: A reader sees a work's limits

- **WHEN** the print edition sets a work's scope and limits
- **THEN** they name what the model covers and leaves out
- **AND** no line claims that a source was verified

### Requirement: Every view has a title

Each view of a work SHALL declare a short title of its own, different from the
model's title, that names what the view shows, so that its plate, its page
panel, the page's list of panels and its full viewer name that view.

#### Scenario: A view without a title

- **WHEN** a work's model declares a view with a question but no title
- **THEN** the input check fails and names that view

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

### Requirement: Every view has a summary

Each view of a work, in each of its languages, SHALL declare a summary that
answers the view's question from what its model says about the parts it shows,
so that a plate whose figure leaves part of the body explains that figure.

#### Scenario: A view without a summary

- **WHEN** a work's model in any of its languages declares a view with no
  summary, or one that is blank
- **THEN** the input check fails and names that view

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
