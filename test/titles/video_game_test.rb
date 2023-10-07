# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/imdb_title"

class TestVideoGame < Minitest::Test
  the_last_of_us = "https://www.imdb.com/title/tt2140553"
  GAME = IMDb::Title.new(the_last_of_us)
end
