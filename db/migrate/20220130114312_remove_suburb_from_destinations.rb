class RemoveSuburbFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :suburb, :text
  end
end
