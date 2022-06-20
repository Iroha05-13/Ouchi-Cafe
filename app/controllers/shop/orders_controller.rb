class Shop::OrdersController < ApplicationController
  before_action :authenticate_shop!
  def show
    @order = Order.find(params[:id])
  end

end
