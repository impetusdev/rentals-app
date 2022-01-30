class Suburb < ApplicationRecord
    has_many :rentals
    has_many :destinations
end
