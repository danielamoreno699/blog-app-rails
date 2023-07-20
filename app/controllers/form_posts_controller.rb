class FormPostsController < ApplicationController
    def new
      @current_user = current_user
      @post = Post.new
    end
  
    def create
      @current_user = current_user
      @post = Post.create(post_params)
  
      if @post.save
        flash[:notice] = "Post was successfully created."
        redirect_to user_post_path(user_id: @current_user.id, id: @post.id)
      else
        flash.now[:alert] = "Error: Post could not be created."
        render :new
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:Title, :CommentsCounter, :LikesCounter)
    end
  end
  
