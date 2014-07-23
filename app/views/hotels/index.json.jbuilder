json.array! @hotels.zip(0..@hotels.length) do |hotel, index|
  json.name hotel["name"]
  json.address hotel["address1"]
  json.id hotel["hotelId"]
  json.lat hotel["latitude"]
  json.long hotel["longitude"]
  json.price hotel["RoomRateDetailsList"]["RoomRateDetails"]["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@averageRate"]
  json.rating hotel["hotelRating"]
  json.tripAdvisorRating hotel["tripAdvisorRating"]

  json.images @hotels_info[index]["HotelImages"]["HotelImage"].first(4) do |image|
    json.image_url image["url"]
  end
end
