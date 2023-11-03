require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module SwaggerDemo
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Hoặc chỉ định các domain được phép truy cập, ví dụ: 'http://example.com'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end

    config.middleware.use SecureHeaders::Middleware
    SecureHeaders::Configuration.default do |config|
      config.csp = {
        default_src: %w('self'),
        script_src: %w('self' 'unsafe-inline'),
        connect_src: %w('self' http://localhost:3000),
        # ... (thêm các nguồn cần thiết cho các tài nguyên khác)
      }
    end
  end
end
