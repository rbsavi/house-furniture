class RemoveFurnitureCountFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :furniture_count, :integer
  end
end
