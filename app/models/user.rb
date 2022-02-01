class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :destinations
    has_and_belongs_to_many :rentals
end
