class SessionsController < ApplicationController

    def new
        render :new 
    end 


    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if @user 
            session[:session_token] = @user.session_token
            flash[:success] = "You have successfully logged in!"
            redirect_to user_url(@user.id)
        else
            flash.now[:error] = "Wrong combo of username/password!"
            render :new
        end 

    end 

    def destroy
        if current_user
            current_user.reset_session_token!
            session[:session_token] = nil
            redirect_to new_session_url
        else    
            flash[:error] = "You are not logged in..."
            render :new 
        end 
    end 
end 