require 'rails_helper'

feature 'user creates a new account', %Q(
  As a site visitor
  I want to be able to visit the site
  So that I can create a new account
  ) do

  scenario 'user creates a new account' do
    visit new_user_registration_path

    fill_in 'First name', with: "FirstName"
    fill_in 'Last name', with: "LastName"
    fill_in 'City', with: "CityName"
    fill_in 'State', with: "StateName"
    fill_in 'Description', with: 'This is an optioinal short description about the user.'
    # The line below is not working.
    # page.attach_file('user[profile_photo]', '/fixtures/images/profile_image.png')
    fill_in 'Email', with: "example@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'without requirements' do
    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content "can't be blank"
  end

  scenario 'account already exists' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email

    click_on "Sign up"
    expect(page).to have_content 'Email has already been taken'
  end
end
