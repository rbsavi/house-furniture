class RemoveOwnerIdFromHouses < ActiveRecord::Migration[7.0]
  def change
    remove_column :houses, :owner_id, :integer
  end
end
