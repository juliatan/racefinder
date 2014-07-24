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
	start_lat: 51.47781,
	start_long: 0.00142,
	finish_lat: 51.50386,
	finish_long: -0.13915
	)
Race.create(
	name:"Paris",
	address:"Champs-Élysées, Paris, France",
	start_lat: 48.87259,
	start_long: 2.29855,
	finish_lat: 48.87248,
	finish_long: 2.28273
	)
Race.create(
	name:"Berlin",
	address:"10785, Berlin, Germany",
	start_lat: 52.51415,
	start_long: 13.36368,
	finish_lat: 52.51622,
	finish_long: 13.37573 
	)
Race.create(
	name:"Sydney",
	address:"Bradfield Park, Alfred St S, Milsons Point NSW 2061, Australia",
	start_lat: -33.84922,
	start_long: 151.21181,
	finish_lat: -33.85801,
	finish_long: 151.21426 
	)
# Race.create(
# 	name:"New York",
# 	address:"10305, Staten Island, Richmond, NY, USA",
# 	start_lat: 40.60205,
# 	start_long: -74.05952,
# 	# start_lat: 40.785871,
# 	# start_long: -73.953352,
# 	finish_lat: 40.77254,
# 	finish_long: -73.97669
# 	)
Race.create(
	name:"Stockholm",
	address:"115 50 Stockholm, Sweden",
	start_lat: 59.34636,
	start_long: 18.08461,
	# start_lat: 40.785871,
	# start_long: -73.953352,
	finish_lat: 59.34522,
	finish_long: 18.07972
	)
