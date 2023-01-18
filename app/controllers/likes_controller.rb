# frozen_string_literal: true

class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post

  def create
    @post.increment! :likes_count

    respond_to do |format|
      @post.reload
      format.json { render "posts/show", status: :created, location: @post }
    end
  end

  def destroy
    @post.decrement! :likes_count

    respond_to do |format|
      @post.reload
      format.json { render "posts/show", status: :created, location: @post }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
