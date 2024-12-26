# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class TitleInDevelopmentTest < TestHelper
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

  def test_ratings
    assert_nil(title.ratings)
  end

  def test_popularity
    assert_nil(title.popularity)
  end

  def test_release_date
    assert_nil(title.release_date)
  end

  def test_production_companies = super title.production_companies
end
