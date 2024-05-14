class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.integer :owner_id
      t.integer :rooms_count

      t.timestamps
    end
  end
end
