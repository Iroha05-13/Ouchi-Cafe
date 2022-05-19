class Order < ApplicationRecord

  has_many :order_detals, dependent: :destroy

  belongs_to :user

end
