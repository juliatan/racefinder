def enter_race_details
  visit '/'
  select 'Berlin', from: 'marathon'
  select 'Start line', from: 'preferred_location'
  select '200', from: 'price'
  fill_in 'arrival', with: '08/01/2014'
  fill_in 'departure', with: '08/05/2014'
  click_button 'search'
end