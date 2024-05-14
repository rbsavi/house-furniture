class Furniture < ApplicationRecord

  belongs_to :room, required: true, class_name: "Room", foreign_key: "room_id", counter_cache: true
  
end
