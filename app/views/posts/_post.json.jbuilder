# frozen_string_literal: true

json.id post.id
json.body post.body
json.likes_count post.likes_count
json.url post_url(post, format: :json)

json.user do
  json.id post.user.id
  json.username post.user.username
  json.image_url post.user.avatar_url
  json.species post.user.species
  json.breed post.user.breed
end
