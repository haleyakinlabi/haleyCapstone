# frozen_string_literal: true

json.users { json.array! @users, partial: "users/user", as: :user }
json.meta { json.partial! "pagination/hypermedia", pagy: @pagy }
