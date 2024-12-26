# frozen_string_literal: true

require "minitest/autorun"
require "minitest/hooks"
require_relative "../lib/imdb_title"
require_relative "imdb_title_test"
require_relative "non_interactive_test"
require "debug"

# This helper class loads all the modules and methods required for the tests
class TestHelper < Minitest::Test
  attr_reader :title

  include Minitest::Hooks

  def self.inherited(subclass)
    super
    subclass.class_eval do
      include IMDbTitleTest
      include NonInteractiveTest if name =~ /^(Movie|TvShow|Episode)/

      IMDbTitleTest.instance_methods(false).each do |method|
        define_method method do
          super(title.send(method.to_s.sub("test_", "").to_sym))
        end
      end
    end
  end

  before(:all) do
    @title = IMDb::Title.new "https://www.imdb.com/title/#{self.class::ID}"
  end
end
