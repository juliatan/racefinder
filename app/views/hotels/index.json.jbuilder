json.array! @city_hotels_selected do |hotel|
  json.name     hotel.name
  json.address  hotel.address
  json.id       hotel.hotel_id
  json.lat      hotel.lat
  json.long     hotel.long
  json.price    hotel.price
  json.rating   hotel.rating
  json.tripAdvisorRating  hotel.tripadvisor_rating
  json.image1   hotel.image1
  json.image2   hotel.image2
  json.image3   hotel.image3
  json.image4   hotel.image4
  json.gym      hotel.gym
  json.wifi     hotel.wifi
  json.breakfast  hotel.breakfast
end