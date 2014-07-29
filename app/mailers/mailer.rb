class Mailer < ActionMailer::Base
  default from: "no-reply@strides.com"

  def confirmation(hotel, user)
  	@user = user
  	mail(to: @user.email, subject: '*Strides* Your itinerary')
  end
end
