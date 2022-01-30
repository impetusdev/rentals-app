class Destination < ApplicationRecord
    def self.list_params
        [:street_address, :suburb, :frequency]
    end
end
