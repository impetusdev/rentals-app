class Rental < ApplicationRecord
    has_and_belongs_to_many :users
    
    def self.list_params
        [:street_address, :suburb, :price, :address]
    end
    
end
