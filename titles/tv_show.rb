# frozen_string_literal: true

require_relative "../imdb"

# Get all TV-show data by initializing fron this class
class TvShow < IMDb::Base
  def initialize(url)
    super
    raise TvShowTypeError, "#{url} is not a valid IMDb TV-show URL" unless is_a? "tv_show"
  end
end

# planet_earth = TvShow.new("https://www.imdb.com/title/tt5491994/") # TV TV-shows

# p planet_earth.url
# p planet_earth.title
# p planet_earth.imdb_id
# p planet_earth.tagline
# p planet_earth.ratings
# p planet_earth.popularity
# p planet_earth.genres
# p planet_earth.producers
# p planet_earth.directors
# p planet_earth.casts
# p planet_earth.duration
