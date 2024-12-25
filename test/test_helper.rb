# frozen_string_literal: true

require "minitest/autorun"
require "minitest/hooks"
require_relative "../lib/imdb_title"
require_relative "imdb_title_test"

class TestHelper < Minitest::Test
  include Minitest::Hooks

  def self.inherited(subclass)
    super
    subclass.class_eval { include IMDbTitleTest }
  end

  before(:all) do
    @title = IMDb::Title.new "https://www.imdb.com/title/#{self.class::ID}"
  end
end
