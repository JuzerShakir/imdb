# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of TvShow Module
class TvShowTest < TestHelper
  ID = "tt0903747" # breaking bad

  def test_title
    heading = title.title
    super heading
    assert_equal("Breaking Bad", heading)
  end

  def test_duration
    duration = title.duration
    assert_kind_of String, duration
    assert_equal("45 minutes", duration)
  end

  def test_instance_of_class
    assert_kind_of(TvShow, title)
  end
end
