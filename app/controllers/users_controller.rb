class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def show

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first

    render({ :template => "user_templates/show.html.erb"})
  end

  def direct
    redirect_to("/users/")
  end

  def new_user
    input_user = params.fetch("input_username")

    a_new_user = User.new

    a_new_user.username = input_user

    a_new_user.save

    redirect_to("/users/" + input_user.to_s)
  end

end