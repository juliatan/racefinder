json.array! @hotels do |hotel|
  json.name hotel["name"]
  json.address hotel["address1"]
  json.id hotel["hotelID"]
  json.lat hotel["latitude"]
  json.long hotel["longitude"]
  json.price hotel["RoomRateDetailsList"]["RoomRateDetails"]["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@averageRate"]
  json.rating hotel["hotelRating"]
  json.tripAdvisorRating hotel["tripAdvisorRating"]
end