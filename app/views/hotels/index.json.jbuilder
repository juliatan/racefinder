json.array! @city_hotels_selected do |hotel|
  json.name     hotel.name
  json.address  hotel.address
  json.id       hotel.hotel_id
  json.lat      hotel.lat
  json.long     hotel.long
  json.price    hotel.price
  json.rating   hotel.rating
  json.tripAdvisorRating  hotel.tripadvisor_rating
end