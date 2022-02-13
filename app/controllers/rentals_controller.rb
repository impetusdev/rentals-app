class RentalsController < ApplicationController
  before_action :check_if_logged_in
  
  def new 
    @rental = Rental.new
  end

  def create
    rental = Rental.new rental_params
    rental.users << @current_user
    rental.save
    TravelTime.find_travel_duration([rental], Destination.all) #TODO: update me 

    redirect_to rentals_path
  end

  def index
    @rentals = Rental.all_owned(@current_user)

    case params[:order]
    when 'bedrooms'
      @rentals = @rentals.sort_by { |rental| rental.bedrooms }  #move into model, and scopes
    when 'price'
      @rentals = @rentals.sort_by { |rental| rental.price }
    when 'travel_time'
      @rentals = @rentals.sort_by { |rental| rental.total_travel_time }
    when 'assault_rate'
      @rentals = @rentals.sort_by { |rental| rental.suburb.assault_rate }
    end
  end

  def show
    @rental = Rental.find params[:id]
    @iframe_url = "https://www.google.com/maps/embed/v1/place?key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko&q=#{@rental.lat},#{@rental.lng}&maptype=satellite&zoom=17"
    puts @iframe_url
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
    p params.require(:rental).permit Rental.list_params 
  end
end