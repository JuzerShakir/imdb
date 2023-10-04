# frozen_string_literal: true

module IMDb
  # All custom errors will inherit from this class
  class Error < StandardError; end

  # Will raise this error for incorrect url input
  class InvalidURL < Error; end

  # Will raise this error if URL is UNSUPPORTED title type
  class UnSupportedType < InvalidURL; end
end
