# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/imdb_title"

class Exceptions < Minitest::Test
  INVALID_URL = "http://www.example.com"
  INVALID_ID = "https://www.imdb.com/title/tt549199490/"

  def test_invalid_url
    assert_raises(IMDb::InvalidURL) { IMDb::Title.new(INVALID_URL) }
    assert_raises(IMDb::InvalidURL) { IMDb::Title.new(INVALID_ID) }
  end
end
