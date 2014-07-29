require 'rails_helper'

describe 'user registration/login' do
	it 'can sign up' do
		visit '/users/sign_up'
		within '.new_user' do
			fill_in 'Name', with: 'Maggie'
			fill_in 'Email', with: 'test@example.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			# fill_in 'Phone number', with: '+447404992798'
			click_button 'Sign up'
		end
		expect(page).to have_content 'Where will you conquer, Maggie?'
	end
end