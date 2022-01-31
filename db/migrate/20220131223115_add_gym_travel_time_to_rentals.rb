class AddGymTravelTimeToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :gym_travel_time, :float
  end
end
