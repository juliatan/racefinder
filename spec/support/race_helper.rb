def enter_race_details
  visit '/'
  select 'Berlin', from: 'marathon'
  select 'Start line', from: 'preferred_location'
  fill_in 'nights', with: '1'
  click_button 'Search'
end