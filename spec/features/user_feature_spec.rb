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

	it 'can sign in' do
		User.create(name:'Bob', email:'b@b.com', password: '12345678', password_confirmation: '12345678')
		visit '/users/sign_in'
			within '.new_user' do
			fill_in 'Email', with: 'b@b.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
		end
		expect(page).to have_content 'Where will you conquer, Bob?'
	end
end