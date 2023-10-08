# frozen_string_literal: true

require "rake/testtask"

desc "Run unit tests"
Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.warning = false
end

desc "linting & code smell detector"
task :analysis do
  sh "standardrb"
  sh "reek"
end
