class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]
  include SessionsHelper, Authenticable
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user && @user.authenticate(params.dig(:session, :password))
      login
      @user.is_admin ? (redirect_to admin_products_path) : (redirect_to products_path)
    else
      flash[:warning] = "Invalid Email or Password!"
      render "new"
    end
  end

  def destroy
    logout
  end

  private
  def set_user
    @user = User.find_by(email: params.dig(:session, :email))
  end
end
