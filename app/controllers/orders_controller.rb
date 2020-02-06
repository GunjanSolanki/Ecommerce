class OrdersController < ApplicationController
  include OrdersHelper
  before_action :set_cart, :except => :show_orders
  before_action :set_order, only: [:confirm_order, :destroy]

  def index
    if current_user.is_admin
      get_orders
      render "admin_orders"
    end
  end

  def create
    get_amount
    @order = Order.new(amount: @amount, order_status: 2, user_id: current_user.id)
    if @order.save
      order_product_in_cart
      empty_cart
      redirect_to order_path(@order)
    end
  end

  def show  
    set_order unless current_user.is_admin
    @orders = Order.all.most_recent
  end

  def show_user_orders
    @user = User.find(params[:id])
    @orders = @user.orders.includes(:products).most_recent
    render "user_orders"
  end

  def confirm_order
    @order.confirmed!
    get_orders
    render "admin_orders"
  end

  def destroy
    @order.cancelled!
    render "cancel_order"
  end

  private
  def set_cart
    @cart = ShoppingCart.find_by(id: current_user.shopping_cart.id) unless current_user.is_admin
  end
  
  def set_order
    @order = Order.find_by(id: params[:id])
  end

  def get_orders
    @orders = Order.where(order_status: "pending").most_recent.includes(:products)
  end

  def get_amount
    @amount = 0
    @cart.products.map { |product| @amount += product.price.to_i }
  end

  def empty_cart
    @cart.products.destroy_all
  end
  
  def order_product_in_cart  
    @cart.products.each do |product|
      @order_product = OrderProduct.create(order_id: current_order.id, product_id: product.id) 
    end
  end
end