# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"
require_relative "../imdb_title_test"

# tests against all the methods of VideoGame Module
class TestVideoGame < Minitest::Test
  include Minitest::Hooks
  include TestIMDbTitle

  before(:all) { @game = LoadMedia.game }

  def test_imdb_id
    super @game.imdb_id
    assert_equal("tt2140553", @game.imdb_id)
  end

  def test_title
    super @game.title
    assert_equal("The Last of Us", @game.title)
  end

  def test_tagline = super @game.tagline

  def test_genres = super @game.genres

  def test_ratings = super @game.ratings

  def test_popularity = super @game.popularity

  def test_release_date
    super @game.release_date
    assert_equal("June 14, 2013 (United States)", @game.release_date)
  end

  def test_duration
    assert_raises(NoMethodError) { @game.duration }
  end

  def test_casts = super @game.casts

  def test_directors = super @game.directors

  def test_production_companies = super @game.production_companies

  def test_instance_of_class
    assert_kind_of(VideoGame, @game)
  end
end
