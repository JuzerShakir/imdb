# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"
require_relative "../imdb_title_test"

# tests against all the methods of Movie Module
class TestMovie < Minitest::Test
  include Minitest::Hooks
  include TestIMDbTitle

  before(:all) { @movie = LoadMedia.movie }

  def test_imdb_id
    super @movie.imdb_id
    assert_equal("tt0111161", @movie.imdb_id)
  end

  def test_title
    super @movie.title
    assert_equal("The Shawshank Redemption", @movie.title)
  end

  def test_tagline = super @movie.tagline

  def test_genres = super @movie.genres

  def test_ratings = super @movie.ratings

  def test_popularity = super @movie.popularity

  def test_release_date
    super @movie.release_date
    assert_equal("October 14, 1994 (India)", @movie.release_date)
  end

  def test_casts = super @movie.casts

  def test_directors = super @movie.directors

  def test_production_companies = super @movie.production_companies

  def test_instance_of_class = assert_kind_of(Movie, @movie)

  def test_budget
    assert_kind_of(String, @movie.budget)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, @movie.budget)
  end

  def test_revenue
    assert_kind_of(String, @movie.revenue)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, @movie.revenue)
  end
end
