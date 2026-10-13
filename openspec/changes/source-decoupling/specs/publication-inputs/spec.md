## ADDED Requirements

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
