class UsersController < ApplicationController

    def index

        if params[:username]
            users = User.where('username LIKE ?', params[:username])
        else
            users = User.all
        end
        render json: users
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render user.errors.full_messages, status: 422
        end  
    end

    def show
        @user = User.find(params[:id])
        @liked = @user.likes
        response = { user: @user, liked: @liked }
        render json: response
    end

    def update
        user = User.find(params[:id])
        user.update(user_params) 
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private
        def user_params
            params.require(:user).permit(:name, :email)
        end
end 