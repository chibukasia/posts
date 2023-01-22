class PostsController < ApplicationController
    def create
        post = Post.create!(post_params)
        render json: post, status: :created
    end 

    def index 
        posts = Post.all 
        render json: posts
    end


    private 
    def post_params
        params.permit(:title, :content)
    end
end
