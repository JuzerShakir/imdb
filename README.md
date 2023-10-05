<div align="center">
  <!-- <img src="logo.png"/> -->
  <h2>IMDb</h2>
</div>

<!-- BADGES -->
<!-- [![Tests](https://github.com/JuzerShakir/imdb/workflows/Tests/badge.svg)](https://github.com/JuzerShakir/imdb/actions?query=workflow%3ATests) -->

[![Gem Version](https://badge.fury.io/rb/imdb_title.svg)](https://badge.fury.io/rb/imdb_title)
[![Test Coverage](https://api.codeclimate.com/v1/badges/34e771dd961cd0f7a5d4/test_coverage)](https://codeclimate.com/github/JuzerShakir/imdb/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/34e771dd961cd0f7a5d4/maintainability)](https://codeclimate.com/github/JuzerShakir/imdb/maintainability)

Want to extract useful information about your favorite **Movies, TV shows, Episodes, and Games**?
Look no further than our data extraction library! All the information you need is a method call away.

## Quick links

- 📖 **[Read the documentation for the latest version][rubydocs].**
- 📢 **[See what's changed in recent versions][changelog].**

[rubydocs]: https://www.rubydoc.info/gems/imdb_title/
[changelog]: CHANGELOG.md

## Getting Started

Start by including `imdb_title` in your Gemfile:

```ruby
gem 'imdb_title'
```

Then run `bundle install`.

## Usage

```ruby
require 'imdb_title'

# input a valid URL of any Movie, Tv-Show, Episode or Game from imdb.com
movie = IMDb::Title.new("https://www.imdb.com/title/tt0111161")

movie.title                 #=> The Shawshank Redemption
movie.budget                #=> $25,000,000
movie.casts.first(2)        #=> ["Tim Robbins", "Morgan Freeman"]
movie.directors             #=> Frank Darabont
movie.duration              #=> 2 hours 22 minutes
movie.genres                #=> Drama
movie.imdb_id               #=> tt0111161
movie.popularity            #=> 2.8M
movie.production_companies  #=> Castle Rock Entertainment
movie.ratings               #=> 9.3
movie.release_date          #=> October 14, 1994 (India)
movie.revenue               #=> $28,884,716
movie.tagline               #=> Over the course of several years, two convicts...

```

These will return an `array` type if there are multiple names to output else `string` type:

1. `casts`
2. `production_companies`
3. `directors`
4. `genres`

All other methods will return `string` type.

> If any of the following features are not available or mentioned on IMDb for that particular title then it will return `nil`.

## Contributing

If you have problems, please create a [GitHub Issue](https://github.com/JuzerShakir/imdb/issues).

Take a look at the [Contributing](CONTRIBUTING.md) document for
instructions on setting up the repo on your machine, understanding the codebase,
and creating a good pull request.

Thank you, contributors!

## Versioning

ImdbTitle follows Semantic Versioning 2.0 as defined at https://semver.org.

## License

This code is free to use under the terms of the MIT license.
