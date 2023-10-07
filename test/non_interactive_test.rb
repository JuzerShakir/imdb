# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/imdb_title"

class TestNonInteractive < Minitest::Test
  shawshank_redemption = "https://www.imdb.com/title/tt0111161/"
  MOVIE = IMDb::Title.new(shawshank_redemption)

  # breaking_bad = "https://www.imdb.com/title/tt0903747"
  # TV = IMDb::Title.new(breaking_bad)

  # open_wide = "https://www.imdb.com/title/tt9166672"
  # EPISODE = IMDb::Title.new(open_wide)

  def test_duration
    # movie, tv_show, episode
    assert_equal("2 hours 22 minutes", MOVIE.duration, "should return duration of the movie in string format")
  end
end
