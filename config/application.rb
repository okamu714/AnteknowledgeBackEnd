require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module AnteKnowledgeBackEnd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    config.api_only = true

    # CORS設定
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
    
  end # class Application の終了
end # module AnteKnowledgeBackEnd の終了
