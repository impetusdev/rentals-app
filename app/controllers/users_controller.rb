class UsersController < ApplicationController
  def new
  end

  def create
    # add validation  to see if the user exists. 
    User.create!(
      username: params[:username],
      password: params[:password]
    )
    

    flash[:alert] = 'Account successfully created'
    redirect_to login_path

  end

    private def user_params
        params.require(:user).permit(:username, :password) 
    end
  end