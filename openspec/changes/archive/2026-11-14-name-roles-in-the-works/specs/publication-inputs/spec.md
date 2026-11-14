## ADDED Requirements

### Requirement: Works name roles, not kinds of holder

A work's Chinese text SHALL name a role by the role, as 「角色」, 「审阅者」 or 「运维者」, and SHALL NOT use 「人员」 or
「审阅人」, which presume that the role's holder is a person. A test SHALL refuse both words in every file of a
work's Chinese directory and in its term table.

#### Scenario: A tier of roles

- **WHEN** a Chinese model labels the tier of its author and reviewer
- **THEN** the label is 「角色」 and the test passes

#### Scenario: A reviewer named as a person

- **WHEN** a Chinese guide says 「审阅人」
- **THEN** the test fails and names the file and the line
