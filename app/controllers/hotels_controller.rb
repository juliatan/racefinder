require 'json'
require 'open-uri'

class HotelsController < ApplicationController
  def index

    # current_date = Time.now.strftime('%m/%d/%y').gsub('/', '%2F')
    current_date = Time.now.strftime('%m/%d/%Y')
    departure_date = current_date + params[:nights]

    # url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464671&minorRev=99&apiKey=rthjbmnexf9e6z7863ru5w9n&locale=en_US&currencyCode=GBP&latitude=52.5167&longitude=13.3833&arrivalDate=08%2F01%2F14&departureDate=08%2F20%2F14&numberOfResults=10&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PROXIMITY&maxRate=300"

    url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464671&minorRev=99&apiKey=rthjbmnexf9e6z7863ru5w9n&locale=en_US&currencyCode=GBP&latitude=52.5167&longitude=13.3833&arrivalDate=" + current_date + "&departureDate=" + departure_date + "&numberOfResults=10&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PROXIMITY&maxRate=300"
  
    data = open(url).read

    @hotels = JSON.parse(data)["HotelListResponse"]["HotelList"]["HotelSummary"]

    @hotels_id = []

    @hotels.each do |hotel|
      @hotels_id << hotel["hotelId"]
    end

    @hotels_info = []

    @hotels_id.each do |id|
      url = "https://api.eancdn.com/ean-services/rs/hotel/v3/info?cid=464671&minorRev=99&apiKey=rthjbmnexf9e6z7863ru5w9n&locale=en_US&currencyCode=GBP&hotelId="+id.to_s
      data = open(url).read
      @hotels_info << JSON.parse(data)["HotelInformationResponse"]
    end

  end
end
