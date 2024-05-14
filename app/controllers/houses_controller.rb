class HousesController < ApplicationController

  def index 
    render({:template => "houses/index"})
  end

end
