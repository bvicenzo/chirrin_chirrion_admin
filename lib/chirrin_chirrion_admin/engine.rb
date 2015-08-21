require 'chirrin-chirrion'

module ChirrinChirrionAdmin
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    isolate_namespace ChirrinChirrionAdmin

    # Loading Concerns
    config.to_prepare do
      Dir.glob(Engine.root + 'lib/concerns/**/*.rb').each do |concern|
        require_dependency(concern)
      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
