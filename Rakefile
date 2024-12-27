# frozen_string_literal: true

require "rake/testtask"

desc "Run all unit tests"
Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.warning = false
end

# bundle exec rake test_movie
desc "Run unit tests for Movie"
Rake::TestTask.new(:test_movie) do |t|
  t.pattern = "test/titles/movie_test.rb"
  t.warning = false
end

# bundle exec rake test_tv
desc "Run unit tests for TvShow"
Rake::TestTask.new(:test_tv) do |t|
  t.pattern = "test/titles/tv_show_test.rb"
  t.warning = false
end

# bundle exec rake test_episode
desc "Run unit tests for an Episode"
Rake::TestTask.new(:test_episode) do |t|
  t.pattern = "test/titles/episode_test.rb"
  t.warning = false
end

# bundle exec rake test_game
desc "Run unit tests for Video Game"
Rake::TestTask.new(:test_game) do |t|
  t.pattern = "test/titles/video_game_test.rb"
  t.warning = false
end

# bundle exec rake test_title_in_development
desc "Run unit tests for title in development"
Rake::TestTask.new(:test_title_in_development) do |t|
  t.pattern = "test/titles/in_development_test.rb"
  t.warning = false
end

desc "linting & code smell detector"
task :analysis do
  sh "rubocop"
  sh "reek"
end
