# frozen_string_literal: true

json.id post.id
json.user_id post.user_id
json.body post.body
json.like_count post.like_count
json.image_url url_for(post.image) || "https://place-puppy.com/400x400"
json.url post_url(post, format: :json)
