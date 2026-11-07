# Changelog

All notable changes to Pigeon Enhanced Check are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

## [1.1.0] - 2026-11-07

### Added

- 22 more languages, so it now comes in 23: Czech, Danish, German, Spanish, Estonian, Finnish, French, Croatian, Hungarian, Indonesian, Italian, Dutch, Norwegian, Polish, Portuguese, Brazilian Portuguese, Romanian, Slovenian, Swedish, Turkish, and Simplified and Traditional Chinese.
- `Config.Locale = 'auto'`, the new default: it follows ox_lib's language (`setr ox:locale "de"` in `server.cfg`) and is English when that isn't set. A config that already says `'en'` stays in English.

## [1.0.0] - 2026-11-03

First release.

### Highlights

- Every started resource and the server's settings checked for FiveM for GTAV Enhanced
- Blockers, changes, reviews and notes, each with what to do
- Files and line numbers in the saved report
- Every check based on Cfx.re's documentation
- Read-only: changes nothing, sends nothing

### Added

- A check of every started resource and the server's settings for what changes in FiveM for GTAV Enhanced, based on Cfx.re's documentation, sorted into blockers, things to change, things to review and notes, each with what to do.
- Blockers: escrowed resources and resource builders.
- To change: OneSync off or in legacy mode, Legacy models and textures in `stream/` with no `stream_enhanced/`, C# resources, Mumble voice natives, removed voice convars, NUI calls to other resources' callbacks, server key-value storage, and developer mode through `moo`.
- To review: data kept per player ID in resources that never handle `playerDropped`, and an enforced game build.
- Notes: resources that only use the deprecated `stream/` folder, state bag handlers, convars that do nothing, and `sv_useAccurateSends` turned off.
- A summary in the console when the server starts, the full report with the `enhancedcheck` command, and `enhancedcheck <resource>` for one resource.
- The full report saved to `enhanced-report.txt`, with the files and line numbers each finding came from and a list of things to check by hand.
- Folders listed with the sandbox's `io.readdir`, or `dir` and `ls` on older artifacts.
- `Config.IncludeStopped` and `Config.Ignore` to choose what's checked.
- Every message in `locales/`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-enhanced-check/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/pigeon-studios-uk/pigeon-enhanced-check/releases/tag/v1.1.0
[1.0.0]: https://github.com/pigeon-studios-uk/pigeon-enhanced-check/releases/tag/v1.0.0
