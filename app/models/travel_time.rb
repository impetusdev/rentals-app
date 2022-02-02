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
                #TODO: I think I need to check if the item exists
                current_travel_time = TravelTime.find_by(rental_id: origins[i].id, destination_id: destinations[i].id)
                # byebug
                if current_travel_time.present?
                    current_travel_time.update!(
                        rental_id: origins[i].id, # TODO: I think I can remove these id values because they don't change
                        destination_id: destinations[i].id,
                        duration: el['duration']['value']
                    )
                else
                    TravelTime.create!(
                        rental_id: origins[i].id,
                        destination_id: destinations[i].id,
                        duration: el['duration']['value']
                    )
                end
            end
        end
        
        byebug
        #4.
        origins.each do |rental|
            rental.total_travel_time = rental.travel_times.sum(&:duration) 
            rental.save
        end
    end
end