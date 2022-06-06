class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
