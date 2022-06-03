class AddIntroductionToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :introduction, :text
  end
end
