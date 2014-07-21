require 'rails_helper'

describe 'Map listing for race' do

  it 'should display a map', js: true do
    visit '/races'
    expect(page).to have_map
  end

  # it 'should show the starting point'
  # cannot be tested

  # it 'should show the finish point'
  # cannot be tested

  it 'can show a hotel', js: true do
    visit '/races'
    sleep 1
    page.execute_script("google.maps.event.trigger(window.map.markers[2], 'click');")
    expect(page).to have_content 'Mandala Hotel'
  end

  # cannot be tested

  it 'can show more than one hotel', js: true do
    visit '/races'
    sleep 2
    expect(page.evaluate_script("window.map.markers.length")).to eq 4
  end

  it 'shows one picture of the hotel', js: true do
    visit '/races'
    sleep 1
    page.execute_script("google.maps.event.trigger(window.map.markers[2], 'click');")
    expect(page).to have_css 'img.hotel-photo'
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