class AddHouseNameToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :house_name, :string
  end
end
