json.array! @city_hotels_selected do |hotel|
  json.name     hotel.name
  json.address  hotel.address
  json.city     hotel.city
  json.id       hotel.id
  json.hotel_id hotel.hotel_id
  json.lat      hotel.lat
  json.long     hotel.long
  json.price    hotel.price
  json.rating   star_rating(hotel.rating)
  json.tripAdvisorRating  hotel.tripadvisor_rating
  json.image1   hotel.image1
  json.image2   hotel.image2
  json.image3   hotel.image3
  json.image4   hotel.image4
  
  if hotel.gym == true
    json.gym      "Gym"
  else
    json.gym      "No gym"
  end

  if hotel.wifi == true
    json.wifi     "Wifi"
  else
    json.wifi     "No wifi"
  end

  if hotel.breakfast == true
    json.breakfast     "Breakfast option"
  else
    json.breakfast     "No breakfast option"
  end
end