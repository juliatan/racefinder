class Mailer < ActionMailer::Base
  default from: "no-reply@strides.com"

  def confirmation(hotel, user, arrival, departure)
  	@user = user
    @hotel = hotel
    @arrival = arrival
    @departure = departure
  	mail(to: @user.email, subject: '*Strides* Your itinerary')
  end
end
