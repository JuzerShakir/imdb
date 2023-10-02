# frozen_string_literal: true

require_relative "../imdb"

# Get all Video Game data by initializing fron this class
class VideoGame < IMDb::Base
  def initialize(url)
    super
    raise VideoGameTypeError, "#{url} is not a valid IMDb Video-Game URL" unless video_game?
  end

  private

  def video_game?
    @document.css("meta[property*=type]").attribute("content").value.include? "other"
  end
end

# game = VideoGame.new("https://www.imdb.com/title/tt6161168/") # game

# p game.url
# p game.title
# p game.imdb_id
# p game.tagline
# p game.ratings
# p game.popularity
# p game.genres
# p game.revenue
# p game.budget
# p game.producers
# p game.directors
# p game.casts
# p game.duration
