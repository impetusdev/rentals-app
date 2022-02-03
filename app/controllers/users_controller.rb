class UsersController < ApplicationController
  def new
  end

  def create
    # add validation  to see if the user exists. 
    User.create!(
      username: params[:username],
      password: params[:password]
    )
    
    
    redirect_to rentals_path

    # user = User.find_by username: params[:username]
    #TODO: add form validation
    # if user.present? && user.authenticate(params[:password]) # authenticate is a bcrypt method for checking password
    #   session[:user_id] = user.id

    #   redirect_to rentals_path
    # else
    #   # throw error and redirect to the login page
    #   flash[:error] = 'Invalid email or password'
    #   redirect_to rentals_path
    # end

  end

    private def user_params
        params.require(:user).permit(:username, :password) 
    end
  end