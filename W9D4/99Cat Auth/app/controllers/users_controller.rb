class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        # debugger
        if @user.save
            flash[:success] = 'User account is successfully created!'
            redirect_to user_url(@user.id)
        else 
            flash[:error] = 'Could not create the account, see below for errors'
            render :new, status: 422
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def user_params
        params.require(:user).permit(:user_name, :password)
    end 

end