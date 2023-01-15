# frozen_string_literal: true

json.posts { json.array! @posts, partial: "posts/post", as: :post }
json.meta { json.partial! "pagination/hypermedia", pagy: @pagy }
