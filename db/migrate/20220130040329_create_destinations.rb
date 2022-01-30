class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.text :street_address
      t.text :suburb
      t.float :frequency

      t.timestamps
    end
  end
end
