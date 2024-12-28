# Changelog

## [v0.1.0](https://github.com/JuzerShakir/imdb/tree/v0.0.14) (2024-12-28)

First Minor Upgrade 🥳

This version includes following changes:

- Update Unit Tests & Add new rake tasks for testing individual titles in [#3](https://github.com/JuzerShakir/imdb/pull/3)
- Record HTTP interactions with VCR in [#4](https://github.com/JuzerShakir/imdb/pull/4)
- Modify Linting Configuration in [#5](https://github.com/JuzerShakir/imdb/pull/5)
- Upgrade dependencies in [#6](https://github.com/JuzerShakir/imdb/pull/6)
- Update Inheritance in [#7](https://github.com/JuzerShakir/imdb/pull/7)
- Update Documentation in [#8](https://github.com/JuzerShakir/imdb/pull/8)

**Full Changelog**: [v0.0.13...v0.1.0](https://github.com/JuzerShakir/imdb/compare/v0.0.13...v0.1.0)

---

## [v0.0.13](https://github.com/JuzerShakir/imdb/tree/v0.0.13) (2023-10-08)

A new patch release! 🎉

This version includes following changes:

- Update Comments.
- Init `test/test_helper.rb` file that will load all dependencies required to perform tests.
- Init `lib/helper.rb` file to load all libraries & files required to run code logic.
- Replace all constants with class variables.

---

## [v0.0.12](https://github.com/JuzerShakir/imdb/tree/v0.0.12) (2023-10-07)

A new patch release! 🎉

This version includes following changes:

- Initiate GitHub Continuous Integration (CI) workflow that builds & tests this application.
- Create descriptive comments for all the Test classes.
- Add `DuplicateMethodCall` and `TooManyStatements` configuration to `.reek.yml`.
- Add assertions to existing tests and create inheritance tests for each media type.
- Add rake task to check for linting & code smell issues with a single command.

---

## [v0.0.11](https://github.com/JuzerShakir/imdb/tree/v0.0.11) (2023-10-07)

A new patch release! 🎉

This version includes following changes:

- Fetch for `Creators` for Tv media type as they're named as that instead of `Directors`.
- Create test suites & setup rake task for it.
- Mention dependency gems in `Gemfile` rather then `imdb_title.gemspec` file.

---

## [v0.0.10](https://github.com/JuzerShakir/imdb/tree/v0.0.10) (2023-10-06)

A new **MUST UPDATE** patch release! 🎉

This version includes following changes:

- **Major Bug fix** - If a `game` media-type instance has been initialized then the `duration` method will not work for other media-type instances that are created after.
  - To solve the above issue, we created a different module named `non_interactive` which will `prepend` in all modules under `titles\` directory except the `VideoGame` module.
  - Shift the `duration` method from `IMDb::Title` class to `NonInteractive` module.
- Remove `split_these` & `inspect_this` methods from `IMDb::Title` class
- Rename `UnSupportedTypeError` to `UnSupportedMediaType`.
- Update few methods to return an array type else `nil` if it doesn't exist.
- Update comments for better documentation.
- Add `.reek.yml` file to ignore smell detectors in edge cases.

---

## [v0.0.9](https://github.com/JuzerShakir/imdb/tree/v0.0.9) (2023-10-04)

A new patch release! 🎉

This version includes following changes:

- removes `.ruby-version` file.
- specify `required_ruby_version` in `.imdb_title.gemspec` file & `TargetRubyVersion` in `.rubocop.yml`.
- sort all the files in ascending order before requiring them from `lib` directory
- Add `CHANGELOG.md` file to document all the changes made to the gem.
- Specify link of `CHANGELOG.md` file & link to [github issues](https://github.com/JuzerShakir/imdb/issues) in metadata hash in `.imdb_title.gemspec` file.
- Remove `GPL-2.0` license.
- Add `README.md` file.
- Update description of the Gem in `.imdb_title.gemspec` file.
