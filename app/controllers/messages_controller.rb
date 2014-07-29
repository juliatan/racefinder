class MessagesController < ApplicationController

  def create
    # @user = current_user
    @hotel  = Hotel.find params[:hotel_id]
    @arrival = params[:arrival]
    @departure = params[:departure]

    # think about extracting code below to lib directory to keep controllers skinny
    # messenger = HotelMessenger.new(hotel)
    # messenger.send_sms!

    @client = Twilio::REST::Client.new(Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_auth_token)
     
    from = Rails.application.secrets.twilio_phone_num
    # time = Time.now

    @client.account.messages.create(
      :from => from,
      :to => Rails.application.secrets.mobile,
      # :to => '#{@user.phone}',
      :body => "** Strides Itinerary ** #{@hotel.name}, #{@hotel.address}, #{@hotel.city}. Check in: #{@arrival}. Check out: #{@departure}"
      )

    redirect_to(:back)
  end

end
