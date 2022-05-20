class RemoveTelephoneNumberFromShops < ActiveRecord::Migration[6.1]
  def change
    remove_column :shops, :telephone_number, :string
  end
end
