$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chirrin_chirrion_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chirrin-chirrion-admin"
  s.version     = ChirrinChirrionAdmin::VERSION
  s.authors     = ["Bruno Vicenzo"]
  s.email       = ["greenmetal@gmail.com"]
  s.homepage    = ""
  s.summary     = "Manage toggles with Chirrin Chirrion"
  s.description = "Provides a simple interface to magange toggles with Chirrin Chirrion"
  s.license     = "GNU"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  # Dependencies
  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "chirrin-chirrion", ">= 0.5.1"
  s.add_dependency "jquery-rails"

  # Development Dependencies
  s.add_development_dependency "redis", ">= 3.2.1"
  s.add_development_dependency "rspec-rails", "~> 4.0.2"
  s.add_development_dependency "capybara", "~> 2.4.4"
  s.add_development_dependency "poltergeist", ">= 1.6.0"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
end
