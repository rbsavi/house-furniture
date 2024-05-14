Rails.application.routes.draw do

  devise_for :users

  root to: "houses#index"

  # Routes for the House resource:

  # CREATE
  post("/insert_house", { :controller => "houses", :action => "create" })
          
  # READ
  get("/houses", { :controller => "houses", :action => "index" })
  
  get("/houses/:path_id", { :controller => "houses", :action => "show" })
  
  # UPDATE
  
  post("/modify_house/:path_id", { :controller => "houses", :action => "update" })
  
  # DELETE
  get("/delete_house/:path_id", { :controller => "houses", :action => "destroy" })

  #------------------------------

  # Routes for the Furniture resource:

  # CREATE
  post("/insert_furniture", { :controller => "furnitures", :action => "create" })
          
  # READ
  get("/furnitures", { :controller => "furnitures", :action => "index" })
  
  get("/furnitures/:path_id", { :controller => "furnitures", :action => "show" })
  
  # UPDATE
  
  post("/modify_furniture/:path_id", { :controller => "furnitures", :action => "update" })
  
  # DELETE
  get("/delete_furniture/:path_id", { :controller => "furnitures", :action => "destroy" })

  #------------------------------

  # Routes for the Room resource:

  # CREATE
  post("/insert_room", { :controller => "rooms", :action => "create" })
          
  # READ
  get("/rooms", { :controller => "rooms", :action => "index" })
  
  get("/rooms/:path_id", { :controller => "rooms", :action => "show" })
  
  # UPDATE
  
  post("/modify_room/:path_id", { :controller => "rooms", :action => "update" })
  
  # DELETE
  get("/delete_room/:path_id", { :controller => "rooms", :action => "destroy" })

  #------------------------------
  
end
