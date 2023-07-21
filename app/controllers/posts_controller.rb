class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def increment_likes
    @post = Post.find(params[:id])
    @post.increment!(:LikesCounter)
    redirect_to user_post_path(@post.author_id, @post.id)
  end
end
