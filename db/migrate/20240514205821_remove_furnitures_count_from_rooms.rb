class RemoveFurnituresCountFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :furnitures_count, :integer
  end
end
