class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :order_detals, dependent: :destroy

  belongs_to :shop

end
