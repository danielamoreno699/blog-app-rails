class FormPostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        redirect_to user_posts_path
    end
end
