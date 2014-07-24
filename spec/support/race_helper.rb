def enter_race_details
  visit '/'
  select 'Start line', from: 'preferred_location'
  fill_in 'Number of nights', with: '1'
  click_button 'Search'
end