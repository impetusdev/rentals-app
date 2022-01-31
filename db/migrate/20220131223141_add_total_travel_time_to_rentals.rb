class AddTotalTravelTimeToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :total_travel_time, :float
  end
end
