# frozen_string_literal: true

require_relative "../imdb"

# Get all TV-show data by initializing fron this class
class TvShow < IMDb::Base
  def initialize(url)
    super
    raise TvShowTypeError, "#{url} is not a valid IMDb TV-show URL" unless tv_show?
  end

  private

  def tv_show?
    @document.css("meta[property*=type]").attribute("content").value.include? "tv_show"
  end
end

# planet_earth = TvShow.new("https://www.imdb.com/title/tt5491994/") # TV Series
# episode1 = TvShow.new("https://www.imdb.com/title/tt6142646/") # Episode w rating
# episode2 = TvShow.new("https://www.imdb.com/title/tt4351260/") # Episode w/o rating

# p planet_earth.url
# p planet_earth.title
# p planet_earth.imdb_id
# p planet_earth.tagline
# p planet_earth.ratings
# p planet_earth.popularity
# p planet_earth.genres
# p planet_earth.revenue
# p planet_earth.budget
# p planet_earth.producers
# p planet_earth.directors
# p planet_earth.casts
# p planet_earth.duration
