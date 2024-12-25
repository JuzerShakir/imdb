# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"
require_relative "../imdb_title_test"

# tests against all the methods of VideoGame Module
class TestTitleInDevelopment < Minitest::Test
  include Minitest::Hooks
  include TestIMDbTitle

  before(:all) { @dev = LoadMedia.in_development }

  def test_imdb_id
    super @dev.imdb_id
    assert_equal("tt10671440", @dev.imdb_id)
  end

  def test_title
    super @dev.title
    assert_equal("The Blade", @dev.title)
  end

  def test_tagline
    assert(@dev.tagline.is_a?(String) || @dev.tagline.nil?)
  end

  def test_genres
    assert(@dev.genres.is_a?(Array) || @dev.genres.nil?)
  end

  def test_ratings
    assert_nil(@dev.ratings)
  end

  def test_popularity
    assert_nil(@dev.popularity)
  end

  def test_release_date
    assert_nil(@dev.release_date)
  end

  def test_casts
    assert(@dev.casts.is_a?(Array) || @dev.casts.nil?)
  end

  def test_directors
    assert(@dev.directors.is_a?(Array) || @dev.directors.nil?)
  end

  def test_production_companies
    assert(@dev.production_companies.is_a?(Array) || @dev.production_companies.nil?)
  end
end
