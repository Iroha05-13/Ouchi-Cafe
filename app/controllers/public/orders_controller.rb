class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
    @addresses = current_user.addresses
    @cart_items = current_user.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      cart_item.subtotal
      @total += cart_item.subtotal
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if params[:order][:select_address] == "0"
      @order.name = current_user.name
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
    elsif params[:order][:select_address] == "2"
      @order.save
    else
      render :new
    end

    @cart_items = current_user.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      cart_item.subtotal
      @total += cart_item.subtotal
    end

    @order.total_price = @total + @order.postage
  end

  def create
    cart_items = current_user.cart_items
    @order = current_user.orders.new(order_params)
    @order.user_id = current_user.id

    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.with_tax

        order_detail.save
      end
      redirect_to cart_items_path
      flash[:notice] = "注文が確定されました。ご注文ありがとうございました！"
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :status, :total_price, :postage)
  end
end
