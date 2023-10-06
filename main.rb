# frozen_string_literal: true

require_relative "lib/imdb_title"

# movie = IMDb::Title.new("https://www.imdb.com/title/tt0111161/?ref_=chttp_t_2")
movie = IMDb::Title.new("https://www.imdb.com/title/tt4121026")
# tv = IMDb::Title.new("https://www.imdb.com/title/tt5491994/")
# episode = IMDb::Title.new("https://www.imdb.com/title/tt6209144")
# game = IMDb::Title.new("https://www.imdb.com/title/tt0187405")

p movie.duration
# p movie.title
p movie.budget
p movie.casts
# p tv.directors
# p movie.duration
# p movie.genres
# p movie.imdb_id
# p movie.popularity
# p movie.production_companies
# p movie.ratings
# p movie.release_date
p movie.revenue
# p movie.tagline
