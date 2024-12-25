# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"
require_relative "../imdb_title_test"

# tests against all the methods of TvShow Module
class TestTvShow < Minitest::Test
  include Minitest::Hooks
  include TestIMDbTitle

  before(:all) { @tv = LoadMedia.tv }

  def test_imdb_id
    super @tv.imdb_id
    assert_equal("tt0903747", @tv.imdb_id)
  end

  def test_title
    super @tv.title
    assert_equal("Breaking Bad", @tv.title)
  end

  def test_tagline = super @tv.tagline

  def test_genres = super @tv.genres

  def test_ratings = super @tv.ratings

  def test_popularity = super @tv.popularity

  def test_release_date
    super @tv.release_date
    assert_equal("September 5, 2016 (India)", @tv.release_date)
  end

  def test_duration
    duration = @tv.duration
    assert_kind_of String, duration
    assert_equal("45 minutes", duration)
  end

  def test_casts = super @tv.casts

  def test_directors = super @tv.directors

  def test_production_companies = super @tv.production_companies

  def test_instance_of_class
    assert_kind_of(TvShow, @tv)
  end
end
