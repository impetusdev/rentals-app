class TravelTime < ApplicationRecord
    belongs_to :destination # think aobut whether this association is correct
    belongs_to :rental # think aobut whether this association is correct

    def self.find_distances(destinations, origins)
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
        
        url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&mode=transit&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")
        p "URL is: #{url}"

        api_obj = HTTParty.get(url)
        
        # I need to loop over the rows and the elements to get the respective value which I can then use to add to the travel_time table
        api_obj['rows'].each.with_index do |row, i|
            row['elements'].each.with_index do |el, j|
                TravelTime.create!(
                    destination_id: destinations[i].id,
                    rental_id: origins[i].id,
                    duration: el['duration']['value']
                )
            end
        end
        #TODO: I THINK I NOW NEED TO UPDATE THE TRAVEL TIME COL IN THE RENTALS INDEX
    end
end