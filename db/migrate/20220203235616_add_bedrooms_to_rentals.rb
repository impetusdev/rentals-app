class AddBedroomsToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :bedrooms, :integer
  end
end
