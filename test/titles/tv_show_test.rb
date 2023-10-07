# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/imdb_title"

# tests against all the methods of TvShow Module
class TestTvShow < Minitest::Test
  breaking_bad = "https://www.imdb.com/title/tt0903747"
  TV = IMDb::Title.new(breaking_bad)

  def test_inheritance
    assert_kind_of(TvShow, TV)
  end
end
