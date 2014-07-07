require 'rails_helper'

feature 'user creates a new account', %Q{
  As a site visitor
  I want to be able to visit the site
  So that I can create a new account
  } do
  # Acceptance Criteria:
    # I can navigate to a sign up page.
    # I can sign up for a new account.

    # User must provide
    # Name
    # Photo* (if user is providing chef services)
    # Location (city, state)
    # Email
    # Background*
    # Description*
  scenario 'user creates a new account' do
    visit new_user_registration_path

    fill_in 'First Name', with: "FirstName"
    fill_in 'Last Name', with: "LastName"
    fill_in 'Email', with: "example@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password Confirmation', with: "password"

    click_on 'Sign Up'

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'without requirements' do

    visit new_user_registration_path
    click_on 'Sign Up'

    expect(page).to have_content "can't be blank"
  end

  scenario 'account already exists' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email

    click_on "Sign Up"
    expect(page).to have_content 'Email has already been taken'
  end
end
