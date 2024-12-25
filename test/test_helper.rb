# frozen_string_literal: true

require "minitest/autorun"
require "minitest/hooks"
require_relative "../lib/imdb_title"

module LoadMedia
  class << self
    def all
      [episode, game, in_development, movie, tv]
    end

    def episode
      open_wide = "https://www.imdb.com/title/tt9166672"
      IMDb::Title.new(open_wide)
    end

    def game
      the_last_of_us = "https://www.imdb.com/title/tt2140553"
      IMDb::Title.new(the_last_of_us)
    end

    def in_development
      blade = "https://www.imdb.com/title/tt10671440"
      IMDb::Title.new(blade)
    end

    def movie
      shawshank_redemption = "https://www.imdb.com/title/tt0111161/"
      IMDb::Title.new(shawshank_redemption)
    end

