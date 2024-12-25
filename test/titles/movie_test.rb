# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Movie Module
class TestMovie < TestHelper
  ID = "tt0111161" # the shawshank redemption

  def test_imdb_id
    super @title.imdb_id
    assert_equal("tt0111161", @title.imdb_id)
  end

  def test_title
    super @title.title
    assert_equal("The Shawshank Redemption", @title.title)
  end

  def test_tagline = super @title.tagline

  def test_genres = super @title.genres

  def test_ratings = super @title.ratings

  def test_popularity = super @title.popularity

  def test_release_date
    super @title.release_date
    assert_equal("October 14, 1994 (India)", @title.release_date)
  end

  def test_duration
    duration = @title.duration
    assert_kind_of String, duration
    assert_equal("2 hours 22 minutes", duration)
  end

  def test_casts = super @title.casts

  def test_directors = super @title.directors

  def test_production_companies = super @title.production_companies

  def test_instance_of_class = assert_kind_of(Movie, @title)

  def test_budget
    assert_kind_of(String, @title.budget)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, @title.budget)
  end

  def test_revenue
    assert_kind_of(String, @title.revenue)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, @title.revenue)
  end
end
