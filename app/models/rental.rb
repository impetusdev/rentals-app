class Rental < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :suburb
    has_many :travel_times
    
    require "uri" # TODO: check if you can comment this out. 
    # require 'httparty' #TODO: figure out why this httparty isn't working
    
    def self.list_params
        [:street_address, :suburb_id, :price, :image]
    end

    # gets a hash with the nearest gyms to this rental address
    def find_gym
        full_address = "#{street_address} #{suburb.name} NSW Australia".gsub(/\s/,'%20') #TODO: figure how to get these street_address values
    
        url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{full_address}&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")
        # p "URL is: #{url}"
        api_obj = HTTParty.get(url);
        # "The result is #{api_obj}"

        lat_long = api_obj['results'][0]['geometry']['location'] # this is a hash
        url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat_long['lat']}%2C#{lat_long['lng']}&radius=1500&type=gym&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")
        # puts "The url for the google gyms request is: #{url}"

        gyms = HTTParty.get(url)['results'][0];
        gym_address = gyms['vicinity'];
        gym_name = gyms['name']
        # puts "#{gym_name} is located at #{gym_address}"
        #TODO: user this gym data to perform a distance matrix query
    end
    
    #using using arr of origins and destinations querying the Google Distance matrix API we can find the duration of travel the rental properties listed. 
    # private 
end