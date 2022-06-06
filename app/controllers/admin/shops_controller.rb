class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    if shop.update(admin_shop_params)
      redirect_to "/admin"
    else
      render :edit
    end
  end

  private

  def admin_shop_params
    params.require(:shop).permit(:name, :postal_code, :address, :shop_image, :email, :telephone_number)
  end
end
