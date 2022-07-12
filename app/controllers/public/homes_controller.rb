class Public::HomesController < ApplicationController
  def top
    @items = Item.order("RAND()").limit(1)
    @shops = Shop.order("RAND()").limit(1)
  end

  def about
  end
end
