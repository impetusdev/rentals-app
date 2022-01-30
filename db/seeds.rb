User.destroy_all

puts 'Creating new User seed data'
u1 = User.create!(
username: 'impetus_dev',
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

# print the testing data

# Need to do the linking of the items 
