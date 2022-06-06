class Shop::ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    @orders = Order.all
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
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
