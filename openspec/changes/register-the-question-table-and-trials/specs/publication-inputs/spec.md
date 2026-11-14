## ADDED Requirements

### Requirement: One question table

The repository SHALL hold one question table, `questions/question-table.json`, of the questions a work is
checked against. Each entry SHALL have an id unique in the table, the lens it belongs to, one of product,
architecture and project, the roles that ask it, newcomer or evaluator or both, and its question; an entry MAY
name the one genre of repository it applies to. A test SHALL refuse a table that breaks any of these.

#### Scenario: Two entries share an id

- **WHEN** the table holds two entries with the same id
- **THEN** the test fails and names the id

#### Scenario: An entry no role asks

- **WHEN** an entry names no role that asks it
- **THEN** the test fails and names the entry
