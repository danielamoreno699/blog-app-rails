class UserPostsController < ApplicationController
    def index
        @posts = Post.all
        
      end
    
      def show
          @post = Post.find(params[:id])
          respond_to do |format|
            format.html 
            format.json { render json: @post } 
          end
        end
end
