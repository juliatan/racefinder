require 'rails_helper'

describe 'Homepage' do
  it 'can select one marathon'

  it 'can select more than one marathon from a dropdown menu'

  it 'can select starting point as reference', js:true do
  	race = Race.create(name: "Berlin Marathon", address: 'Straße des 17. Juni 31, Berlin, Germany')
  	visit '/'
  	select 'Start line', from: 'preferred_location'
  	click_button 'Search'
  	sleep 1
  	expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of 13.363679999999922
  	expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 52.51414999999994
  end

  it 'can select finish point as reference'
  
  it 'can select one budget range from dropdown menu'

  context 'number of nights' do
    it 'displays one night in the dropdown' do
      visit '/'
      select '1 night', from: 'nights'
      click_button 'Search'
      expect(current_path).to eq races_path
    end
  end

end