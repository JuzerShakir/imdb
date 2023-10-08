# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "test_helper"

# tests against all the methods of NonInteractive Module
class TestNonInteractive < Minitest::Test
  @@episode, @@movie, @@tv = LoadMedia.non_interactive

  def test_duration
    # movie, tv_show, episode
    assert_equal("2 hours 22 minutes", @@movie.duration, "should return duration of the movie in string format")
  end
end
