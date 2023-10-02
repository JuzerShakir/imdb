# frozen_string_literal: true

class ImdbError < StandardError; end

class InvalidURL < ImdbError; end

class MovieTypeError < InvalidURL; end
