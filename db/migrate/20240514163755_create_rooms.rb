class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room
      t.integer :num_furniture
      t.integer :house_id
      t.integer :furnitures_count

      t.timestamps
    end
  end
end
