class UsersController < ApplicationController
  skip_before_action :authenticated

  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, info: "Signed up successfully!"
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :address, :is_admin, :gender, :password, :password_confirmation)
  end

end
