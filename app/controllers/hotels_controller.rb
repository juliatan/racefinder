require 'json'
require 'open-uri'

class HotelsController < ApplicationController
  def index

    # dates = params[:nights].split(' - ')
    # arrival = dates[0]
    #   a = arrival.chars
    #   a.delete_at(6)
    #   a.delete_at(6)
    #   arrival_y = a.join
    # departure = dates[1]
    #   d = departure.chars
    #   d.delete_at(6)
    #   d.delete_at(6)
    #   departure_y = d.join
    # arrival_formatted = "#{arrival_y.gsub('/', '%2F')}"
    # departure_formatted = "#{departure_y.gsub('/', '%2F')}"
    
    # url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464671&minorRev=99&apiKey=rthjbmnexf9e6z7863ru5w9n&locale=en_US&currencyCode=GBP&latitude=52.5167&longitude=13.3833&arrivalDate=" + arrival_formatted + "&departureDate=" + departure_formatted + "&numberOfResults=10&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PROXIMITY&maxRate=300"
  
    # data = open(url).read

    # @hotels = JSON.parse(data)["HotelListResponse"]["HotelList"]["HotelSummary"]

    # @hotels_id = []

    # @hotels.each do |hotel|
    #   @hotels_id << hotel["hotelId"]
    # end

    # @hotels_info = []

    # @hotels_id.each do |id|
    #   url = "https://api.eancdn.com/ean-services/rs/hotel/v3/info?cid=464671&minorRev=99&apiKey=rthjbmnexf9e6z7863ru5w9n&locale=en_US&currencyCode=GBP&hotelId="+id.to_s
    #   data = open(url).read
    #   @hotels_info << JSON.parse(data)["HotelInformationResponse"]
    # end

    @race = Race.find_by(name: params[:marathon])
    @hotels = Hotel.find_by params
  end
end
