class DestinationsController < ApplicationController
  before_action :check_if_logged_in 
  
  def new
    @destination = Destination.new
  end

  def create
    #TODO: 
    destination = Destination.create! destination_params 
    @current_user.destinations << destination
    TravelTime.find_travel_duration(Rental.all, [destination])
  end

  def index
    #TODO: do you know why this uses, ids instead of id, and user instead of users
    @destinations = Destination.select do |destination|
      #where the users have atleast one value where it is true
      destination.user.ids[0] == @current_user.id 
    end
  end

  def show
    @destination = Destination.find params[:id]
  end

  def edit
    @destination = Destination.find params[:id]
  end

  def update
    destination = Destination.find(params[:id])
    destination.update! destination_params
    
    TravelTime.find_travel_duration(Rental.all, [destination])

    redirect_to destination_path(params[:id])
  end

  def destroy
    Destination.find(params[:id]).destroy
    redirect_to destinations_path
  end

  private def destination_params
    params.require(:destination).permit Destination.list_params
  end
end
