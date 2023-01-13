# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, defaults: {format: :json}
  resources :posts, defaults: {format: :json}
  root "users#index", defaults: {format: :json}
end
