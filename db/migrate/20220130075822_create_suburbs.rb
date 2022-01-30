class CreateSuburbs < ActiveRecord::Migration[5.2]
  def change
    create_table :suburbs do |t|
      t.string :name
      t.string :lga
      t.integer :postcode
      t.float :assault_rate 

      t.timestamps
    end
  end
end
