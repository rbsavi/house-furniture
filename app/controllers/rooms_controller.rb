class RoomsController < ApplicationController
  def index
    matching_rooms = Room.all

    @list_of_rooms = matching_rooms.order({ :created_at => :desc })

    render({ :template => "rooms/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_rooms = Room.where({ :id => the_id })

    @the_room = matching_rooms.at(0)

    render({ :template => "rooms/show" })
  end

  def create
    the_room = Room.new
    the_room.room = params.fetch("query_room_name")
    the_room.house_id = params.fetch("query_house_id").to_i
    the_room.user_id = current_user.id

    p the_room
    if the_room.valid?
      the_room.save
      redirect_to("/houses/#{the_room.house_id}", { :notice => "Room created successfully." })
    else
      redirect_to("/houses/#{the_room.house_id}", { :alert => the_room.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_room = Room.where({ :id => the_id }).at(0)
    
    the_room.user_id = current_user.id
    the_room.room = params.fetch("query_room_name")
    the_room.house_id = params.fetch("query_house_id")
    
    if the_room.valid?
      the_room.save
      redirect_to("/rooms/#{the_room.id}", { :notice => "Room updated successfully."} )
    else
      redirect_to("/rooms/#{the_room.id}", { :alert => the_room.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_room = Room.where({ :id => the_id }).at(0)

    the_room.destroy

    redirect_to("/houses/#{the_room.house_id}", { :notice => "Room deleted successfully."} )
  end
end
