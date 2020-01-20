class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Signed up successful!"
    else
      flash[:alert] = "Sign up failed!"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :address, :is_admin, :gender, :password)
  end

end
