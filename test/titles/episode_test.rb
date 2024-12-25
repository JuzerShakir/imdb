# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Episode Module
class TestEpisode < Minitest::Test
  include Minitest::Hooks
  include TestIMDbTitle

  URL = "https://www.imdb.com/title/tt9166672" # open wide, o earth

  before(:all) { @episode = IMDb::Title.new URL }

  def test_imdb_id
    super @episode.imdb_id
    assert_equal("tt9166672", @episode.imdb_id)
  end

  def test_title
    super @episode.title
    assert_equal("Open Wide, O Earth", @episode.title)
  end

  def test_tagline = super @episode.tagline

  def test_genres = super @episode.genres

  def test_ratings = super @episode.ratings

  def test_popularity = super @episode.popularity

  def test_release_date
    super @episode.release_date
    assert_equal("May 20, 2019 (United States)", @episode.release_date)
  end

  def test_duration
    duration = @episode.duration
    assert_kind_of String, duration
    assert_equal("1 hour 5 minutes", duration)
  end

  def test_casts = super @episode.casts

  def test_directors = super @episode.directors

  def test_production_companies = super @episode.production_companies

  def test_instance_of_class
    assert_kind_of(Episode, @episode)
  end
end
