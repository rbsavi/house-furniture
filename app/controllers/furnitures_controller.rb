class FurnituresController < ApplicationController
  def index
    matching_furnitures = Furniture.all

    @list_of_furnitures = matching_furnitures.order({ :created_at => :desc })

    render({ :template => "furnitures/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_furnitures = Furniture.where({ :id => the_id })

    @the_furniture = matching_furnitures.at(0)

    render({ :template => "furnitures/show" })
  end

  def create
    the_furniture = Furniture.new
    the_furniture.item = params.fetch("query_item")
    the_furniture.image = params.fetch("query_image")
    the_furniture.description = params.fetch("query_description")
    the_furniture.price = params.fetch("query_price")
    the_furniture.rating = params.fetch("query_rating")
    the_furniture.purchased = params.fetch("query_purchased", false)
    the_furniture.room_id = params.fetch("query_room_id")
    the_furniture.link = params.fetch("query_link")
    the_furniture.user_id = current_user.id


    if the_furniture.valid?
      the_furniture.save
      redirect_to("/rooms/#{the_furniture.room_id}", { :notice => "Furniture created successfully." })
    else
      redirect_to("rooms/#{the_furniture.room_id}", { :alert => the_furniture.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_furniture = Furniture.where({ :id => the_id }).at(0)

    the_furniture.item = params.fetch("query_item")
    the_furniture.image = params.fetch("query_image")
    the_furniture.description = params.fetch("query_description")
    the_furniture.price = params.fetch("query_price")
    the_furniture.rating = params.fetch("query_rating")
    the_furniture.purchased = params.fetch("query_purchased", false)
    the_furniture.room_id = params.fetch("query_room_id")

    if the_furniture.valid?
      the_furniture.save
      redirect_to("/furnitures/#{the_furniture.id}", { :notice => "Furniture updated successfully."} )
    else
      redirect_to("/furnitures/#{the_furniture.id}", { :alert => the_furniture.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_furniture = Furniture.where({ :id => the_id }).at(0)

    the_furniture.destroy

    redirect_to("/furnitures", { :notice => "Furniture deleted successfully."} )
  end
end
