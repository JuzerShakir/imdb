# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class TestTitleInDevelopment < TestHelper
  ID = "tt4576032" # blade

  def test_imdb_id
    id = title.imdb_id
    super id
    assert_equal(ID, id)
  end

  def test_title
    heading = title.title
    super heading
    assert_equal("300: The Resurgence", heading)
  end

  def test_tagline
    tagline = title.tagline
    assert(tagline.is_a?(String) || tagline.nil?)
  end

  def test_genres
    genres = title.genres
    assert(genres.is_a?(Array) || genres.nil?)
  end

  def test_ratings
    assert_nil(title.ratings)
  end

  def test_popularity
    assert_nil(title.popularity)
  end

  def test_release_date
    assert_nil(title.release_date)
  end

  def test_casts
    casts = title.casts
    assert(casts.is_a?(Array) || casts.nil?)
  end

  def test_directors
    directors = title.directors
    assert(directors.is_a?(Array) || directors.nil?)
  end

  def test_production_companies
    production_companies = title.production_companies
    assert(production_companies.is_a?(Array) || production_companies.nil?)
  end
end
