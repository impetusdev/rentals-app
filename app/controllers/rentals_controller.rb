class RentalsController < ApplicationController
  before_action :check_if_logged_in, except: [:index, :show]
  
  def new 
    @rental = Rental.new
  end

  def create
    rental = Rental.create! rental_params
    TravelTime.find_travel_duration([rental], Destination.all) #TODO: update me 
    # byebug
    redirect_to rentals_path
  end

  def index
    @rentals = Rental.all
  end
  
  def show
    @rental = Rental.find params[:id]
  end
  
  def edit
    @rental = Rental.find params[:id]
  end
  
  def update
    rental = Rental.find(params[:id])
    rental.update! rental_params

    TravelTime.find_travel_duration([rental], Destination.all)#TODO: update me 
    
    redirect_to rental_path(params[:id])
  end

  def destroy
    Rental.find(params[:id]).destroy

    redirect_to rentals_path
  end

  private def rental_params
    p params.require(:rental).permit(:street_address, :suburb_id, :price, :image) 
  end
end
