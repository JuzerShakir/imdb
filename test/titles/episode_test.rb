# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Episode Module
class EpisodeTest < TestHelper
  ID = "tt9166672" # open wide, o earth

  def test_title
    heading = title.title
    super heading
    assert_equal("Open Wide, O Earth", heading)
  end

  def test_release_date
    release_date = title.release_date
    super release_date
    assert_equal("May 20, 2019 (United States)", release_date)
  end

  def test_duration = super title.duration, "1 hour 5 minutes"

  def test_instance_of_class
    assert_kind_of(Episode, title)
  end
end
