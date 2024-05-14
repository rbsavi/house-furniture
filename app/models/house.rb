class House < ApplicationRecord

  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id"

  has_many  :rooms, class_name: "Room", foreign_key: "house_id", dependent: :destroy

end
