<div align="center">
  <!-- <img src="logo.png"/> -->
  <h2>IMDb</h2>
</div>

<!-- BADGES -->

[![Gem Version](https://badge.fury.io/rb/imdb_title.svg)](https://badge.fury.io/rb/imdb_title)
[![Tests](https://github.com/JuzerShakir/imdb/workflows/Tests/badge.svg)](https://github.com/JuzerShakir/imdb/actions?query=workflow%3ATests)
[![Maintainability](https://api.codeclimate.com/v1/badges/34e771dd961cd0f7a5d4/maintainability)](https://codeclimate.com/github/JuzerShakir/imdb/maintainability)

<!-- [![Test Coverage](https://api.codeclimate.com/v1/badges/34e771dd961cd0f7a5d4/test_coverage)](https://codeclimate.com/github/JuzerShakir/imdb/test_coverage) -->

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

or run this command in your console to install gem locally:

```ruby
gem install imdb_title
```

## Usage

### Here's an example

```ruby
require 'imdb_title'

# input a valid URL of any Movie, Tv-Show, Episode or Game from imdb.com
movie = IMDb::Title.new("https://www.imdb.com/title/tt0111161")

movie.title                 #=> The Shawshank Redemption
movie.tagline               #=> Over the course of several years, two convicts...
movie.genres                #=> ["Drama"]
movie.revenue               #=> $28,884,716

movie.ancestors           #=> [IMDb::Title, Object, PP::ObjectMixin, ...]
movie.singleton_class.ancestors            #=> <Class:#<IMDb::Title:0x00007f4a0bf22a40>>, Movie, NonInteractive, IMDb::Title, Object, PP::ObjectMixin, ...]
```

---

### Available Methods

<details>
  <summary>
    <b>ALL title types</b>
  </summary>
  <ol>
    <li>title</li>
    <li>tagline</li>
    <li>genres</li>
    <li>ratings</li>
    <li>popularity</li>
    <li>directors</li>
    <li>production_companies</li>
    <li>casts</li>
    <li>release_date</li>
    <li>imdb_id</li>
    <li>url</li>
  </ol>
</details>

<br>

<details>
  <summary>
    <b>ALL title types EXCEPT Game</b>
  </summary>
  <ol>
    <li>duration</li>
  </ol>
</details>

<br>

<details>
  <summary>
    <b>ONLY for Movie title</b>
  </summary>
  <ol>
    <li>budget</li>
    <li>revenue</li>
  </ol>
</details>

---

### Return Types

<details>
  <summary>
    <b>Array types:</b>
  </summary>
  <ol>
    <li>casts</li>
    <li>genres</li>
    <li>directors</li>
    <li>production_companies</li>

  </ol>
</details>

<br>

> All other methods will return `string` type.

## Contributing

If you have problems, please create a [GitHub Issue](https://github.com/JuzerShakir/imdb/issues).

Take a look at the [Contributing](CONTRIBUTING.md) document for
instructions on setting up the repo on your machine, understanding the codebase,
and creating a good pull request.

Thank you, contributors!

## Versioning

ImdbTitle follows Semantic Versioning 2.0 as defined at <https://semver.org>.

## License

This code is free to use under the terms of the MIT license.
