json.array! @hotels do |hotel|
  json.name hotel["name"]
  json.id hotel["hotelID"]
  json.lat hotel["latitude"]
  json.long hotel["longitude"]
  json.price hotel["RoomRateDetailsList"]["RoomRateDetails"]["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@averageRate"]
  json.hotelRating hotel["hotelRating"]
  json.tripAdvisorRating hotel["tripAdvisorRating"]
end