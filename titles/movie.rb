# frozen_string_literal: true

require_relative "../imdb"

##
##
##
###### ---------------- List of features/data avialable to extract -----------------------
###    All features are available from Base class

#### ------- BOX OFFICE ---------
###   12. Budget
###   13. Gross Worldwide (Revenue)
##
##
##

# Get all movie data by initializing fron this class
class Movie < IMDb::Base
  def initialize(url)
    super
    raise MovieTypeError, "#{url} is not a valid IMDb Movie URL" unless is_a? "movie"
  end

  # returns budget price of the movie or nil if not available
  def budget
    document.css("li[data-testid=title-boxoffice-budget] div").text[/\$\S+/]
  end

  # returns revenue
  def revenue
    inspect_this document.css("li[data-testid=title-boxoffice-cumulativeworldwidegross] div").text
  end
end

# # WORKS
# charlie = Movie.new("https://www.imdb.com/title/tt7466810/") # movie
godfather = Movie.new("https://www.imdb.com/title/tt0068646/") # movie
# spider_man = Movie.new("https://www.imdb.com/title/tt9362722/") # movie has multiple directors
# animal = Movie.new("https://www.imdb.com/title/tt13751694/") # will release movie
# justice = Movie.new("https://www.imdb.com/title/tt4121026") # movie with no release date

# p charlie.url
# p charlie.title
# p charlie.imdb_id
p godfather.tagline
# p charlie.ratings
# p charlie.popularity
# p charlie.genres
# p charlie.revenue
# p charlie.budget
# p charlie.production_companies
# p charlie.directors
# p charlie.casts
# p charlie.duration

# SHOULD NOT WORK
# p IMDb::Movie.new("https://www.imdb.com/title/tt0111161590/")    # should not work
