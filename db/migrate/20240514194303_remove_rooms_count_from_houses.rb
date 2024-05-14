class RemoveRoomsCountFromHouses < ActiveRecord::Migration[7.0]
  def change
    remove_column :houses, :rooms_count, :integer
  end
end
