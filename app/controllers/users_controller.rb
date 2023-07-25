class UsersController < ApplicationController
  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end


  def new 
    @user = User.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = User.new(user_params)
    @user.post_counter = 0
    
    
    if @user.save
      flash[:success] = 'New User was successfully created.'
      redirect_to users_path
    else
      flash.now[:alert] = 'Error: User could not be created.'
      render :new
    end

    
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :photo, :bio )
    end
end
