class MessagesController < ApplicationController

  def create
    @hotel  = Hotel.find params[:hotel_id]
    
    # think about extracting code below to lib directory to keep controllers skinny
    # messenger = HotelMessenger.new(hotel)
    # messenger.send_sms!

    @client = Twilio::REST::Client.new(Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_auth_token)
     
    from = Rails.application.secrets.twilio_phone_num
    time = Time.now

    @client.account.messages.create(
      :from => from,
      :to => '+447789223025',
      :body => "** Strides Itinerary ** Hotel: #{@hotel.name}. Address: #{@hotel.address}. Phone: phone. Check in: date, Check out: date"
      )

    redirect_to(:back)
  end

end
