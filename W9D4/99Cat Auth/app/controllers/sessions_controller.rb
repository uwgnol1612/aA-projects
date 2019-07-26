class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
       
        user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        # debugger
        if user
           
            session[:session_token] = user.session_token 
            flash[:success] = 'successfully logged in'
            redirect_to cats_url
        else
            flash[:error] = "Wrong email/password combo"
            render :new, status: 401 
        end
    end

    def destroy
        if current_user
            current_user.reset_session_token!
            session[:session_token] = nil
        end
    end

end