require 'json'
require 'open-uri'

def hotel_api_call

  url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464671&minorRev=99&apiKey=rthjbmnexf9e6z7863ru5w9n&locale=en_US&currencyCode=GBP&latitude=52.5167&longitude=13.3833&numberOfResults=10&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PROXIMITY&maxRate=300"
  
  data = open(url).read
  hotels = JSON.parse(data)["HotelListResponse"]["HotelList"]["HotelSummary"]

  hotels.each do |hotel|
    hotel_id = hotel["hotelId"]
    name = hotel["name"]
    address = hotel["address1"]
    lat = hotel["latitude"]
    long = hotel["longitude"]
    # price = hotel["RoomRateDetailsList"]["RoomRateDetails"]["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@averageRate"]
    price = (hotel["highRate"] + hotel["lowRate"])/2
    rating = hotel["hotelRating"]
    tripadvisor_rating = hotel["tripAdvisorRating"]
    city = hotel["city"]

    Hotel.create(hotel_id: hotel_id, name: name, address: address, lat: lat, long: long, price: price, rating: rating, tripadvisor_rating: tripadvisor_rating, ref_lat: latitude, ref_long: longitude, city: city)
  end

end

# def hotel_images
# json.images @hotels_info[index]["HotelImages"]["HotelImage"].first(4) do |image|
#     json.image_url image["url"]
#   end

# end

# current_date = Time.now
#     current_date_formatted = "#{current_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
#     departure_date = current_date + params[:nights].to_i*24*60*60
#     departure_date_formatted = "#{departure_date.strftime('%m/%d/%y').gsub('/',"%2F")}"

  