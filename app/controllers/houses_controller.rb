class HousesController < ApplicationController
  def index
    if current_user != nil
      matching_houses = House.where({ :user_id => current_user.id})
      @list_of_houses = matching_houses.order({ :created_at => :desc })
    else
      @list_of_houses = nil
    end

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
    the_house.house_name = params.fetch("query_house_name")
    the_house.user_id = current_user.id

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
    
    the_house.user_id = current_user.id
    the_house.house_name = params.fetch("query_house_name")

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
