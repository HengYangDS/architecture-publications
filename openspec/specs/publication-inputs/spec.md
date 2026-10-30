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

Each work SHALL hold exactly one Architecture Model that the current
Architecture Publisher reads, pinned to a full commit of the described
repository, citing at least one source with a SHA-256 digest for every
source, and an id no other work uses. The input check SHALL verify that
identity without running the publisher or the described product; validating
the model and its sources remains the publisher's check against a checkout of
the described repository.

#### Scenario: A work declares a usable model

- **WHEN** the input check reads a work whose model has the publisher's format
  and version, a full commit revision and a digest for every source
- **THEN** the work passes
- **AND** no publisher, source product or network is invoked

#### Scenario: A model is not pinned exactly

- **WHEN** a work's model declares another format or version, an abbreviated or
  missing revision, no source, or a source without a digest
- **THEN** the input check fails for that work

#### Scenario: Two works publish under one id

- **WHEN** two works declare the same model id
- **THEN** the input check fails

### Requirement: Model prose describes the architecture

A work's model text, its title, question, summary, scope, limits, view
questions and details, SHALL describe the architecture and what the model
covers and leaves out. It SHALL NOT state that sources were verified or by
which digest; the model's source digests and the publisher's manifest record
that evidence.

#### Scenario: A reader sees a work's limits

- **WHEN** a poster sets a work's scope and limits
- **THEN** they name what the model covers and leaves out
- **AND** no line claims that a source was verified

### Requirement: Every view has a title

Each view of a work SHALL declare a short title of its own, different from the
model's title, that names what the view shows, so that its poster, its page
panel, the page's list of panels and its full viewer name that view.

#### Scenario: A view without a title

- **WHEN** a work's model declares a view with a question but no title
- **THEN** the input check fails and names that view
