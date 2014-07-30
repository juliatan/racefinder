class MailerController < ApplicationController

  def create
    @user = current_user
    @hotel  = Hotel.find params[:hotel_id]
    @arrival = params[:arrival]
    @departure = params[:departure]
    @marathon = params[:marathon]

    Mailer.confirmation(@hotel, @user, @arrival, @departure, @marathon).deliver
    redirect_to(:back)
  end

end
