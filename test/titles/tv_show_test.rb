# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of TvShow Module
class TvShowTest < TestHelper
  ID = "tt0903747" # breaking bad

  def test_title = super(title.title, "Breaking Bad")

  def test_duration = super(title.duration, "45 minutes")

  def test_instance_of_class = assert_kind_of(TvShow, title)
end
