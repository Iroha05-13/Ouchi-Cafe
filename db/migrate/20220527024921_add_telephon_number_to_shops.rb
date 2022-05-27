class AddTelephonNumberToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :telephon_number, :string
  end
end
