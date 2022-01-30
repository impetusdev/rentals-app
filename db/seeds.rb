puts 'Creating the suburbs table using a csv file'
Suburb.destroy_all
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'suburb_lga_assult.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')

#TODO: NEED HELP REGARDING THIS. 
csv.each do |row|
    row = row.to_hash
    Suburb.create!(
        lga: row[row.keys[0]],
        name: row['name'],
        postcode: row['postcode'],
        assault_rate: row['assault_rate']
    )
end


puts 'Creating new User seed data'
User.destroy_all

u1 = User.create!(
    username: 'laurence',
    password_digest: 'chicken',
    time_value: 30
)


Rental.destroy_all
puts 'Creating new Rental seed data'

r1 = Rental.create!( #TODO: try generating seed data from the webscrapper afterwards
    street_address: '8 Carrington Street',
    suburb: 'Strathfield',
    price: '690',
    image: 'https://i.imgur.com/XXENw5K.jpg?1'
)

r2 = Rental.create!( 
    street_address: '2E/19-21 George Street',
    suburb: 'North Strathfield',
    price: '610',
    image: 'https://i2.au.reastatic.net/951x1292-resize,extend,r=33,g=40,b=46/d2e170bbd5bf9240b65a66ca962b07b3ae448ab17a2dd61ef2ec255f98105027/image2.jpg'
)

r3 = Rental.create!( 
    street_address: '2 Beronga Street',
    suburb: 'North Strathfield',
    price: '650',
    image: 'https://i2.au.reastatic.net/808x1288-resize,extend,r=33,g=40,b=46/cd561f95dc4132527d03c7966bc92b1936424dd9404b1f91742139fdfeb816b6/image.jpg'
)

u1.rentals << r1 << r2 << r3 # ask luke to find out what's wrong with this. 

puts 'Creating new Destinations'
Destination.destroy_all

# Laurence's
d1 = Destination.create!(
    street_address: '12 Bowler Avenue',
    suburb: 'Fairfield',
    frequency: '2'
)

d2 = Destination.create!(
    street_address: '15 Broadway',
    suburb: 'Ultimo',
    frequency: '2'
)

d3 = Destination.create!(
    street_address: '129 Harrington street',
    suburb: 'Sydney',
    frequency: '0.3'
)

# Edward's
d4 = Destination.create!(
    street_address: '85 Castlereagh street',
    suburb: 'Sydney',
    frequency: '2'
)

d5 = Destination.create!(
    street_address: '657 Punchbowl road',
    suburb: 'Punchbowl',
    frequency: '0.75'
)

# Patrick's
d6 = Destination.create!(
    street_address: 'F03, University of Sydney, Eastern Ave',
    suburb: 'Camperdown',
    frequency: '3'
)

#u1.destinations << d1 << d2 << d3
#u2.destinations << d4 << d5
#u3.destinations << d6
