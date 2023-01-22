class UsersController < ApplicationController
    skip_before_action :authorize, only:[:create]
    def create 
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created 
    end 

    def show 
        user = User.find_by(id: session[:user_id])
        if user 
            render json: user, status: :ok 
        else
            render json: {erorr: "user not found"}, status: :unauthorized
        end
    end

    # def index 
    #     users = User.all 
    #     render json: users
    # end

    def index
        session[:session_hello] ||= "World"
        cookies[:cookies_hello] ||= "World"
        render json: { session: session, cookies: cookies.to_hash }
      end
    private 
    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
