# frozen_string_literal: true

require "nokogiri"
require "httparty"
require_relative "imdb_error"

module IMDb
  # Extracts common data from titles (Movie, Series, Episode, Game) from imdb.com
  class Base
    attr_reader :url

    # pass valid imdb title url (Movie, Series, Episode, Game)
    def initialize(url)
      raise InvalidURL, "Please input a valid IMDb URL" unless valid?(url)

      @url = url
    end

    # returns title of the movie
    def title
      @document.css("h1").text
    end

    # returns a unique id set by imdb
    def imdb_id
      @document.css("meta[property*=pageConst]").attribute("content").value
    end

    # returns release date of the movie
    def release_date
      inspect_this @document.css("li[data-testid=title-details-releasedate] div").text
    end

    # returns tagline of the movie
    def tagline
      @document.css("span[data-testid=plot-xl]").text
    end

    # returns ratings of the movie or nil if not available
    def ratings
      @document.css("div[data-testid=hero-rating-bar__aggregate-rating__score] span").first&.text
    end

    # returns revenue of the movie
    def revenue
      inspect_this @document.css("li[data-testid=title-boxoffice-cumulativeworldwidegross] div").text
    end

    # returns budget price of the movie or nil if not available
    def budget
      @document.css("li[data-testid=title-boxoffice-budget] div").text[/\$\S+/]
    end

    # returns popularity of the movie or nil if not available
    def popularity
      @document.css("div[data-testid=hero-rating-bar__aggregate-rating] span div").last&.text
    end

    # return duration of the movie
    def duration
      inspect_this @document.css("li[data-testid=title-techspec_runtime] div").text
    end

    # returns list of genres of the movie
    def genres
      split_these @document.css("div[data-testid=genres]").text
    end

    # returns list of top n casts of the movie
    def casts
      split_these @document.css("a[data-testid=title-cast-item__actor]").text
    end

    # returns list of producers of the movie
    def producers
      split_these @document.css("li[data-testid=title-details-companies] li").text
    end

    # returns list of directors of the movie
    def directors
      html = @document.css("li[data-testid=title-pc-principal-credit]")
      text = html.text
      return unless text.include? "Director"

      split_these html.css("ul").first.text
    end

    private

    def correct_id?(url)
      response = HTTParty.get(url, options)
      @document = Nokogiri::HTML(response.body)
      @document.title != "404 Error - IMDb"
    end

    def imdb?(url)
      url.match?("https://www.imdb.com/title/tt#{/\d+{7,}/i}")
    end

    def inspect_this(input)
      input.empty? ? nil : input
    end

    def options
      {headers: {"User-Agent" => "Httparty"}}
    end

    def split_these(names)
      list = names.split(/(?<=[a-z)])(?=[A-Z])/)
      if list.empty?
        nil
      elsif list.length == 1
        list.join
      else
        list
      end
    end

    def valid?(url)
      imdb?(url) && correct_id?(url)
    end
  end
end
