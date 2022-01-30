class Destination < ApplicationRecord
    belongs_to :suburb

    
    def self.list_params
        [:street_address, :suburb, :frequency]
    end
end
