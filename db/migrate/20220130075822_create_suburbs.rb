class CreateSuburbs < ActiveRecord::Migration[5.2]
  def change
    create_table :suburbs do |t|
      t.string :name
      t.string :lg
      t.integerassult_rate :postcode

      t.timestamps
    end
  end
end
