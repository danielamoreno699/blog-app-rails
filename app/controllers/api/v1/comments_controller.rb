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
  
    def create
      token = request.headers['X-Token']
      user = User.find_by(api_token: token)
      post = Post.find(params[:post_id])
  
      puts 'Comment'
      puts 'Comment'
      puts 'Comment'
      puts params
  
      new_comment = post.comments.new(
        Text: params[:Text], # Use snake_case for the parameter name
        user: user
      )
  
      if new_comment.save
        render json: { success: 'Comment added successfully' }, status: :created
      else
        render json: { error: new_comment.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
  