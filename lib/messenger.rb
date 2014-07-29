class Messenger

  def initialize(hotel, user, arrival, departure)
    @hotel = hotel
    @user = user
    @arrival = arrival
    @departure = departure
  end

  def send_sms!
    @client = Twilio::REST::Client.new(Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_auth_token)
     
    from = Rails.application.secrets.twilio_phone_num
    # time = Time.now

    @client.account.messages.create(
      :from => from,
      :to => Rails.application.secrets.mobile,
      # :to => '#{@user.phone}',
      :body => "** STRIDES Itinerary ** #{@hotel.name}, #{@hotel.address}, #{@hotel.city}. Check in: #{@arrival}. Check out: #{@departure}"
    )
  end
end