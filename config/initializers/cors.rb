# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "*",
      headers: :any, # allowed request headers
      expose: ["access-token"], # response headers exposed to clients
      methods: [:get, :post, :put, :patch, :delete, :options, :head] # allowed HTTP verbs for requests
  end
end
