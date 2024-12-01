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
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://authcomp.d1awsv4v0mkqab.amplifyapp.com' # フロントエンドのURLを記載
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :delete, :options, :head],
      end
    end # Rack::Cors の設定終了
  end # class Application の終了
end # module AnteKnowledgeBackEnd の終了
