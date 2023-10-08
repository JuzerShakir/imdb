# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of TvShow Module
class TestTvShow < Minitest::Test
  @@tv = LoadMedia.tv

  def test_inheritance
    assert_kind_of(TvShow, @@tv)
  end
end
