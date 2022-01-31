class CreateTravelTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_times do |t|
      t.integer :destination_id
      t.integer :rental_id
      t.float :duration

      t.timestamps
    end
  end
end
