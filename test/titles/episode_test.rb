# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/imdb_title"

class TestEpisode < Minitest::Test
  open_wide = "https://www.imdb.com/title/tt9166672"
  EPISODE = IMDb::Title.new(open_wide)
end
