# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "test_helper"

# tests against all the methods in the IMDb::Title class for all types of media
class TestIMDbTitle < Minitest::Test
  @@episode, @@game, @@in_development, @@movie, @@tv = LoadMedia.all

  def test_casts
    # movie
    movie_casts = @@movie.casts
    assert_includes(movie_casts, "Tim Robbins")
    assert_equal(18, movie_casts.length)
    assert_instance_of(Array, movie_casts)
    # tv
    assert_includes(@@tv.casts, "Bryan Cranston")
    # episode
    assert_includes(@@episode.casts, "Philip Barantini")
    # game
    assert_includes(@@game.casts, "Troy Baker")
    # unreleased
    assert_nil(@@in_development.casts)
  end

  def test_directors
    # movie
    assert_equal(["Frank Darabont"], @@movie.directors)
    # tv
    assert_equal(["Vince Gilligan"], @@tv.directors)
    # episode
    assert_equal(["Johan Renck"], @@episode.directors)
    # game
    assert_equal(["Neil Druckmann", "Bruce Straley"], @@game.directors)
    # unreleased
    assert_nil(@@in_development.directors)
  end

  def test_genres
    # Movie
    assert_equal(["Drama"], @@movie.genres)
    # tv
    assert_equal(%w[Crime Drama Thriller], @@tv.genres)
    # episode
    assert_equal(%w[Drama History Thriller], @@episode.genres)
    # game
    assert_equal(%w[Action Adventure Drama], @@game.genres)
    # unreleased
    assert_equal(%w[Action Sci-Fi], @@in_development.genres)
  end

  def test_imdb_id
    # movie, tv, episode, game
    assert_equal("tt0111161", @@movie.imdb_id)
  end

  def test_popularity
    # movie, tv, episode
    assert_equal("2.8M", @@movie.popularity)
    # unreleased
    assert_nil(@@in_development.popularity)
  end

  def test_production_companies
    # movie
    assert_equal(["Castle Rock Entertainment"], @@movie.production_companies)
    # tv
    producers = @@tv.production_companies
    assert_includes(producers, "Gran Via Productions")
    assert_equal(3, producers.length)
    assert_instance_of(Array, producers)
    # episode
    assert_equal(["Sister Pictures"], @@episode.production_companies)
    # game
    assert_equal(["Naughty Dog"], @@game.production_companies)
    # unreleased
    assert_includes(@@in_development.production_companies, "DC Comics")
  end

  def test_ratings
    # movie, tv, episode
    assert_equal("9.3", @@movie.ratings)
    # unreleased
    assert_nil(@@in_development.ratings)
  end

  # def test_release_date
  #   # movie
  #   skip(assert_equal("October 14, 1994 (India)", @@movie.release_date))
  #   # tv
  #   skip(assert_equal("September 5, 2016 (India)", @@tv.release_date))
  #   # episode
  #   skip(assert_equal("May 20, 2019 (United States)", @@episode.release_date))
  #   # game
  #   skip(assert_equal("June 14, 2013 (United States)", @@game.release_date))
  #   # unreleased
  #   assert_nil(@@in_development.release_date)
  # end

  def test_tagline
    # movie, tv, episode, game, unreleased
    assert_includes(@@movie.tagline, "Over the course of several years")
  end

  def test_title
    # movie, tv, episode, game, unreleased
    assert_equal("The Shawshank Redemption", @@movie.title)
  end

  def test_url
    # movie, tv, episode, game, unreleased
    assert_equal("https://www.imdb.com/title/tt0111161/", @@movie.url)
  end
end
