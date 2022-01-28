class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.text :street_address
      t.string :suburb
      t.float :price
      t.text :image

      t.timestamps
    end
  end
end
