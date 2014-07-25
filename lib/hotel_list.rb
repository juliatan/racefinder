require 'json'
require 'open-uri'
# require '/app/models/race'

def hotel_api_call_start_line

  cities = Race.all

  cities.each do |city|

    current_date = Time.now + 24*60*60*30*7
    current_date_formatted = "#{current_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
    # current_date_formatted = "08%2F01%2F14"
    departure_date = current_date + 24*60*60
    departure_date_formatted = "#{departure_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
    # departure_date_formatted = "08%2F02%2F14"

    latitude = city.start_lat.to_s
    longitude = city.start_long.to_s

    url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464790&minorRev=99&apiKey=2gywypsv9qv5w4w4wk57jehm&locale=en_US&currencyCode=GBP&latitude=" + latitude + "&longitude=" + longitude + "&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PROXIMITY&maxRate=300&arrivalDate=" + current_date_formatted + "&departureDate=" + departure_date_formatted + "&numberOfResults=5"
  
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
end

def hotel_api_call_finish_line

  cities = Race.all

  cities.each do |city|

    current_date = Time.now + 24*60*60*30*7
    current_date_formatted = "#{current_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
    # current_date_formatted = "08%2F01%2F14"
    departure_date = current_date + 24*60*60
    departure_date_formatted = "#{departure_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
    # departure_date_formatted = "08%2F02%2F14"

    latitude = city.finish_lat.to_s
    longitude = city.finish_long.to_s

    url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464790&minorRev=99&apiKey=2gywypsv9qv5w4w4wk57jehm&locale=en_US&currencyCode=GBP&latitude=" + latitude + "&longitude=" + longitude + "&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PROXIMITY&maxRate=300&arrivalDate=" + current_date_formatted + "&departureDate=" + departure_date_formatted + "&numberOfResults=5"
  
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

  