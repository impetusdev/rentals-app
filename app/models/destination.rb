class Destination < Location
    belongs_to :suburb
    has_and_belongs_to_many :users
    has_many :travel_times

    # arr of symbols for quick use in partial render & form output params confirmation 
    def self.list_params
        [:street_address, :suburb_id, :frequency]
    end
end
