class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy

  belongs_to :user

  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid_up: 1, preparing: 2, shipped: 3 }

end
