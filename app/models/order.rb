class Order < ApplicationRecord

  has_many :order_detals, dependent: :destroy

  belongs_to :user

  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }

end
