# frozen_string_literal: true

# load libraries
require "nokogiri"
require "httparty"

# load all files & folders of the current directory 'lib'
lib = __dir__
Dir.glob(File.join(lib, "**", "*.rb")).sort.each(&method(:require))
