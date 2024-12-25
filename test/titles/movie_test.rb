# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Movie Module
class TestMovie < Minitest::Test
  @@movie = LoadMedia.movie

  def test_inheritance
    assert_kind_of(Movie, @@movie)
  end

  def test_budget
    assert_kind_of(String, @@movie.budget)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, @@movie.budget)
  end

  def test_revenue
    assert_kind_of(String, @@movie.revenue)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, @@movie.revenue)
  end
end
