## ADDED Requirements

### Requirement: A work may hold its translations

A work MAY hold a translation in a directory named by a locale the publisher
reads: a model in that locale with the work's id and revision, the overview and
guide it names, and `concepts.md`, the table that fixes each term's rendering.
The input check SHALL fail a translation whose model names another locale, id or
revision, or that lacks its term table.

#### Scenario: A Chinese translation

- **WHEN** a work holds `zh-CN/` with a `zh-CN` model of the work's id and
  revision and its `concepts.md`
- **THEN** the work passes

#### Scenario: A translation that lags its original

- **WHEN** a translation's model names another revision than the work's model
- **THEN** the input check fails for that work

#### Scenario: A translation without a term table

- **WHEN** a work holds `zh-CN/` without `concepts.md`
- **THEN** the input check fails for that work
