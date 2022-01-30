class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
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
    params.require(:rental).permit Rental.list_params
  end
  
end
