class Shop::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @shop = current_shop
    @items = @shop.items
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.shop_id = current_shop.id
    if item.save
      redirect_to item_path(item.id)
      flash[:notice] = ""
    else
      render :new
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :is_active, :shop_id)
  end
end
