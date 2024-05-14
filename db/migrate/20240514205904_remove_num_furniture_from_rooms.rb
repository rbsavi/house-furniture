class RemoveNumFurnitureFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :num_furniture, :integer
  end
end
