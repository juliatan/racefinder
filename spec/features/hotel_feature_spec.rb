require 'rails_helper'

describe 'Hotels' do

  before do
    load "#{Rails.root}/db/seeds.rb"
  end

  it 'can display ★★★★★', js: true do
    Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368, rating: 5.0)
    visit '/races?utf8=%E2%9C%93&marathon=Berlin&preferred_location=Start+line&price=200&arrival=08%2F01%2F2014&departure=08%2F05%2F2014'
    sleep 1
    page.execute_script("google.maps.event.trigger(window.map.markers[2], 'click');")
    within '.hotel-info-container' do
      expect(page).to have_content '★★★★★'
    end
    # expect(page).to have_content '★★★★★'
  end

  # it 'can display ★★★★☆'

  context 'sending emails' do
    before do
      clear_emails
      bob = User.create(name: 'Bob', email: 'bob@bob.com', password: '12345678', password_confirmation: '12345678')
      login_as bob
    end

    it 'can send the itinerary via email', js: true do
      Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368, rating: 5.0, image1: 'http://i.telegraph.co.uk/multimedia/archive/01836/ritz_1836745a.png', image2: 'http://i.telegraph.co.uk/multimedia/archive/01836/ritz_1836745a.png', image3: 'http://i.telegraph.co.uk/multimedia/archive/01836/ritz_1836745a.png', image4: 'http://i.telegraph.co.uk/multimedia/archive/01836/ritz_1836745a.png')
      visit '/races?utf8=%E2%9C%93&marathon=Berlin&preferred_location=Start+line&price=200&arrival=08%2F01%2F2014&departure=08%2F05%2F2014'
      sleep 1
      page.execute_script("google.maps.event.trigger(window.map.markers[2], 'click');")
      find('#map .email-itinerary').click
      sleep 1
      open_email('bob@bob.com')
      p current_email
      expect(current_email).to have_content 'Hotel1'
      expect(current_email).to have_content '08/01/2014'
      expect(current_email).to have_content '08/05/2014'
    end
  end

end