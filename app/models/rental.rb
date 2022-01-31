class Rental < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :suburb
    require "uri" # TODO: check if you can comment this out. 
    # require 'httparty' #TODO: figure out why this httparty isn't working
    
    def self.list_params
        [:street_address, :suburb, :price, :image]
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
        puts "The url for the google gyms request is: #{url}"

        gyms = HTTParty.get(url)['results'][0];
        gym_address = gyms['vicinity'];
        gym_name = gyms['name']
        puts "#{gym_name} is located at #{gym_address}"
    end

    #using using arr of origins and destinations querying the Google Distance matrix API we can find the duration of travel the rental properties listed. 
    # private 
    def find_distances()
        origins = Rental.all
        destinations = Destination.all
        # TODO: do the full destinations/rentals for the seed data, Then one request for the new rental against existing distances and new destination against existing rentals. This will minimise api usage. 
        # loop over each origin and each destination generating the url query. 
        destination = ''
        origin = ''

        origins.each do |o|
            origin += "#{o.street_address} #{o.suburb.name} NSW Australia".gsub(/\s/,'%20') + '%2CMA%7C'
        end

        destinations.each do |d|
            destination += "#{d.street_address} #{d.suburb.name} NSW Australia".gsub(/\s/,'%20') + '%2CMA%7C'
        end
        
        url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&mode=TRANSIT&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")
        p "URL is: #{url}"
        return
        # api_obj = HTTParty.get(url)
        # travel_time = api_obj['rows'][0]['elements'][0]['duration']['value']
    end
end

# TODO: convert my matrix formula to this: url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=merrylands%20NSW%20aus%2CMA%7Cgranville%20nsw%20aus%2CMA&destinations=canberra%20ACT%20aus%2CMA%7Cfairfield%20NSW%20aus%2CMA&departure_time=now&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")