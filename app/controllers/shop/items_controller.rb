class Shop::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @shop = Shop.find(params[:id])
    @items = @shop.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
end
