class CartItem < ApplicationRecord

  belongs_to :user
  belongs_to :item

  def subtotal
    item.with_tax * amount
  end

end
