# frozen_string_literal: true

require_relative "../imdb"

class Movie < IMDb::Base
end

# # WORKS
charlie = IMDb::Base.new("https://www.imdb.com/title/tt7466810/") # movie
# godfather = Movie.new("https://www.imdb.com/title/tt0068646/") # movie
# spider_man = Movie.new("https://www.imdb.com/title/tt9362722/") # movie has multiple directors
# animal = Movie.new("https://www.imdb.com/title/tt13751694/") # will release movie
# justice = Movie.new("https://www.imdb.com/title/tt4121026") # movie with no release date
# planet_earth = Movie.new("https://www.imdb.com/title/tt5491994/") # TV Series
# episode1 = Movie.new("https://www.imdb.com/title/tt6142646/") # Episode w rating
# episode2 = Movie.new("https://www.imdb.com/title/tt4351260/") # Episode w/o rating
# game = Movie.new("https://www.imdb.com/title/tt6161168/")

p charlie.title
# p charlie.imdb_id
# p charlie.tagline
# p charlie.ratings
# p charlie.popularity
# p charlie.genres
# p charlie.revenue
# p charlie.budget
# p charlie.producers
# p charlie.directors
# p charlie.casts
# p charlie.duration

# SHOULD NOT WORK
# p IMDb::Movie.new("https://www.imdb.com/title/tt0111161590/")    # should not work
