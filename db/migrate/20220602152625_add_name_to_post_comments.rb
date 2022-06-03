class AddNameToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :name, :string, null: false
  end
end
