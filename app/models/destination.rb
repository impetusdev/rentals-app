class Destination < ApplicationRecord
    belongs_to :suburb
    has_and_belongs_to_many :user
    has_many :travel_times

    # show all destinations owned by user. 
    def self.all_owned (current_user = @current_user)
        self.select do |destination|
            #where the users have atleast one value where it is true
            destination.user.ids[0] == current_user.id 
        end
    end

    # arr of symbols for quick use in partial render & form output params confirmation 
    def self.list_params
        [:street_address, :suburb_id, :frequency]
    end
end
