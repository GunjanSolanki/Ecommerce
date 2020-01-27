class ApplicationController < ActionController::Base
  before_action :current_user
  add_flash_types :info, :error, :warning
  
  def set_user_session
    session[:user_id] = @user.id  
  end
  
  def destroy_user_session
    session[:user_id] = nil
    redirect_to root_path, info: "Logged out successfully!"
  end

  def login?
    current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
