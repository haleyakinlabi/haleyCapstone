# frozen_string_literal: true

Rails.application.routes.draw do
  api_guard_routes for: "users", controller: {
    registration: "users/registration",
    authentication: "users/authentication"
    # passwords: "users/passwords",
    # tokens: "users/tokens"
  }

  resources :users, defaults: {format: :json}
  resources :posts, defaults: {format: :json}
  root "users#index", defaults: {format: :json}
end
