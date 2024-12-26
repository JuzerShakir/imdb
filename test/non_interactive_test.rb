# frozen_string_literal: true

# assertions exclusive to Movies, Tv-Shows & Episode media type
module NonInteractiveTest
  def test_duration(object, expected_duration)
    assert_kind_of String, object
    assert_equal object, expected_duration
  end
end
