class Shop::ItemsController < ApplicationController
  before_action :authenticate_shop!
  def new
    @item = Item.new
    @tags = Tag.all
  end

  def index
    @shop = current_shop
    @items = @shop.items
  end

  def edit
    @item = Item.find(params[:id])
    @tags = Tag.all
  end

  def create
    item = Item.new(item_params)
    item.shop_id = current_shop.id
    if item.save
      redirect_to item_path(item.id)
      flash[:notice1] = "商品が追加されました。"
    else
      render :new
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item.id)
      flash[:notice1] = "商品情報が更新されました。"
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :is_active, :shop_id, tag_ids: [])
  end
end
