class CreateRentalsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals_users do |t|
      t.integer :rental_id
      t.integer :user_id
    end
  end
end
