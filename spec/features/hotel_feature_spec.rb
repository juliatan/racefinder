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
    expect(page.evaluate_script("window.map.markers[2].infoWindow.content")).to have_content '★★★★★'
    # expect(page).to have_content '★★★★★'
  end

  it 'can display ★★★★☆'

end