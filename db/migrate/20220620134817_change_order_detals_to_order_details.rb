class ChangeOrderDetalsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_detals, :order_details
  end
end
