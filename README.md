# User Stories

- [ ]  **View Properties (Insert/Seed into Dbs with rental properties from RealEstate.com) 4hrs**
- [ ]  **Destinations 2hrs**
- [ ]  **Find total time taken for travelling from each destination to each of the ‘destination_locations’ ( destination_location method ) 1hr**
- [ ]  **Find nearest gyms, recalculated at each prop ( destination_location method ) 4hr**
- [ ]  **Only perform calculation of travel_time when the user→destination doesn’t have a travel_time value 0.5hr**
- [ ]  **Login into account 3hr**
- [ ]  Sorting feature for the locations 1hr

- [ ]  Suburb drop down that will also query the safety array and attach it to the suburb table *(optional) 2hrs*
- [ ]  pages (optional) 1hr
- [ ]  *refreshes and searches for new locations with the scrapper (optional)*
- [ ]  Basic algorithm to model price of rental apartment, maybe a quick neural network (optional)
- [ ]  *Show the map of MVC that is dynamically updated, maybe for gym specifically (optional)*
- [ ]  *Display the destination-prop route*

# Data Bases

- rental_prop
    - price
    - street_address
    - suburb (change to id optional)
    - travel_time
    - image
    - link to the apartment
- destination_locations
    - address
    - frequency
    - time taken for travel
- user
    - name
    - time value for money
- suburb
    - crime rate per capita

I think this maybe a solution to doing more than one request at a time: https://stackoverflow.com/questions/40650227/google-map-distance-matrix-api-serverside-multiple-address-by-latlong
