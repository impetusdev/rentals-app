class TravelTime < ApplicationRecord
    belongs_to :destination # think aobut whether this association is correct
    belongs_to :rental # think aobut whether this association is correct

    # 1. Converts all origin & destination addresses to the API query form
    # 2. Performs HTTP API request
    # 3. Writes the results to their respective TravelTime table rows. 
    # 4. updates the total_travel_time
    def self.find_travel_duration( origins, destinations)
        #1. 
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

        #2.
        api_obj = HTTParty.get(url)
        
        #3.
        api_obj['rows'].each.with_index do |row, i|
            row['elements'].each.with_index do |el, j|
                TravelTime.create!(
                    destination_id: destinations[i].id,
                    rental_id: origins[i].id,
                    duration: el['duration']['value']
                )
            end
        end
        
        #4.
        origins.each do |rental|
            rental.total_travel_time = rental.travel_times.sum(&:duration) 
            rental.save
        end
    end
end