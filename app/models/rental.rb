class Rental < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :suburb
    
    def self.list_params
        [:street_address, :suburb, :price, :image]
    end
    
end
