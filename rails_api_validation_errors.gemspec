$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_api_validation_errors/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_api_validation_errors"
  s.version     = RailsApiValidationErrors::VERSION
  s.licenses    = ['MIT']
  s.authors     = ["Moritz Lawitschka"]
  s.email       = ["me@moritzlawitschka.de"]
  s.homepage    = "https://github.com/lawitschka/rails-api-validation-errors"
  s.summary     = "Untranslated validation errors with all meta data for APIs behind Javascript frontends"
  s.description = "Instead of Rails translating validation errors automatically to current locale, validation errors are returned as error meta hashes easily embedded in API error responses and translated in the frontend."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0", ">= 4.0.0"

  s.add_development_dependency "sqlite3",     "~> 0"
  s.add_development_dependency "rspec-rails", "~> 2.14", ">= 2.14.0"
  s.add_development_dependency "rr",          "~> 1.1",  ">= 1.1.2"
  s.add_development_dependency "simplecov",   "~> 0"
  s.add_development_dependency "coveralls",   "~> 0"
end
