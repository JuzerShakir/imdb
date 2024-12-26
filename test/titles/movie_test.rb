# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "../test_helper"

# tests against all the methods of Movie Module
class MovieTest < TestHelper
  ID = "tt0111161" # the shawshank redemption

  def test_instance_of_class = assert_kind_of(Movie, title)

  def test_title = super title.title, "The Shawshank Redemption"

  def test_duration = super title.duration, "2 hours 22 minutes"

  def test_budget
    budget = title.budget
    assert_kind_of(String, budget)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, budget)
  end

  def test_revenue
    revenue = title.revenue
    assert_kind_of(String, revenue)
    assert_match(/\A\$\d+(?:,\d{3})*\z/, revenue)
  end
end
