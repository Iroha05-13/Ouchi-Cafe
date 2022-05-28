class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = current_user.orders
  end

  def show
  end

  def confirm
  end

  def complete
  end
end
