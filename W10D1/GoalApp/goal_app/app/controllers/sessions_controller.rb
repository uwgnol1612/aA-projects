class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create

    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    
    if @user
      log_in(@user)
      redirect_to new_session_url
    else
      flash.now[:errors] = ["Wrong username/password combo!"]
      render :new  
    end 
    
  end

  #   def create
  #   credentials = [user_params[:username], user_params[:password]]
  #   @user = User.find_by_credentials(*credentials)
  #   if @user
  #     login!(@user)
  #     redirect_to user_url(@user)
  #   else
  #     flash.now[:errors] = ['Invalid credentials.']
  #     render :new
  #   end
  # end

  def destroy
    log_out
    redirect_to :new
  end

  # private
  # def user_params
  #   params.require(:user).permit(:username, :password)
  # end
end
