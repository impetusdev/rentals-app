class AddSuburbIdToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :suburb_id, :integer
  end
end
