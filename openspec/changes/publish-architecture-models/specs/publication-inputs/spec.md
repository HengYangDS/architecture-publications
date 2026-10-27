## ADDED Requirements

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

## MODIFIED Requirements

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
