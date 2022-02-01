class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
  end

  def create
    Destination.create! destination_params
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
    Destination.find(params[:id]).update! destination_params
    redirect_to destination_path(params[:id])
    # I think it's actually using the destination variable, and saving
  end

  def destroy
    Destination.find(params[:id]).destroy
    redirect_to destinations_path
  end

  private def destination_params
    params.require(:destination).permit Destination.list_params
  end
  
end
