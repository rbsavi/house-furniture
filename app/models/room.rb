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

  belongs_to :house, class_name: "House", foreign_key: "house_id"

  has_many :furniture, class_name: "Furniture", foreign_key: "room_id"

end
