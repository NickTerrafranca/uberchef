require 'rails_helper'

feature 'user creates a new account', %Q(
  As a site visitor
  I want to be able to visit the site
  So that I can create a new account.
  ) do

  scenario 'User creates a new account by filling out all fields including profile_photo upload' do
    visit new_user_registration_path

    fill_in "First Name", with: "FirstName"
    fill_in 'Last Name', with: "LastName"
    fill_in 'Address', with: '1600 Pennsylvania Ave.'
    fill_in 'City', with: "CityName"
    fill_in 'State', with: "StateName"
    fill_in "Postal Code", with: '12345'
    page.attach_file('user[profile_photo]', Rails.root.join('spec/fixtures/images/profile_image.png'))
    fill_in "Short Description about you and/or your skills", with: 'This is an optioinal short description about the user'
    fill_in "Email Address", with: "example@example.com"
    fill_in 'Password, minimum of 8 characters', with: "password"
    fill_in "Password Confirmation", with: "password"

    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to_not have_content "can't be blank"
  end

  scenario 'User creates a new account by filling out only required fields' do
    visit new_user_registration_path

    fill_in "First Name", with: "FirstName"
    fill_in 'Last Name', with: "LastName"
    fill_in 'City', with: "CityName"
    fill_in 'State', with: "StateName"
    fill_in "Email Address", with: "example@example.com"
    fill_in 'Password, minimum of 8 characters', with: "password"
    fill_in "Password Confirmation", with: "password"

    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to_not have_content "can't be blank"
  end

  scenario 'User creates a new account without requirements.' do
    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Welcome! You have signed up successfully."
  end

  scenario 'User creates a new account, but account already exists.' do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path

    fill_in "First Name", with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'City', with: user.city
    fill_in 'State', with: user.state
    fill_in "Email Address", with: user.email
    fill_in 'Password, minimum of 8 characters', with: user.password
    fill_in "Password Confirmation", with: user.password

    click_on "Sign up"
    expect(page).to have_content 'Email has already been taken'
    expect(page).to_not have_content "Welcome! You have signed up successfully."
  end
end
