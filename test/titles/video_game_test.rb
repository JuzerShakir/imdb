# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class TestVideoGame < TestHelper
  ID = "tt2140553" # the last of us

  def test_imdb_id
    super @title.imdb_id
    assert_equal("tt2140553", @title.imdb_id)
  end

  def test_title
    super @title.title
    assert_equal("The Last of Us", @title.title)
  end

  def test_tagline = super @title.tagline

  def test_genres = super @title.genres

  def test_ratings = super @title.ratings

  def test_popularity = super @title.popularity

  def test_release_date
    super @title.release_date
    assert_equal("June 14, 2013 (United States)", @title.release_date)
  end

  def test_duration
    assert_raises(NoMethodError) { @title.duration }
  end

  def test_casts = super @title.casts

  def test_directors = super @title.directors

  def test_production_companies = super @title.production_companies

  def test_instance_of_class
    assert_kind_of(VideoGame, @title)
  end
end
