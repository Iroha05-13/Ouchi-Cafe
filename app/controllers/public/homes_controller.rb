class Public::HomesController < ApplicationController
  def top
    @items = Item.order("RANDOM()").limit(1)
    @shops = Shop.order("RANDOM()").limit(1)
  end

  def about
  end
end
