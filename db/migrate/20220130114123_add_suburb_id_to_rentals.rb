class AddSuburbIdToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :suburb_id, :integer
  end
end
