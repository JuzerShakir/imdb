# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/imdb_title"

# tests against all the methods of VideoGame Module
class TestVideoGame < Minitest::Test
  the_last_of_us = "https://www.imdb.com/title/tt2140553"
  GAME = IMDb::Title.new(the_last_of_us)

  def test_inheritance
    assert_kind_of(VideoGame, GAME)
  end
end
