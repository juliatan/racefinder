require 'rails_helper'
require 'launchy'

describe 'Map listing for race' do

  before do
    load "#{Rails.root}/db/seeds.rb"
  end

  it 'should display a map', js: true do
    enter_race_details
    expect(page).to have_map
  end

  # it 'should show the starting point'

  # it 'should show the finish point'

  it 'can display a hotel name', js: true do
    Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368)
    visit '/races?utf8=%E2%9C%93&marathon=Berlin&preferred_location=Start+line&price=200&arrival=08%2F01%2F2014&departure=08%2F05%2F2014&commit=Search'
    sleep 1
    expect(page.evaluate_script("window.map.markers[2].infoWindow.content")).to have_content 'Hotel1'
  end

  it 'can show more than one hotel', js: true do
   Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368)
    Hotel.create!(race_id: 3, name: 'Hotel2', price: 150, lat: 52.509237, long: 13.37384, ref_lat: 52.51415, ref_long: 13.36368)
    enter_race_details
    sleep 5
    expect(page.evaluate_script("window.map.markers.length")).to eq 4
  end

  it 'shows one picture of the hotel', js: true do
    Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368, image1: "./../images/ritz_carlton_1.jpg")
    enter_race_details
    sleep 5
    page.execute_script("google.maps.event.trigger(window.map.markers[2], 'click');")
    expect(page).to have_css 'img.hotel-photo'
  end

  it 'shows relevant hotels for user selected city and reference point', js: true do
    Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368)
    Hotel.create!(race_id: 3, name: 'Hotel2', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 51.47781, ref_long: 0.00142)
    enter_race_details
    sleep 1
    expect(page.evaluate_script("window.map.markers.length")).to eq 3
  end

end

# describe 'Single hotel popup' do


#   it 'can show more pictures of the hotel'

#   it 'shows the hotel rating'

#   it 'shows the hotel price per night'

#   it 'hotel which has a gym'

#   it 'hotel which has no gym'

#   it 'shows the distance from the starting point of the race'

#   it 'shows the walking time from the starting point'

#   it 'shows a suggestion on when to leave the hotel'

# end

class Capybara::Session
  def has_map?
    has_css?('.gm-style')
  end
end