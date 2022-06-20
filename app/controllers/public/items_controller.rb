class Public::ItemsController < ApplicationController
  def index
    @items = params[:tag_id].present? ? Tag.find(params[:tag_id]).items : Item.order("created_at DESC")
    @tags = Tag.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @post_comments = @item.post_comments.all
  end
end
