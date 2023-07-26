class UsersController < ApplicationController
  #before_action :authenticate_current_user!, except: [:index]

  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @user }
    # end
  end

end
