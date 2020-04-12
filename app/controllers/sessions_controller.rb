class SessionsController < Devise::SessionsController
  before_action :set_user, :set_shopping_cart, only: [:create]

  private
  def set_user
    @user = User.find_by(email: params.dig(:session, :email))
  end

  def set_shopping_cart
    if @user
      @shopping_cart = ShoppingCart.find_by(user_id: @user.id) unless @user.is_admin
    end
  end
  
end
