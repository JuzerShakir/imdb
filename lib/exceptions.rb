# frozen_string_literal: true

module IMDb
  # All custom errors will inherit from this class
  class Error < StandardError; end

  # Will raise this error for incorrect url input
  class InvalidURL < Error; end
end
