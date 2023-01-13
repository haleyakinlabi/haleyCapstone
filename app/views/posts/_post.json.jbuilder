# frozen_string_literal: true

json.id post.id
json.user_id post.user_id
json.body post.body
json.like_count post.like_count
json.url post_url(post, format: :json)
