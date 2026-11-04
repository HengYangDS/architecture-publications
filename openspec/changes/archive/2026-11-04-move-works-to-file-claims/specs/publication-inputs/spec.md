## MODIFIED Requirements

### Requirement: Each work is one pinned Architecture Model

Each work SHALL hold exactly one Architecture Model that the current
Architecture Publisher reads, pinned to a full commit of the described
repository, whose components claim at least one file, and an id no other work
uses. The input check SHALL verify that identity without running the
publisher or the described product; resolving the model's claims and cited
files at the revision and recording their digests remain the publisher's check
against a checkout of the described repository.

#### Scenario: A work declares a usable model

- **WHEN** the input check reads a work whose model has the publisher's format
  and version, a full commit revision and at least one claimed file
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

- **WHEN** a poster sets a work's scope and limits
- **THEN** they name what the model covers and leaves out
- **AND** no line claims that a source was verified
