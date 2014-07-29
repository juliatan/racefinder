require 'messenger'

class MessagesController < ApplicationController

  def create
    # @user = current_user
    @hotel  = Hotel.find params[:hotel_id]
    @arrival = params[:arrival]
    @departure = params[:departure]

    # extracted Twilio code to lib directory to keep controller skinny
    messenger = Messenger.new(@hotel, @user, @arrival, @departure)
    messenger.send_sms!

    redirect_to(:back)
  end

end
