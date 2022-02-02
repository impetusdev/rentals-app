class SessionController < ApplicationController
  def new
  end

  def create
    # add validation  to see if the user exists. 
    user = User.find_by username: params[:username]

    if user.present? && user.authenticate(params[:password]) # authenticate is a bcrypt method for checking password
      session[:user_id] = user.id

      redirect_to rentals_path
    else
      # throw error and redirect to the login page
      flash[:error] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end