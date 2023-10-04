# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "imdb_title"
  s.version = "0.0.1"
  s.licenses = ["MIT", "GPL-2.0"]
  s.summary = "Access info of any Movie, Tv Show, Episode or Game from imdb.com"
  s.description = <<-DESC
    Provide a valid URL input (such as Movie, Tv Show, Episode or Game) from imdb.com &
    then extract imp info such as title, tagline, ratings, directors, casts, etc.
  DESC

  s.author = "Juzer Shakir"
  s.email = "juzershakir.webdev@gmail.com"
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://github.com/JuzerShakir/imdb"
  s.metadata = {"source_code_uri" => "https://github.com/JuzerShakir/imdb"}
  s.add_runtime_dependency "httparty", "~> 0.21.0"
  s.add_runtime_dependency "nokogiri", "~> 1.15", ">= 1.15.4"
  s.add_runtime_dependency "require_all", "~> 3.0"
  s.add_development_dependency "reek", "~> 6.1", ">= 6.1.4"
  s.add_development_dependency "standard", "~> 1.31", ">= 1.31.1"
end
