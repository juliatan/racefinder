require 'rails_helper'

describe 'Homepage' do
  it 'can select Berlin', js:true do
    visit '/'
    select 'Berlin', from: 'marathon'
    select 'Start line', from: 'preferred_location'
    fill_in 'Number of nights', with: '1'
    click_button 'Search'
    sleep 1
    expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of 13.363679999999922
    expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 52.51414999999994
  end

  it 'can select London', js:true do
    visit '/'
    select 'London', from: 'marathon'
    select 'Start line', from: 'preferred_location'
    fill_in 'Number of nights', with: '1'
    click_button 'Search'
    sleep 1
    expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of -0.001416
    expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 51.477805
  end

  it 'can select more than one marathon from a dropdown menu'

  it 'can select starting point as reference', js:true do
  	race = Race.create(name: "Berlin Marathon", address: 'Straße des 17. Juni 31, Berlin, Germany')
  	visit '/'
    select 'Berlin', from: 'marathon'
  	select 'Start line', from: 'preferred_location'
    fill_in 'Number of nights', with: '1'
  	click_button 'Search'
  	sleep 1
  	expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of 13.363679999999922
  	expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 52.51414999999994
  end

  it 'can select finish point as reference'
  
  it 'can select one budget range from dropdown menu'

  context 'number of nights' do
    it 'user can fill in number of nights' do
      enter_race_details
      expect(current_url).to eq 'http://www.example.com/races?utf8=%E2%9C%93&preferred_location=Start+line&nights=1&commit=Search'
    end
  end

end