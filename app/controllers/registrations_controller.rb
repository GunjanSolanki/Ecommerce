class RegistrationsController < Devise::RegistrationsController
  
  def index  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_session_path
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :contact, :email, :address, :is_admin, :gender, :password, :password_confirmation)
  end

end