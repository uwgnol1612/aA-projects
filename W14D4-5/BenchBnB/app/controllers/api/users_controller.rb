class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_parmas)
        if @user.save
            login(@user)
            render 'api/users/user';
        else
            render json: @user.errors.full_messages, status: 401
        end  
    end 

    def show
        @user = User.find(params[:id])
        render 'api/users/user'
    end 

    def user_parmas
        params.require(:user).permit(:username, :password)
    end 
end 