class Address < ApplicationRecord

  belongs_to :user

  def order_address
    "〒" + postal_code + " " + address + "　" + name
  end

end
