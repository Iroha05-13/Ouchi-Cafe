class Public::CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items.all
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    if current_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      flash[:notice] = "商品が追加されました"
      redirect_to cart_items_path
    elsif @cart_item.save
      flash[:notice] = "商品が追加されました"
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      flash[:notice] = "商品の数量が更新されました"
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice] = "商品がカートから削除されました"
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy_all
    current_user.cart_items.destroy_all
    flash[:notice] = "全ての商品をカートから削除しました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
