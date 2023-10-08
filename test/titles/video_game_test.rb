# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class TestVideoGame < Minitest::Test
  @@game = LoadMedia.game

  def test_inheritance
    assert_kind_of(VideoGame, @@game)
  end
end
