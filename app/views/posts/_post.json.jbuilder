# frozen_string_literal: true

json.id post.id
json.user_id post.user_id
json.body post.body
json.likes_count post.likes_count
json.image_url post.image.persisted? ? url_for(post.image) : "https://place-puppy.com/400x400"
json.url post_url(post, format: :json)
