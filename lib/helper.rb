# frozen_string_literal: true

# load libraries
require "nokogiri"
require "httparty"

# load all files & folders of the current directory 'lib'
Dir.glob(File.join(__dir__, "**", "*.rb")).each(&method(:require))
