class CreateOrderDetals < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detals do |t|

      t.integer :price, null: false
      t.integer :amount, null: false

      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
