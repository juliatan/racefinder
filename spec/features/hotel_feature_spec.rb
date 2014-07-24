require 'rails_helper'

describe 'Hotels' do

  it 'should display a hotel name' do
    visit '/hotels.json?nights=1'
    expect(page).to have_content 'Hotel Adlon Kempinski'
  end

end