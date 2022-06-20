class Public::AddressesController < ApplicationController
  before_action :authenticate_user!
  def index
    @address = Address.new
    @addresses = current_user.addresses
  end

  def create
    address = Address.new(address_params)
    address.user_id = current_user.id
    if address.save
      flash[:notice1] = "配送先を追加しました"
      redirect_to addresses_path
    else
      @addresses = current_user.addresses
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice1] = "配送先を更新しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice1] = "配送先を削除しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
