# frozen_string_literal: true

require_relative "../imdb"

# Get all Episode data by initializing fron this class
class Episode < IMDb::Base
  def initialize(url)
    super
    raise EpisodeTypeError, "#{url} is not a valid IMDb Episode URL" unless is_a? "episode"
  end
end

# episode1 = Episode.new("https://www.imdb.com/title/tt6142646/") # Episode w rating
# episode2 = Episode.new("https://www.imdb.com/title/tt4351260/") # Episode w/o rating

# p episode1.url
# p episode1.title
# p episode1.imdb_id
# p episode1.tagline
# p episode1.ratings
# p episode1.popularity
# p episode1.genres
# p episode1.producers
# p episode1.directors
# p episode1.casts
# p episode1.duration
