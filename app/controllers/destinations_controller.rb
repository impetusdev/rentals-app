class DestinationsController < ApplicationController
  before_action :check_if_logged_in 
  
  def new
    @destination = Destination.new
  end

  def create
    destination = Destination.new destination_params
    destination.user << @current_user
    destination.save
    
    TravelTime.find_travel_duration(Rental.all, [destination]) #TODO: Update me

    redirect_to destinations_path
  end

  def index
    @destinations = Destination.all_owned(@current_user)
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
    
    TravelTime.find_travel_duration(Rental.all, [destination]) #TODO: Update me

    redirect_to destination_path(params[:id])
  end

  def destroy
    #TODO: update the total travel time due to this. 
    Destination.find(params[:id]).destroy
    TravelTime.find_by(destination_id: params[:id]).destroy
    
    TravelTime.update_travel_duration @current_user.rentals
    
    redirect_to destinations_path
  end

  private def destination_params
    params.require(:destination).permit Destination.list_params
  end
end
