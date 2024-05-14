# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  room       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  house_id   :integer
#  user_id    :integer
#
class Room < ApplicationRecord

  has_many  :furnitures, class_name: "Furniture", foreign_key: "room_id", dependent: :destroy

  belongs_to :house, required: true, class_name: "House", foreign_key: "house_id", counter_cache: true
  
end
