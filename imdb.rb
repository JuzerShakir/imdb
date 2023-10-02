# frozen_string_literal: true

require "require_all"
require "nokogiri"
require "httparty"
require_relative "lib/exceptions"
require_all "titles/*.rb"

##
##
##
###### ---------------- List of features/data avialable to extract -----------------------
###   1. Cast
###   2. Director
###   3. Genres
###   4. IMDb ID
###   5. Popularity
###   6. Ratings
###   7. Title
###   8. Tagline
#### ------- DETAILS ---------
###   9. Prodcution Companies
###   10. Release Date
#### ------- TECHNICAL SPECS ---------
###   11. Runtime
##
##
##

# :reek:TooManyMethods
module IMDb
  # Extracts common data from titles - Movie, TV-shows, Episode, Game from imdb.com
  class Title
    # pass valid imdb title url
    def initialize(url)
      raise InvalidURL, "Please input a valid IMDb URL" unless valid?(url)

      case title_type
      when "video.movie" then extend Movie
      when "video.tv_show" then extend TvShow
      when "video.episode" then extend Episode
      when "video.other" then extend VideoGame
      else raise UnSupportedTypeError, "Unknown title type"
      end
    end

    # returns list of casts
    def casts
      split_these document.css("a[data-testid=title-cast-item__actor]").text
    end

    # returns list of directors
    def directors
      html = document.css("li[data-testid=title-pc-principal-credit]")
      text = html.text
      return unless text.include? "Director"

      split_these html.css("ul").first.text
    end

    # returns runtime of the title
    def duration
      inspect_this document.css("li[data-testid=title-techspec_runtime] div").text
    end

    # returns list of genres
    def genres
      split_these document.css("div[data-testid=genres]").text
    end

    # returns a unique id set by imdb
    def imdb_id
      document.css("meta[property*=pageConst]").attribute("content").value
    end

    # returns number of users rated
    def popularity
      document.css("div[data-testid=hero-rating-bar__aggregate-rating] span div").last&.text
    end

    # returns list of production companies
    def production_companies
      split_these document.css("li[data-testid=title-details-companies] li").text
    end

    # returns user average rating score
    def ratings
      document.css("div[data-testid=hero-rating-bar__aggregate-rating__score] span").first&.text
    end

    # returns release date
    def release_date
      inspect_this document.css("li[data-testid=title-details-releasedate] div").text
    end

    # returns short introduction of the title
    def tagline
      inspect_this document.css("span[data-testid=plot-xl]").text
    end

    # returns name of the title
    def title
      document.css("h1").text
    end

    def url
      document.css("meta[property*=url]").attribute("content").value
    end

    private

    attr_reader :document

    # checks IMDb id from URL (dosen't return 404 Error Page)
    def correct_id?(url)
      response = HTTParty.get(url, {headers: {"User-Agent" => "Httparty"}})
      @document = Nokogiri::HTML(response.body)
      document.title != "404 Error - IMDb"
    end

    # :reek:UtilityFunction
    # returns proper output
    def inspect_this(input)
      if input.empty?
        nil
      elsif input.length == 1
        input.join
      else
        input
      end
    end

    # spilits camel case names to array
    def split_these(names)
      list = names.split(/(?<=[a-z)])(?=[A-Z])/)
      inspect_this(list)
    end

    # returns type of title
    def title_type
      document.css("meta[property*=type]").attribute("content").value
    end

    # validates domain name, slug & IMDb ID length and returns title page
    def valid?(url)
      url.match?("https://www.imdb.com/title/tt#{/\d+{7,}/i}") && correct_id?(url)
    end
  end
end
