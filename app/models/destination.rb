class Destination < ApplicationRecord
    belongs_to :suburb
    has_many :travel_times

    def self.list_params
        [:street_address, :suburb, :frequency]
    end
end
