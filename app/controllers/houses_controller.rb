class HousesController < ApplicationController
  def index
    matching_houses = House.all

    @list_of_houses = matching_houses.order({ :created_at => :desc })

    render({ :template => "houses/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_houses = House.where({ :id => the_id })

    @the_house = matching_houses.at(0)

    render({ :template => "houses/show" })
  end

  def create
    the_house = House.new
    the_house.owner_id = params.fetch("query_owner_id")
    the_house.rooms_count = params.fetch("query_rooms_count")

    if the_house.valid?
      the_house.save
      redirect_to("/houses", { :notice => "House created successfully." })
    else
      redirect_to("/houses", { :alert => the_house.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_house = House.where({ :id => the_id }).at(0)

    the_house.owner_id = params.fetch("query_owner_id")
    the_house.rooms_count = params.fetch("query_rooms_count")

    if the_house.valid?
      the_house.save
      redirect_to("/houses/#{the_house.id}", { :notice => "House updated successfully."} )
    else
      redirect_to("/houses/#{the_house.id}", { :alert => the_house.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_house = House.where({ :id => the_id }).at(0)

    the_house.destroy

    redirect_to("/houses", { :notice => "House deleted successfully."} )
  end
end
