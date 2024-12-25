# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "test_helper"

# tests against all the methods in the IMDb::Title class for all types of media
class TestIMDbTitle < Minitest::Test
  @@episode, @@game, @@in_development, @@movie, @@tv = LoadMedia.all

  def test_casts
    assert_kind_of(Array, @@movie.casts)
    assert_kind_of(Array, @@tv.casts)
    assert_kind_of(Array, @@episode.casts)
    assert_kind_of(Array, @@game.casts)
    assert_kind_of(Array, @@in_development.casts)
    assert(@@in_development.casts.is_a?(Array) || @@in_development.casts.nil?)
  end

  def test_directors
    assert_kind_of Array, @@movie.directors
    assert_kind_of Array, @@tv.directors
    assert_kind_of Array, @@episode.directors
    assert_kind_of Array, @@game.directors
    assert(@@in_development.directors.is_a?(Array) || @@in_development.directors.nil?)
  end

  def test_genres
    assert_kind_of Array, @@movie.genres
    assert_kind_of Array, @@tv.genres
    assert_kind_of Array, @@episode.genres
    assert_kind_of Array, @@game.genres
    assert_kind_of Array, @@in_development.genres
    assert(@@in_development.genres.is_a?(Array) || @@in_development.genres.nil?)
  end

  def test_imdb_id
    # movie, tv, episode, game
    assert_equal("tt0111161", @@movie.imdb_id)
    assert_equal("tt0903747", @@tv.imdb_id)
    assert_equal("tt9166672", @@episode.imdb_id)
    assert_equal("tt2140553", @@game.imdb_id)
    assert_equal("tt10671440", @@in_development.imdb_id)
  end

  def test_popularity
    assert_match(/\A(\d+|\d+\.\d+)([kKmM])?\z/, @@movie.popularity)
    assert_match(/\A(\d+|\d+\.\d+)([kKmM])?\z/, @@tv.popularity)
    assert_match(/\A(\d+|\d+\.\d+)([kKmM])?\z/, @@episode.popularity)
    assert_match(/\A(\d+|\d+\.\d+)([kKmM])?\z/, @@game.popularity)
    assert_nil(@@in_development.popularity)
  end

  def test_production_companies
    assert_kind_of Array, @@movie.production_companies
    assert_kind_of Array, @@tv.production_companies
    assert_kind_of Array, @@episode.production_companies
    assert_kind_of Array, @@game.production_companies
    assert(@@in_development.production_companies.is_a?(Array) || @@in_development.production_companies.nil?)
  end

  def test_ratings
    assert_match(/\A\d+\.\d+\z/, @@movie.ratings)
    assert_match(/\A\d+\.\d+\z/, @@tv.ratings)
    assert_match(/\A\d+\.\d+\z/, @@episode.ratings)
    assert_match(/\A\d+\.\d+\z/, @@game.ratings)
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
    assert_kind_of String, @@movie.tagline
    assert_kind_of String, @@tv.tagline
    assert_kind_of String, @@episode.tagline
    assert_kind_of String, @@game.tagline
    assert(@@in_development.tagline.is_a?(String) || @@in_development.tagline.nil?)
  end

  def test_title
    assert_equal("The Shawshank Redemption", @@movie.title)
    assert_equal("Breaking Bad", @@tv.title)
    assert_equal("Open Wide, O Earth", @@episode.title)
    assert_equal("The Last of Us", @@game.title)
    assert_equal("The Blade", @@in_development.title)
  end
end
