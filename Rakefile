# frozen_string_literal: true

require "rake/testtask"

desc "Run unit tests"
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

desc "linting & code smell detector"
task :analysis do
  sh "standardrb"
  sh "reek"
end
