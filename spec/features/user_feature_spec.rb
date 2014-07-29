require 'rails_helper'

describe 'user registration/login' do

	context 'logged out' do
		it 'can sign up' do
			visit '/users/sign_up'
			within '.new_user' do
				fill_in 'Name', with: 'Maggie'
				fill_in 'Email', with: 'test@example.com'
				fill_in 'Password', with: '12345678'
				fill_in 'Password confirmation', with: '12345678'
				click_button 'Sign up'
			end
			expect(page).to have_content 'Where will you conquer, Maggie?'
		end

		it 'can sign in from the homepage' do
			User.create(name:'Bob', email:'b@b.com', password: '12345678', password_confirmation: '12345678')
			visit '/'
				click_link 'Sign in'
				within '.new_user' do
				fill_in 'Email', with: 'b@b.com'
				fill_in 'Password', with: '12345678'
				click_button 'Sign in'
			end
			expect(page).to have_content 'Where will you conquer, Bob?'
		end

		it 'can sign up with phone number' do
			visit '/users/sign_up'
			expect(page).to have_field 'Phone number'
			within '.new_user' do
				fill_in 'Name', with: 'Bob'
				fill_in 'Email', with: 'test@example.com'
				fill_in 'Password', with: '12345678'
				fill_in 'Password confirmation', with: '12345678'
				fill_in 'Phone number', with: '+447840470040'
				click_button 'Sign up'
			end
			expect(User.first.phone_number).to eq '+447840470040'
			expect(page).to have_content 'Where will you conquer, Bob?'
		end

		it 'shows sign in and sign up when the user is not logged in' do
			visit '/'
			expect(page).to have_content 'Sign in'
			expect(page).to have_content 'Sign up'
			expect(page).not_to have_content 'Sign out'
		end
	end

	context 'logged in' do

		it 'can sign out' do
			bob = User.create(name:'Bob', email:'b@b.com', password: '12345678', password_confirmation: '12345678')
			login_as bob 
			visit '/'
			click_link 'Sign out'
			expect(current_path).to eq '/'
			expect(page).to have_content 'Where will you conquer?'
		end

		it 'only shows sign out when the user is logged in' do
			bob = User.create(name:'Bob', email:'b@b.com', password: '12345678', password_confirmation: '12345678')
			login_as bob
			visit '/'
			expect(page).not_to have_content 'Sign in'
			expect(page).to have_content 'Sign out'
		end
	end
end