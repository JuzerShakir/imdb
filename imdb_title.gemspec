# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "imdb_title"
  s.version = "0.0.14"
  s.licenses = ["MIT"]
  s.summary = "Access info of any Movie, Tv Show, Episode or Game from imdb.com"
  s.description = <<-DESC
    Extract useful information about your favorite Movies, TV shows, Episodes, or Games
    with our data extraction library. All the information you need is a method call away.
  DESC

  s.author = "Juzer Shakir"
  s.email = "juzershakir.webdev@gmail.com"
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://github.com/JuzerShakir/imdb"
  s.metadata = {
    "source_code_uri" => "https://github.com/JuzerShakir/imdb",
    "changelog_uri" => "https://github.com/JuzerShakir/imdb/blob/master/CHANGELOG.md",
    "bug_tracker_uri" => "https://github.com/JuzerShakir/imdb/issues"
  }
  s.add_runtime_dependency "httparty", "~> 0.21.0"
  s.add_runtime_dependency "nokogiri", "~> 1.15", ">= 1.15.4"
  s.required_ruby_version = ">= 2.7.0"
end
