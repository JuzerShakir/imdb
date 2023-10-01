# frozen_string_literal: true

require "nokogiri"
require "httparty"

module IMDb
  # Extracts all metadata of a Movie (URL passed as first argument) from IMDb website
  class Movie
    attr_reader :url

    def initialize(url)
      @url = url
      response = HTTParty.get(@url, options)
      @document = Nokogiri::HTML(response.body)
    end

    # returns title of the movie
    def title
      @document.css("h1").text
    end

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
      split_these @document.css("li[data-testid=title-pc-principal-credit] ul").first.text
    end

    private

    def inspect_this(input)
      input.empty? ? nil : input
    end

    def options
      {headers: {"User-Agent" => "Httparty"}}
    end

    def split_these(names)
      list = names.split(/(?<=\p{Ll})(?=\p{Lu})/)
      if list.empty?
        nil
      elsif list.length == 1
        list.join
      else
        list
      end
    end
  end
end

# charlie = IMDb::Movie.new("https://www.imdb.com/title/tt7466810/")    # movie
# godfather = IMDb::Movie.new("https://www.imdb.com/title/tt0068646/") # movie
# spider_man = IMDb::Movie.new("https://www.imdb.com/title/tt9362722/") # movie has multiple directors
# animal = IMDb::Movie.new("https://www.imdb.com/title/tt13751694/") # will release movie
justice = IMDb::Movie.new("https://www.imdb.com/title/tt4121026") # movie with no release date
p justice.release_date
# IMDb::Movie.new("https://www.imdb.com/title/tt0111161590/")    # should not work
