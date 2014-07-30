require 'json'
require 'open-uri'

def hotel_api_call_start_line

  cities = Race.all

  cities.each do |city|

    race_id = city.id

    current_date = Time.now + 24*60*60*30*7
    current_date_formatted = "#{current_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
    departure_date = current_date + 24*60*60
    departure_date_formatted = "#{departure_date.strftime('%m/%d/%y').gsub('/',"%2F")}"

    latitude = city.start_lat.to_s
    longitude = city.start_long.to_s

    max_rate = ["100", "200", "300"]

    max_rate.each do |rate|

      url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464791&minorRev=99&apiKey=t7sxcy7w8av2nexftnmffx66&locale=en_US&currencyCode=GBP&latitude=" + latitude + "&longitude=" + longitude + "&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PRICE_REVERSE&maxRate=" + rate + "&arrivalDate=" + current_date_formatted + "&departureDate=" + departure_date_formatted + "&numberOfResults=10"

      data = open(url).read
      @hotel_data = JSON.parse(data)["HotelListResponse"]["HotelList"]["HotelSummary"]
      if @hotel_data.is_a? Array
        @hotel_data.each { |hotel| create_hotel_with(hotel, latitude, longitude, race_id) } 
      else
        create_hotel_with(@hotel_data, latitude, longitude, race_id)
      end
    end
  end
end

def hotel_api_call_finish_line

  cities = Race.all

  cities.each do |city|

    race_id = city.id

    current_date = Time.now + 24*60*60*30*7
    current_date_formatted = "#{current_date.strftime('%m/%d/%y').gsub('/',"%2F")}"
    departure_date = current_date + 24*60*60
    departure_date_formatted = "#{departure_date.strftime('%m/%d/%y').gsub('/',"%2F")}"

    latitude = city.finish_lat.to_s
    longitude = city.finish_long.to_s

    max_rate = ["100", "200", "300"]

    max_rate.each do |rate|

      url = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?cid=464790&minorRev=99&apiKey=2gywypsv9qv5w4w4wk57jehm&locale=en_US&currencyCode=GBP&latitude=" + latitude + "&longitude=" + longitude + "&minStarRating=4&searchRadius=5&searchRadiusUnit=KM&sort=PRICE_REVERSE&maxRate=" + rate + "&arrivalDate=" + current_date_formatted + "&departureDate=" + departure_date_formatted + "&numberOfResults=10"
    
      data = open(url).read
      @hotel_data = JSON.parse(data)["HotelListResponse"]["HotelList"]["HotelSummary"]
      if @hotel_data.is_a? Array
        @hotel_data.each { |hotel| create_hotel_with(hotel, latitude, longitude, race_id) } 
      else
        create_hotel_with(@hotel_data, latitude, longitude, race_id)
      end
    end
  end
end

def create_hotel_with(hotel, latitude, longitude, race_id)
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
  tripadvisor_gif = hotel["tripAdvisorRatingUrl"]

  hotel_info_url = "https://api.eancdn.com/ean-services/rs/hotel/v3/info?cid=464790&minorRev=99&apiKey=2gywypsv9qv5w4w4wk57jehm&locale=en_US&currencyCode=GBP&hotelId=" + hotel_id.to_s
  hotel_data = open(hotel_info_url).read
  @hotel_info = JSON.parse(hotel_data)["HotelInformationResponse"]

  @hotel_images = []

  # take the first 4 images for each hotel only
  (0..3).to_a.each do |index|
    @hotel_images << @hotel_info["HotelImages"]["HotelImage"][index]["url"]
  end

  # # start amenities logic
  amenity_mask = hotel["amenityMask"].to_i
  bin_value = amenity_mask.to_s(2)
  b = bin_value.chars.map(&:to_i)
  @c = b.each_index.select{|i| b[i]==1}
  @array = []
  @c.each {|c| @array << b.map{|elem| elem=0}}

  def pop
    count = 0
    until count == @array.length do
      @array[count][@c[count]] = 1
      count +=1
    end
  end

  pop

  amenities_bin = @array.map{|a| a.join}
  @amenities = amenities_bin.map{|a| a.to_i(2)}

  def gym_included?
    @amenities.include? 2
  end
  def wifi_included?
    @amenities.include? 8
  end
  def breakfast_included?
    @amenities.include? 2048
  end

  gym = gym_included?
  wifi = wifi_included?
  breakfast = breakfast_included?
  # # end amenities logic

  Hotel.create(hotel_id: hotel_id, name: name, address: address, lat: lat, long: long, price: price, rating: rating, tripadvisor_rating: tripadvisor_rating, ref_lat: latitude, ref_long: longitude, city: city, image1: @hotel_images[0], image2: @hotel_images[1], image3: @hotel_images[2], image4: @hotel_images[3], race_id: race_id, amenity_mask: amenity_mask, gym: gym, wifi: wifi, breakfast: breakfast, tripadvisor_gif: tripadvisor_gif)
end