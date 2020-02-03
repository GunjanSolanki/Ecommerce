module Authenticable
  include ActiveSupport::Concern

  def login
    session[:user_id] = @user.id  
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, info: "Logged out successfully!"
  end
end