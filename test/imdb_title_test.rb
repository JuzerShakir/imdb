# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/imdb_title"

class TestIMDbTitle < Minitest::Test
  shawshank_redemption = "https://www.imdb.com/title/tt0111161/"
  MOVIE = IMDb::Title.new(shawshank_redemption)

  breaking_bad = "https://www.imdb.com/title/tt0903747"
  TV = IMDb::Title.new(breaking_bad)

  open_wide = "https://www.imdb.com/title/tt9166672"
  EPISODE = IMDb::Title.new(open_wide)

  the_last_of_us = "https://www.imdb.com/title/tt2140553"
  GAME = IMDb::Title.new(the_last_of_us)

  justice_league = "https://www.imdb.com/title/tt4121026"
  UNRELEASED = IMDb::Title.new(justice_league)

  def test_casts
    # movie
    assert_includes(MOVIE.casts, "Tim Robbins")
    assert_equal(18, MOVIE.casts.length)
    # tv
    assert_includes(TV.casts, "Bryan Cranston")
    # episode
    assert_includes(EPISODE.casts, "Philip Barantini")
    # game
    assert_includes(GAME.casts, "Troy Baker")
    # unreleased
    assert_nil(UNRELEASED.casts)
  end

  def test_directors
    # movie
    assert_equal(["Frank Darabont"], MOVIE.directors)
    # tv
    assert_equal(["Vince Gilligan"], TV.directors)
    # episode
    assert_equal(["Johan Renck"], EPISODE.directors)
    # game
    assert_equal(["Neil Druckmann", "Bruce Straley"], GAME.directors)
    # unreleased
    assert_nil(UNRELEASED.directors)
  end

  def test_genres
    # Movie
    assert_equal(["Drama"], MOVIE.genres)
    # tv
    assert_equal(%w[Crime Drama Thriller], TV.genres)
    # episode
    assert_equal(%w[Drama History Thriller], EPISODE.genres)
    # game
    assert_equal(%w[Action Adventure Drama], GAME.genres)
    # unreleased
    assert_equal(%w[Action Sci-Fi], UNRELEASED.genres)
  end

  def test_imdb_id
    # movie, tv, episode, game
    assert_equal("tt0111161", MOVIE.imdb_id)
  end

  def test_popularity
    # movie, tv, episdoe
    assert_equal("2.8M", MOVIE.popularity)
    # unreleased
    assert_nil(UNRELEASED.popularity)
  end

  def test_production_companies
    # movie
    assert_equal(["Castle Rock Entertainment"], MOVIE.production_companies)
    # tv
    assert_includes(TV.production_companies, "Gran Via Productions")
    assert_equal(3, TV.production_companies.length)
    # episode
    assert_equal(["Sister Pictures"], EPISODE.production_companies)
    # game
    assert_equal(["Naughty Dog"], GAME.production_companies)
    # unreleased
    assert_includes(UNRELEASED.production_companies, "DC Comics")
  end

  def test_ratings
    # movie, tv, episode
    assert_equal("9.3", MOVIE.ratings)
    # unreleased
    assert_nil(UNRELEASED.ratings)
  end

  def test_release_date
    # movie
    skip(assert_equal("October 14, 1994 (India)", MOVIE.release_date))
    # tv
    skip(assert_equal("September 5, 2016 (India)", TV.release_date))
    # episode
    skip(assert_equal("May 20, 2019 (United States)", EPISODE.release_date))
    # game
    skip(assert_equal("June 14, 2013 (United States)", GAME.release_date))
    # unreleased
    assert_nil(UNRELEASED.release_date)
  end

  def test_tagline
    # movie, tv, episode, game, unreleased
    assert_includes(MOVIE.tagline, "Over the course of several years")
  end

  def test_title
    # movie, tv, episode, game, unreleased
    assert_equal("The Shawshank Redemption", MOVIE.title)
  end

  def test_url
    # movie, tv, episode, game, unreleased
    assert_equal("https://www.imdb.com/title/tt0111161/", MOVIE.url)
  end
end
