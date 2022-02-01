class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
  end

  def create
    destination = Destination.create! destination_params
    
    TravelTime.find_travel_duration(Rental.all, [destination])
  end

  def index
    @destinations = Destination.all
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
