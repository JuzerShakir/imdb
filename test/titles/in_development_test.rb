# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class TestTitleInDevelopment < TestHelper
  ID = "tt10671440" # blade

  def test_imdb_id
    super @title.imdb_id
    assert_equal(ID, @title.imdb_id)
  end

  def test_title
    super @title.title
    assert_equal("The Blade", @title.title)
  end

  def test_tagline
    assert(@title.tagline.is_a?(String) || @title.tagline.nil?)
  end

  def test_genres
    assert(@title.genres.is_a?(Array) || @title.genres.nil?)
  end

  def test_ratings
    assert_nil(@title.ratings)
  end

  def test_popularity
    assert_nil(@title.popularity)
  end

  def test_release_date
    assert_nil(@title.release_date)
  end

  def test_casts
    assert(@title.casts.is_a?(Array) || @title.casts.nil?)
  end

  def test_directors
    assert(@title.directors.is_a?(Array) || @title.directors.nil?)
  end

  def test_production_companies
    assert(@title.production_companies.is_a?(Array) || @title.production_companies.nil?)
  end
end
