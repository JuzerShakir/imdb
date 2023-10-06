# frozen_string_literal: true

# require dependencies
require "nokogiri"
require "httparty"

# require all files & folders of the current directory 'lib'
lib = __dir__
Dir.glob(File.join(lib, "**", "*.rb")).sort.each(&method(:require))

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
##
##
##

# :reek:TooManyMethods
#
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
      else raise UnSupportedMediaType, "Unknown media type"
      end
    end

    # lists all top cast (Array/String)
    def casts
      split_these document.css("a[data-testid=title-cast-item__actor]").text
    end

    # list of directors (Array/String)
    def directors
      html = document.css("li[data-testid=title-pc-principal-credit]")
      text = html.text
      return unless text.include? "Director"

      split_these html.css("ul").first.text
    end

    # list of genres (Array/String)
    def genres
      split_these document.css("div[data-testid=genres]").text
    end

    # ID that differentiates each media type on imdb.com (String)
    def imdb_id
      document.css("meta[property*=pageConst]").attribute("content").value
    end

    # number of users rated (String)
    def popularity
      document.css("div[data-testid=hero-rating-bar__aggregate-rating] span div").last&.text
    end

    # list of production companies (Array/String)
    def production_companies
      split_these document.css("li[data-testid=title-details-companies] li").text
    end

    # average ratings (String)
    def ratings
      document.css("div[data-testid=hero-rating-bar__aggregate-rating__score] span").first&.text
    end

    # the date it was release on (String)
    def release_date
      inspect_this document.css("li[data-testid=title-details-releasedate] div").text
    end

    # short introduction
    def tagline
      inspect_this document.css("span[data-testid=plot-xl]").text
    end

    # its name
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

    # :reek:UtilityFunction
    # generates the expected output
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

    # returns type of media
    def media_type
      document.css("meta[property*=type]").attribute("content").value
    end

    # validates domain name, slug, IMDb ID & its length
    def valid?(url)
      url.match?("https://www.imdb.com/title/tt#{/\d+{7,}/i}") && correct_id?(url)
    end
  end
end
