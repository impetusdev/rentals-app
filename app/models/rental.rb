class Rental < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :suburb
    require "uri" # TODO: check if you can comment this out. 
    # require 'httparty' #TODO: figure out why this httparty isn't working

    
    def self.list_params
        [:street_address, :suburb, :price, :image]
    end

    #converting this location to a geocoord, 
    def find_gym
        full_address = "#{street_address} #{suburb.name} NSW Australia".gsub(/\s/,'%20') #TODO: figure how to get these street_address values
    
        url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{full_address}&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")
        p "URL is: #{url}"
        api_obj = HTTParty.get(url);
        # "The result is #{api_obj}"

        p lat_long = api_obj['results'][0]['geometry']['location'] # this is a hash
        p url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat_long['lat']}%2C#{lat_long['lng']}&radius=1500&type=gym&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")
    end
end
