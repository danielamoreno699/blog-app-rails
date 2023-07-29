class Api::V1::CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }
  
    def index
      user = User.find(params[:user_id])
      post = user.posts.find(params[:post_id])
      comments = post.comments
      render json: comments
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end
  
   
  end
  