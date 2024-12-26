# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of VideoGame Module
class VideoGameTest < TestHelper
  ID = "tt2140553" # the last of us

  def test_title
    heading = title.title
    super heading
    assert_equal("The Last of Us", heading)
  end

  def test_release_date
    release_date = title.release_date
    super release_date
    assert_equal("June 14, 2013 (United States)", release_date)
  end

  def test_duration = assert_raises(NoMethodError) { title.duration }

  def test_instance_of_class
    assert_kind_of(VideoGame, title)
  end
end
