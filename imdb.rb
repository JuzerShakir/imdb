# frozen_string_literal: true

module IMDb
  # Extracts all metadata of a Movie (URL passed as first argument) from IMDb website
  class Movie
    attr_accessor :url

    def initialize(url)
      @url = url
      # p link.match?(/\Ahttps:\/\/www.imdb.com\/title\/tt(\d+)/i)
    end

    private

    # def validate(link)
    #   id = link[/tt\d+/]&.length
    #   raise ArgumentError, "Invalid IMDb URL: #{link}" unless id

    #   id.between?(7, 8)
    # end
  end
end

# IMDb::Movie.new("https://www.imdb.com/title/tt7466810/?ref_=wl_li_tt")    # should work
# IMDb::Movie.new("https://www.imdb.com/title/tt0111161590/")    # should not work
p IMDb::Movie.new("https://").url
