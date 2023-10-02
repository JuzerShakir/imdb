# frozen_string_literal: true

require_relative "../imdb"

# Get all movie data by initializing fron this class
class Movie < IMDb::Base
  def initialize(url)
    super
    raise MovieTypeError, "#{url} is not a valid IMDb Movie URL" unless movie?
  end

  private

  def movie?
    @document.css("meta[property*=type]").attribute("content").value.include? "movie"
  end
end

# # WORKS
# charlie = Movie.new("https://www.imdb.com/title/tt7466810/") # movie
# godfather = Movie.new("https://www.imdb.com/title/tt0068646/") # movie
# spider_man = Movie.new("https://www.imdb.com/title/tt9362722/") # movie has multiple directors
# animal = Movie.new("https://www.imdb.com/title/tt13751694/") # will release movie
# justice = Movie.new("https://www.imdb.com/title/tt4121026") # movie with no release date
# game = Movie.new("https://www.imdb.com/title/tt6161168/") # game

# p charlie.url
# p charlie.title
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
