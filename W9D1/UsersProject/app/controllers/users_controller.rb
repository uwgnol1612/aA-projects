class UsersController < ApplicationController

    def index
        users = User.all 
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
        user = User.find(params[:id])
        render json: user
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