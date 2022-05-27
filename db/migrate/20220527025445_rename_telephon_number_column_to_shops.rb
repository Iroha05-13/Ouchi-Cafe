class RenameTelephonNumberColumnToShops < ActiveRecord::Migration[6.1]
  def change
    rename_column :shops, :telephon_number, :telephone_number
  end
end
