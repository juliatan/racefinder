# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Race.create(
	name:"London",
	address:"London SE10 8QY, UK",
	start_lat: 51.477805,
	start_long: 0.001416,
	finish_lat: 51.503068,
	finish_long: 0.130279
	)
Race.create(
	name:"Paris",
	address:"Champs-Élysées,
	Paris, France",
	start_lat: 48.872591,
	start_long: 2.298546,
	finish_lat: 48.872478,
	finish_long: 2.282732
	)
Race.create(
	name:"Berlin",
	address:"10785, Berlin, Germany",
	start_lat: 52.514149,
	start_long: 13.363679,
	finish_lat: 52.51622,
	finish_long: 13.37573 
	)
Race.create(
	name:"Sydney",
	address:"Bradfield Park, Alfred St S, Milsons Point NSW 2061, Australia",
	start_lat: -33.849216,
	start_long: 151.211808,
	finish_lat: -33.857998,
	finish_long: 151.214262 
	)
Race.create(
	name:"New York",
	address:"10305, Staten Island, Richmond, NY, USA",
	start_lat: 40.6020524,
	start_long: -74.0595245,
	finish_lat: 40.772541,
	finish_long: -73.9766868
	)
