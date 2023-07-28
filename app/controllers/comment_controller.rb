class CommentController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource
  
  def new
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @current_user = current_user
    @post = Post.find(params[:comment][:post_id])

    @comment = Comment.new(comment_params)
    @comment.author_id = @current_user.id
    @comment.post_id = @post.id

    puts params.inspect

    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to user_post_path(@current_user.id, @post.id)
    else
      flash.now[:alert] = 'Error: Comment could not be created.'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.decrement!(:CommentsCounter)
    @comment.destroy!
    redirect_to user_post_path(id: @post.id), notice: 'Comment was successfully deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)
  end


end
