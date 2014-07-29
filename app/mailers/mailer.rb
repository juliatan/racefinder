class Mailer < ActionMailer::Base
  default from: "no-reply@strides.com"

  after_create :send_itinerary

  def index
  	
  end

  def create
  	@hotel = Hotel.find params[:hotel_id]
  	# self.confirmation(@hotel)
  end

  def confirmation(hotel)
  	@user = current_user
  	mail(to: @user.email, subject: '*Strides* Your itinerary')
  end
end
