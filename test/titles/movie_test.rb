# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/imdb_title"

# tests against all the methods of Movie Module
class TestMovie < Minitest::Test
  shawshank_redemption = "https://www.imdb.com/title/tt0111161/"
  MOVIE = IMDb::Title.new(shawshank_redemption)

  def test_budget
    assert_equal("$25,000,000", MOVIE.budget)
  end

  def test_revenue
    assert_equal("$28,884,716", MOVIE.revenue)
  end
end
