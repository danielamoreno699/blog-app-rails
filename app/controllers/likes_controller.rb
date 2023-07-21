class LikesController < ApplicationController

    def increment
      @post = Post.find(params[:id])
      @like = Like.new(user_id: current_user.id, post_id: @post.id)
      @like.save
      respond_to do |format|
        format.js
      end
    end
  end
  