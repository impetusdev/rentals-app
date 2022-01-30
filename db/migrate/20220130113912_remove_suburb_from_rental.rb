class RemoveSuburbFromRental < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :suburb, :string
  end
end
