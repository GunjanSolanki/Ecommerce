class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params.dig(:session, :email))
    if @user && @user.authenticate(params.dig(:session, :password))
      set_user_session
      if login?
        redirect_to root_path, info: "Logged in successfully!"
      else
        flash[:warning] = "Invalid Email or Password!"
        render "new"
      end
    end
  end

  def destroy
    destroy_user_session
  end

end
