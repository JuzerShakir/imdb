# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "test_helper"

# tests for custom exceptions
class Exceptions < Minitest::Test
  def test_invalid_url
    assert_raises(IMDb::InvalidURL) { IMDb::Title.new("http://www.example.com") }
    assert_raises(IMDb::InvalidURL) { IMDb::Title.new("https://www.imdb.com/title/tt549199490/") }
  end
end
