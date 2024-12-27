# frozen_string_literal: true

# load external libraries
require "debug"
require "minitest/autorun"
require "minitest/hooks"
require "require_all"

require_rel %w[
  ../lib/imdb_title
  support
  imdb_title_test
  non_interactive_test
].freeze

# This helper class loads all the modules and methods required for the tests
class TestHelper < Minitest::Test
  attr_reader :title

  include Minitest::Hooks

  def self.inherited(subclass)
    super
    subclass.class_eval do
      include IMDbTitleTest
      include NonInteractiveTest if name.match?(/^(Movie|TvShow|Episode)/)

      IMDbTitleTest.instance_methods(false).each do |method|
        define_method method do
          super(title.send(method.to_s.sub("test_", "").to_sym))
        end
      end
    end
  end

  before(:all) do
    id = self.class::ID

    VCR.use_cassette(id) { @title = IMDb::Title.new "https://www.imdb.com/title/#{id}" }
  end
end
