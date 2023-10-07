# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/imdb_title"

# tests against all the methods of Episode Module
class TestEpisode < Minitest::Test
  open_wide = "https://www.imdb.com/title/tt9166672"
  EPISODE = IMDb::Title.new(open_wide)

  def test_inheritance
    assert_kind_of(Episode, EPISODE)
  end
end
