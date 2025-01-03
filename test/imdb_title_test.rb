# frozen_string_literal: true

# This is the base class where common assertions in common methods are defined
module IMDbTitleTest
  def test_imdb_id(object)
    assert_kind_of String, object
    assert_equal(self.class::ID, object)
  end

  def test_title(object, expected_heading)
    assert_kind_of String, object
    assert_equal(object, expected_heading)
  end

  def test_tagline(object) = assert_kind_of String, object

  def test_genres(object) = assert_kind_of Array, object

  def test_ratings(object) = assert_match(/\A\d+\.\d+\z/, object)

  def test_popularity(object) = assert_match(/\A(\d+|\d+\.\d+)([kKmM])?\z/, object)

  def test_release_date(object)
    assert_kind_of String, object
    assert_match(/\A\w+ \d{1,2}, \d{4} \(India|United States\)\z/, object)
  end

  def test_casts(object) = assert_kind_of Array, object

  def test_directors(object) = assert_kind_of Array, object

  def test_production_companies(object) = assert_kind_of Array, object
end
