# frozen_string_literal: true

require_relative 'lib/chirrin_chirrion_admin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'chirrin-chirrion-admin'
  s.version     = ChirrinChirrionAdmin::VERSION
  s.authors     = ['Bruno Vicenzo']
  s.email       = ['bruno@alumni.usp.br']
  s.homepage    = ''
  s.summary     = 'Manage toggles with Chirrin Chirrion'
  s.description = 'Provides a simple interface to magange toggles with Chirrin Chirrion'
  s.license     = 'GNU'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']
  s.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  # Dependencies
  s.add_dependency 'chirrin-chirrion', '>= 0.5.1'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'rails', '>= 3.2'

  # Development Dependencies
  s.add_development_dependency 'capybara', '~> 3.35.0'
  s.add_development_dependency 'poltergeist', '>= 1.6.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'redis', '>= 3.2.1'
  s.add_development_dependency 'rspec-rails', '~> 4.0.2'
end
