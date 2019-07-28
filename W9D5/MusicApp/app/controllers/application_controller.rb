class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token! 
    end 

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def logged_in?
        !current_user.nil?
    end 

    def require_login
        unless logged_in?
            flash[:error] = "You must logged in to asscess this section!"
            redirect_to new_session_url
        end 
    end 

end
