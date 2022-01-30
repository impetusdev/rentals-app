class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    Rental.create rental_params
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
    Rental.update rental_params
  end

  def destroy
    Rental.find(params[:id]).destroy
  end

  private def rental_params
    params.require(:rental).permit( :street_address, :suburb, :price, :image )
  end
  
end
