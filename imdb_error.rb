# frozen_string_literal: true

# All custom errors will inherit from this class
class ImdbError < StandardError; end

# Will raise this error for incorrect url input
class InvalidURL < ImdbError; end

# Will raise this error if URL is NOT Movie type
class MovieTypeError < InvalidURL; end

# Will raise this error if URL is NOT TvShow type
class TvShowTypeError < InvalidURL; end

# Will raise this error if URL is NOT EpisodeType type
class EpisodeTypeError < InvalidURL; end

# Will raise this error if URL is NOT VideoGame type
class VideoGameTypeError < InvalidURL; end
