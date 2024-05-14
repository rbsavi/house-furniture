# == Schema Information
#
# Table name: furnitures
#
#  id          :integer          not null, primary key
#  description :string
#  image       :string
#  item        :string
#  price       :float
#  purchased   :boolean
#  rating      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  room_id     :integer
#  user_id     :integer
#
class Furniture < ApplicationRecord

  belongs_to :room, class_name: "Room", foreign_key: "room_id" 

  

end
