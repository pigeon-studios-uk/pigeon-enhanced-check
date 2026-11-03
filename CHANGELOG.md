# Changelog

All notable changes to Pigeon Enhanced Check are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration, database or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

<!--
How to use this file:
- Add every change under "Unreleased" as you make it, in the right group:
  Added · Changed · Deprecated · Removed · Fixed · Security
- When releasing, rename "Unreleased" to the version and date (YYYY-MM-DD), add a fresh empty "Unreleased" above it,
  and update the comparison links at the bottom.
- Write for server owners: what changed for them, not how the code changed.
- Credit contributors with their username, e.g. "(thanks @username)".
- Security fixes: say what's fixed and that owners should update, without describing how to exploit it.
- On GitLab, the comparison links at the bottom use https://gitlab.com/pigeon-studios/<subgroup>/<project>/-/compare/v1.0.0...HEAD
  and /-/tags/v1.0.0 instead.
-->

## [Unreleased]

### Added

### Changed

### Fixed

<!--
Example of a full release entry:

## [1.3.0] - 2026-11-02

### Upgrade notes

- Run `sql/migrations/1.3.0.sql` before restarting.
- `Config.Cooldown` is now in seconds, not milliseconds. Divide your value by 1000.

### Added

- Discord logging for admin actions, with a webhook set in `configuration/server.lua`.
- German translation (thanks @username).

### Changed

- The roll animation now plays for nearby players too.

### Fixed

- Cooldown didn't reset after a player reconnected.

### Security

- Fixed a server event that didn't check the player's job. All servers should update.
-->

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-enhanced-check/commits/main
