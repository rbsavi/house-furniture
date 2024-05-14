class CreateFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :furnitures do |t|
      t.string :item
      t.string :image
      t.string :description
      t.float :price
      t.integer :rating
      t.boolean :purchased
      t.integer :room_id

      t.timestamps
    end
  end
end
