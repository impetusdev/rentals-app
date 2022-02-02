puts 'Creating the suburbs table using a csv file'
Suburb.destroy_all
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'suburb_lga_assult.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')

#TODO: NEED HELP REGARDING THIS. 
csv.each do |row|
    row = row.to_hash
    Suburb.create!(
        lga: row['lga'],
        name: row['name'],
        postcode: row['postcode'],
        assault_rate: row['assault_rate']
    )
end


puts 'Creating new User seed data'
User.destroy_all

u1 = User.create!(
    username: 'l',
    password: 'chicken',
    time_value: 30
)

u2 = User.create!(
    username: 'edward',
    password: 'chicken',
    time_value: 25
)


Rental.destroy_all
puts 'Creating new Rental seed data'

r1 = Rental.create!( #TODO: try generating seed data from the webscrapper afterwards
    street_address: '8 Carrington Street',
    suburb_id: Suburb.find_by(name: 'STRATHFIELD').id,
    price: '690',
    image: 'https://i.imgur.com/XXENw5K.jpg?1'
)

r2 = Rental.create!( 
    street_address: '2E/19-21 George Street',
    suburb_id: Suburb.find_by(name: 'NORTH STRATHFIELD').id,
    price: '610',
    image: 'https://i2.au.reastatic.net/951x1292-resize,extend,r=33,g=40,b=46/d2e170bbd5bf9240b65a66ca962b07b3ae448ab17a2dd61ef2ec255f98105027/image2.jpg'
)

r3 = Rental.create!( 
    street_address: '2 Beronga Street',
    suburb_id: Suburb.find_by(name: 'NORTH STRATHFIELD').id,
    price: '650',
    image: 'https://i2.au.reastatic.net/808x1288-resize,extend,r=33,g=40,b=46/cd561f95dc4132527d03c7966bc92b1936424dd9404b1f91742139fdfeb816b6/image.jpg'
)

u1.rentals << r1 << r2 << r3 # ask luke to find out what's wrong with this. 

puts 'Creating new Destinations'
Destination.destroy_all

# Laurence's
d1 = Destination.create!(
    street_address: '12 Bowler Avenue',
    suburb_id: Suburb.find_by(name: 'FAIRFIELD').id,
    frequency: '10'
)

d2 = Destination.create!(
    street_address: '15 Broadway',
    suburb_id: Suburb.find_by(name: 'ULTIMO').id,
    frequency: '2'
)

d3 = Destination.create!(
    street_address: '129 Harrington street',
    suburb_id: Suburb.find_by(name: 'SYDNEY').id,
    frequency: '0.3'
)

# Edward'sd
d4 = Destination.create!(
    street_address: '85 Castlereagh street',
    suburb_id: Suburb.find_by(name: 'SYDNEY').id,
    frequency: '2'
)

d5 = Destination.create!(
    street_address: '657 Punchbowl road',
    suburb_id: Suburb.find_by(name: 'PUNCHBOWL').id,
    frequency: '0.75'
)

# Patrick's
# d6 = Destination.create!(
#     street_address: 'F03, University of Sydney, Eastern Ave',
#     suburb_id: Suburb.find_by(name: 'CAMPERDOWN').id,
#     frequency: '3'
# )

u1.destinations << d1 << d2 << d3
# u2.destinations << d4 << d5
#u3.destinations << d6

puts 'Creating the travel_times'
TravelTime.destroy_all

origins = Rental.all
destinations = Destination.all

TravelTime.find_travel_duration(origins, destinations)

# for all rentals, sum the values in the travel_times
Rental.all.each do |rental|
    # Add sum all the travel_times durations to this. 
    rental.total_travel_time = rental.travel_times.sum(&:duration)
    rental.save
end