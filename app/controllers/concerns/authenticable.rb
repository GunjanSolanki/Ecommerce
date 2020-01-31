module Authenticable
  include ActiveSupport::Concern

  def login
    session[:user_id] = @user.id  
    session[:shopping_cart_id] = @shopping_cart.id unless @user.is_admin
  end

  def logout
    session[:user_id] = nil
    session[:shopping_cart_id] = nil
    redirect_to root_path, info: "Logged out successfully!"
  end
end