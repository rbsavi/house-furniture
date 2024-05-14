class AddLinkToFurnitures < ActiveRecord::Migration[7.0]
  def change
    add_column :furnitures, :link, :string
  end
end
