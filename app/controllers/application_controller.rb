class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  before_action :authenticated

  def authenticated
    if !session[:user_id] 
      redirect_to login_path 
    end
  end
end