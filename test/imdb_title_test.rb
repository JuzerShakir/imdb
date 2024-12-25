# frozen_string_literal: true

# require all dependencies to run the test suites
require_relative "test_helper"

module TestIMDbTitle
  def test_imdb_id(object) = assert_kind_of String, object

  def test_title(object) = assert_kind_of String, object

  def test_tagline(object) = assert_kind_of String, object

  def test_genres(object) = assert_kind_of Array, object

  def test_ratings(object) = assert_match(/\A\d+\.\d+\z/, object)

  def test_popularity(object) = assert_match(/\A(\d+|\d+\.\d+)([kKmM])?\z/, object)

  def test_release_date(object) = assert_kind_of String, object

  def test_casts(object) = assert_kind_of Array, object

  def test_directors(object) = assert_kind_of Array, object

  def test_production_companies(object) = assert_kind_of Array, object
end
