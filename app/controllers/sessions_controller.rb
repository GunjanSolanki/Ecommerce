class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = User.find_by(email: params[:email], password: params[:password])
    if user && user.authenticate
      session[:user_id] = user.id
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
