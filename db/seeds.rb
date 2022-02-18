# puts 'Creating the suburbs table using a csv file'
# Suburb.destroy_all
# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'suburb_lga_assult.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')

# #TODO: LOOK INTO RAKE TASKS
# csv.each do |row|
#     row = row.to_hash
#     Suburb.create!(
#         lga: row['lga'],
#         name: row['name'],
#         postcode: row['postcode'],
#         assault_rate: row['assault_rate']
#     )
# end

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
    image: 'https://i.imgur.com/XXENw5K.jpg?1',
    bedrooms: 2
)

r2 = Rental.create!( 
    street_address: '2E/19-21 George Street',
    suburb_id: Suburb.find_by(name: 'NORTH STRATHFIELD').id,
    price: '610',
    image: 'https://rimh2.domainstatic.com.au/iR5SYhdZA3AHoRxdt-dgiNxEr4Q=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/2017406862_2_1_211112_024307-w1920-h1280',
    bedrooms: 3
)

r3 = Rental.create!( 
    street_address: '2 Beronga Street',
    suburb_id: Suburb.find_by(name: 'NORTH STRATHFIELD').id,
    price: '650',
    image: 'https://rimh2.domainstatic.com.au/xSI90FihRE763YNvA8VAHQf4QS0=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/2017552859_1_1_220127_062442-w3500-h2333',
    bedrooms: 4
)

r4 = Rental.create!( #TODO: try generating seed data from the webscrapper afterwards
    street_address: '8 Carrington Street',
    suburb_id: Suburb.find_by(name: 'STRATHFIELD').id,
    price: '690',
    image: 'https://rimh2.domainstatic.com.au/iH2_WZPBOS9UpBcHyXLbTaQX8c8=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/15685178_1_1_220128_023454-w800-h533',
    bedrooms: 2
)

r5 = Rental.create!( 
    street_address: '2E/19-21 George Street',
    suburb_id: Suburb.find_by(name: 'NORTH STRATHFIELD').id,
    price: '610',
    image: 'https://rimh2.domainstatic.com.au/8LJi6RWLbp18DuV-3hRlecCcfmI=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/12881684_1_1_190124_100618-w5184-h3456',
    bedrooms: 3
)

r6 = Rental.create!( #TODO: try generating seed data from the webscrapper afterwards
    street_address: 'H102/2 Quay Street',
    suburb_id: Suburb.find_by(name: 'HAYMARKET').id,
    price: '1300',
    image: 'https://rimh2.domainstatic.com.au/VNWx4nUhmaZirp530uWk1e7jjZo=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/15701102_1_1_220204_010848-w800-h533',
    bedrooms: 3
)

r7 = Rental.create!( 
    street_address: '15B/5 St Annes Street',
    suburb_id: Suburb.find_by(name: 'RYDE').id,
    price: '640',
    image: 'https://rimh2.domainstatic.com.au/Wtlzz0fAYx11MZwJnphP5kxurws=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/2016603911_2_1_210702_013523-w3000-h2000',
    bedrooms: 2
)

r8 = Rental.create!( #TODO: try generating seed data from the webscrapper afterwards
    street_address: 'Level 1, N109/233 Harris Street',
    suburb_id: Suburb.find_by(name: 'PYRMONT').id,
    price: '545',
    image: 'https://rimh2.domainstatic.com.au/81aAFmHrngteZ8anH0Ruv0755R0=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/15701051_1_1_220204_125837-w1500-h1000',
    bedrooms: 1
)

r9 = Rental.create!( 
    street_address: '22 Sutherland Street',
    suburb_id: Suburb.find_by(name: 'LANE COVE').id,
    price: '2100',
    image: 'https://rimh2.domainstatic.com.au/jmXrRRtoSRi9a50LGfir2dzFjOs=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/15701147_1_1_220204_012301-w1600-h1200',
    bedrooms: 4
)

r10 = Rental.create!( #TODO: try generating seed data from the webscrapper afterwards
    street_address: '9/18A Ewart Street',
    suburb_id: Suburb.find_by(name: 'MARRICKVILLE').id,
    price: '450',
    image: 'https://rimh2.domainstatic.com.au/h0OO_mPZrPpp6KOql8Kt0LBBIcc=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/15701034_1_1_220204_125700-w1920-h1279',
    bedrooms: 2
)

Rental.all().map { |rental| rental.update(rental.get_lat_lng)  }

u1.rentals << r1 << r2 << r3 << r6 << r7 << r8 << r9 << r10 
u2.rentals << r4 << r5

puts 'Creating new Destinations'
Destination.destroy_all

# Laurence's
d1 = Destination.create!(
    street_address: '12 Bowler Avenue',
    suburb_id: Suburb.find_by(name: 'FAIRFIELD').id,
    frequency: '2'
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
u2.destinations << d4 << d5
#u3.destinations << d6

puts 'Creating the travel_times'
TravelTime.destroy_all

rentals_1 = Rental.all_owned User.first
rentals_2 = Rental.all_owned User.second

destinations_1 = Destination.all_owned User.first
destinations_2 = Destination.all_owned User.second

#perform TravelTime.find_travel_duration for user 1 and user 2 
TravelTime.find_travel_duration(rentals_1, destinations_1)
TravelTime.find_travel_duration(rentals_2, destinations_2)

# TravelTime.find_travel_duration(origins, destinations)

#TODO: perform the total_travel_time calc for the current user destinations and rentals. 
# for all rentals, sum the values in the travel_times
Rental.all.each do |rental|
    # Add sum all the travel_times durations to this. 
    rental.total_travel_time = rental.travel_times.sum(&:duration)
    rental.save
end
