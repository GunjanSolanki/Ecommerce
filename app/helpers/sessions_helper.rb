module SessionsHelper

  def set_session
    session[:user_id] = @user.id  
  end
  
  def destroy_session
    session[:user_id] = nil
    redirect_to root_path, info: "Logged out successfully!"
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
