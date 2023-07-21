class LikesController < ApplicationController
  def increment
    @post = Post.find(params[:id])
    @like = Like.create(post: @post, user: current_user)

    respond_to do |format|
      format.js { render :increment }
    end
  end
end
