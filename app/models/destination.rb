class Destination < ApplicationRecord
    belongs_to :suburb
    has_and_belongs_to_many :user
    has_many :travel_times

    def self.list_params
        [:street_address, :suburb_id, :frequency]
    end
end
