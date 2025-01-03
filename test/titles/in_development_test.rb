# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class TitleInDevelopmentTest < TestHelper
  ID = "tt4576032" # blade

  def test_title = super(title.title, "300: The Resurgence")

  def test_tagline
    tagline = title.tagline

    assert(tagline.is_a?(String) || tagline.nil?)
  end

  def test_ratings = assert_nil(title.ratings)

  def test_popularity = assert_nil(title.popularity)

  def test_release_date = assert_nil(title.release_date)
end
