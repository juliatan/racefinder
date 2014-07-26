require 'rails_helper'

describe 'Homepage' do

  before do
    load "#{Rails.root}/db/seeds.rb"
  end

  it 'can select Berlin', js:true do
    enter_race_details
    sleep 1
    expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 52.51414999999994
    expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of 13.363679999999922
  end

  it 'can select London', js:true do
    visit '/'
    select 'London', from: 'marathon'
    select 'Start line', from: 'preferred_location'
    select '200', from: 'price'
    fill_in 'Arrival', with: '08/01/2014'
    fill_in 'Departure', with: '08/05/2014'
    click_button 'Search'
    sleep 1
    expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 51.477805
    expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of -0.001416
  end

  it 'can select finish point as reference', js:true do
  	visit '/'
    select 'Berlin', from: 'marathon'
    select 'Finish line', from: 'preferred_location'
    select '200', from: 'price'
    fill_in 'Arrival', with: '08/01/2014'
    fill_in 'Departure', with: '08/05/2014'
    click_button 'Search'
  	sleep 1
  	expect(page.evaluate_script("map.getCenter().lat()")).to be_within(0.05).of 52.51622
    expect(page.evaluate_script("map.getCenter().lng()")).to be_within(0.05).of 13.37573
  end
  
  it 'can select one budget range from dropdown menu', js:true do
    Hotel.create(race_id: 3, name: 'Hotel1', price: 100, lat: 52.50734, long: 13.36324, ref_lat: 52.51415, ref_long: 13.36368)
    Hotel.create(race_id: 3, name: 'Hotel2', price: 200, lat: 52.50734, long: 13.36324, ref_lat: 52.51415, ref_long: 13.36368)
    Hotel.create(race_id: 3, name: 'Hotel3', price: 300, lat: 52.50734, long: 13.36324, ref_lat: 52.51415, ref_long: 13.36368)
    enter_race_details
    sleep 1
    expect(page.evaluate_script("window.map.markers.length")).to eq 3
  end
  
  context 'number of nights' do
     before do
    load "#{Rails.root}/db/seeds.rb"
  end

    it 'user can fill in number of nights', js: true do
      Hotel.create!(race_id: 3, name: 'Hotel1', price: 150, lat: 52.50927, long: 13.37374, ref_lat: 52.51415, ref_long: 13.36368)
      visit '/races?utf8=%E2%9C%93&marathon=Berlin&preferred_location=Start+line&price=200&arrival=08%2F01%2F2014&departure=08%2F05%2F2014&commit=Search'
      sleep 1
      expect(page.evaluate_script("window.map.markers[2].infoWindow.content")).to have_content '4 nights'
    end
  end

end