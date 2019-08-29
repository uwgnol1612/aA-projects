class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_parmas)
        if @user.save
            render :show 
        else
            render json: @user.errors.full_messages, status: 401
        end  
    end 

    def show
        @user = User.find(params[:id])
        render :show
    end 

    def user_parmas
        params.require(:user).permit(:username, :password)
    end 
end 