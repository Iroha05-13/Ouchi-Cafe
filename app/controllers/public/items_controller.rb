class Public::ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @post_comments = @item.post_comments.all
  end
end
