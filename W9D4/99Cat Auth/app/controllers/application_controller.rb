class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        return nil unless session[:sesssion_token]
        User.find_by(session_token: session[:sesssion_token])
    end
    
    def logged_in?
        current_user != nil # => true
    end
end

