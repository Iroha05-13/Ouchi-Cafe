class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
    @items = @shop.items
  end

  def edit
    @shop = current_shop
  end

  def update
    shop = current_shop
    if shop.update(shop_params)
      redirect_to show_shop_path(shop.id)
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :postal_code, :address, :shop_image, :shop_in_image, :email, :telephone_number, :introduction)
  end
end
