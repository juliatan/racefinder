class MailerController < ApplicationController
	before_action :authenticate_and_store_url

  def create
    @user = current_user
    @hotel  = Hotel.find params[:hotel_id]
    @arrival = params[:arrival]
    @departure = params[:departure]
    @marathon = params[:marathon]

    Mailer.confirmation(@hotel, @user, @arrival, @departure, @marathon).deliver
    redirect_to(:back)
  end

  private

  def authenticate_and_store_url
  	return if current_user
  	store_location_for(:user, request.referer)
  	# referer is the url prior to the url that sent you to the location
  	authenticate_user!
  end

end
