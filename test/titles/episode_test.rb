# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Episode Module
class TestEpisode < Minitest::Test
  @@episode = LoadMedia.episode

  def test_inheritance
    assert_kind_of(Episode, @@episode)
  end
end
