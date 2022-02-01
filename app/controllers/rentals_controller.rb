class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    # couldn't I just convert the params to an id here?
    Rental.create! rental_params
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
    Rental.find(params[:id]).update! rental_params
    redirect_to rental_path(params[:id])
  end

  def destroy
    Rental.find(params[:id]).destroy
    redirect_to rentals_path
  end

  private def rental_params
    p params.require(:rental).permit [:street_address, :suburb_id, :price, :image]
  end
end
