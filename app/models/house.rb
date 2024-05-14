# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  house_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class House < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  has_many  :rooms, class_name: "Room", foreign_key: "house_id", dependent: :destroy

end
