class Location < ApplicationRecord
    self.abstract_class = true
    
    # belongs_to :suburb
    # has_and_belongs_to_many :users
    # has_many :travel_times

    # show all destinations owned by user. 
    def self.all_owned (current_user = @current_user)
        self.select do |location|
            #where the users have atleast one value where it is true
            location.users.any? {|user| user.id == current_user.id} 
        end
    end

    # arr of symbols for quick use in partial render & form output params confirmation 
end
