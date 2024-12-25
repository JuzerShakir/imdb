# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of TvShow Module
class TestTvShow < TestHelper
  ID = "tt0903747" # breaking bad

  def test_imdb_id
    id = title.imdb_id
    super id
    assert_equal(ID, id)
  end

  def test_title
    heading = title.title
    super heading
    assert_equal("Breaking Bad", heading)
  end

  def test_tagline = super title.tagline

  def test_genres = super title.genres

  def test_ratings = super title.ratings

  def test_popularity = super title.popularity

  def test_release_date = super title.release_date

  def test_duration
    duration = title.duration
    assert_kind_of String, duration
    assert_equal("45 minutes", duration)
  end

  def test_casts = super title.casts

  def test_directors = super title.directors

  def test_production_companies = super title.production_companies

  def test_instance_of_class
    assert_kind_of(TvShow, title)
  end
end
