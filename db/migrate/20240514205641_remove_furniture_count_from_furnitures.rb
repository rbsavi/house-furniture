class RemoveFurnitureCountFromFurnitures < ActiveRecord::Migration[7.0]
  def change
    remove_column :furnitures, :furniture_count, :integer
  end
end
