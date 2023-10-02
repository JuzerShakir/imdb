# frozen_string_literal: true

# All custom errors will inherit from this class
class ImdbError < StandardError; end

# Will raise this error for incorrect url input
class InvalidURL < ImdbError; end

# Will raise this error if URL is UNSUPPORTED title type
class UnSupportedTypeError < InvalidURL; end
