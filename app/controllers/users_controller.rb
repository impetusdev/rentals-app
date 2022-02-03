class UsersController < ApplicationController
  def new
  end

  def create
    # add validation  to see if the user exists. 
    User.create!(
      username: params[:username],
      password: params[:password]
    )

    #TODO: form validation. 
    flash[:alert] = 'Account successfully created'
    redirect_to login_path

  end
  end