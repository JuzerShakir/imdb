# frozen_string_literal: true

# load all dependencies
require_relative "helper"

###### ---------------- List of features/data available to extract -----------------------
###   1. Cast
###   2. Director
###   3. Genres
###   4. IMDb ID
###   5. Popularity
###   6. Ratings
###   7. Title
###   8. Tagline
###   9. Production Companies
###   10. Release Date

module IMDb
  # pass any Movie, TV-show, Episode or Game url from imdb.com
  class Title
    def initialize(url)
      raise InvalidURL, "Please input a valid IMDb URL" unless valid?(url)

      case media_type
      when "video.movie" then extend Movie
      when "video.tv_show" then extend TvShow
      when "video.episode" then extend Episode
      when "video.other" then extend VideoGame
      end
    end

    # lists all top cast (Array)
    def casts
      document.css("a[data-testid=title-cast-item__actor]").map(&:text) || []
    end

    # list of directors (Array)
    def directors
      element = document.css("li[data-testid=title-pc-principal-credit]").first
      element&.text&.match?(/Director|Creator/) ? element.css("div li").map(&:text) : []
    end

    # list of genres (Array)
    def genres
      document.css("div[data-testid=interests] div a").map(&:text)
    end

    # ID that differentiates each media type on imdb.com (String)
    def imdb_id
      document.css("meta[property*=pageConst]").attribute("content").value
    end

    # number of users rated (String)
    def popularity
      document.css("div[data-testid=hero-rating-bar__aggregate-rating] span div").last&.text
    end

    # list of production companies (Array)
    def production_companies
      document.css("li[data-testid=title-details-companies] li").map(&:text)
    end

    # average ratings (String)
    def ratings
      document.css("div[data-testid=hero-rating-bar__aggregate-rating__score] span").first&.text
    end

    # the date it was release on (String)
    def release_date
      document.css("li[data-testid=title-details-releasedate] div").first&.text
    end

    # short introduction
    def tagline
      document.css("span[data-testid=plot-xl]").first&.text
    end

    # name or title
    def title
      document.css("h1").text
    end

    # full url
    def url
      document.css("meta[property*=url]").attribute("content").value
    end

    private

    attr_reader :document

    # checks IMDb id from URL (should not return 404 Error Page)
    def correct_id?(url)
      response = HTTParty.get(url, {headers: {"User-Agent" => "Httparty"}})
      @document = Nokogiri::HTML(response.body)
      document.title != "404 Error - IMDb"
    end

    def media_type
      document.css("meta[property*=type]").attribute("content").value
    end

    # validates domain name, slug, IMDb ID & its length
    def valid?(url)
      url.match?("https://www.imdb.com/title/tt#{/\d+{7,}/i}") && correct_id?(url)
    end
  end
end
