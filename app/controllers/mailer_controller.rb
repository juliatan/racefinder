class MailerController < ApplicationController

  def create
    @user = current_user
    @hotel  = Hotel.find params[:hotel_id]
    @arrival = params[:arrival]
    @departure = params[:departure]

    # extracted Twilio code to lib directory to keep controller skinny
    Mailer.confirmation(@hotel, @user, @arrival, @departure).deliver
    redirect_to(:back)
  end

end
