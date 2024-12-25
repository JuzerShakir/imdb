# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Movie Module
class TestMovie < TestHelper
  ID = "tt0111161" # the shawshank redemption

  def test_imdb_id
    id = title.imdb_id
    super id
    assert_equal(ID, id)
  end

  def test_title
    heading = title.title
    super heading
    assert_equal("The Shawshank Redemption", heading)
  end

  def test_tagline = super title.tagline

  def test_genres = super title.genres

  def test_ratings = super title.ratings

  def test_popularity = super title.popularity

  def test_release_date = super title.release_date

  def test_duration
    duration = title.duration
    assert_kind_of String, duration
    assert_equal("2 hours 22 minutes", duration)
  end

  def test_casts = super title.casts

  def test_directors = super title.directors

  def test_production_companies = super title.production_companies

  def test_instance_of_class = assert_kind_of(Movie, title)

  def test_budget
    budget = title.budget
    assert_kind_of(String, budget)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, budget)
  end

  def test_revenue
    revenue = title.revenue
    assert_kind_of(String, revenue)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, revenue)
  end
end
