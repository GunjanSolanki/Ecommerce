class SessionsController < ApplicationController
  include SessionsHelper
  before_action :current_user, only: [:create]

  def new
  end

  def create
    @user = User.find_by(email: params.dig(:session, :email))
    if @user && @user.authenticate(params.dig(:session, :password))
      set_session
      redirect_to root_path, info: "Logged in successfully!"
    else
      flash[:warning] = "Invalid Email or Password!"
      render "new"
    end
  end

  def destroy
    destroy_session
  end

end
