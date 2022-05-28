class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
  end

  def complete
  end
end
