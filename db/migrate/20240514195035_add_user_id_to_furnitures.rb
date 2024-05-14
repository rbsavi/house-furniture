class AddUserIdToFurnitures < ActiveRecord::Migration[7.0]
  def change
    add_column :furnitures, :user_id, :integer
  end
end
