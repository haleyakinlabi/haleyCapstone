# frozen_string_literal: true

json.id post.id
json.body post.body
json.likes_count post.likes_count
json.image_url post.image.persisted? ? url_for(post.image) : "https://place-puppy.com/400x400"
json.url post_url(post, format: :json)

json.user do
  json.id post.user.id
  json.usernmae post.user.username
  json.image_url post.user.image.persisted? ? url_for(post.user.image) : "https://place-puppy.com/50x50"
  json.species post.user.species
  json.breed post.user.breed
end
