class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts
    # @user = User.find(params[:user_id])
    # @posts = @user.posts
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def new
    @current_user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @current_user = current_user
    @post = Post.new(post_params)
    @post.author_id = @current_user.id
    @post.CommentsCounter = 0
    @post.LikesCounter = 0

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to users_path
    else
      flash.now[:alert] = 'Error: Post could not be created.'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.user # Store the user associated with the post in a variable
    @post.destroy!
    redirect_to user_posts_path(user_id: @user.id), notice: 'Post was deleted successfully!'
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end


end
