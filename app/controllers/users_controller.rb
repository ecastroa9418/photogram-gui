class UsersController < ApplicationController

  def update

    the_username = params.fetch("path_id")
  
    matching_users = User.where({:username => the_username})
  
    the_user = matching_users.at(0)
  
    input_username = params.fetch("input_username")
 
    the_user.username = input_username
    the_user.save
  
    redirect_to("/users/" + the_user.username.to_s)
  end
  
  def create
    input_username = params.fetch("input_username")

    a_new_user = User.new
    a_new_user.username  = input_username
    a_new_user.save
  
    redirect_to("/users/" + a_new_user.username.to_s)
  end
  
  def index 
   matching_users = User.all
    
    @list_of_users = matching_users.order({:username =>:asc})
    
    render({:template => "user_templates/index"})
  end

  def show 
    url_username = params.fetch("path_username")
    
    matching_username = User.where({:username => url_username})

    @the_user = matching_username.first
  
    #if the_user == nil
      #redirect("/404")
    #else
      render({:template => "user_templates/show"})
    #end
  
    end

end
