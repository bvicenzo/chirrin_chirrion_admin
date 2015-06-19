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
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.2"
  s.add_dependency "chirrin-chirrion", "~> 0.3.0"
end
