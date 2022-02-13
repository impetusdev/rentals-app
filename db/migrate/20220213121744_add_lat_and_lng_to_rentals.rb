class AddLatAndLngToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :lat, :float
    add_column :rentals, :lng, :float
  end
end
