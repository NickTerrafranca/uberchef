require 'rails_helper'

feature 'user edits their profile information', %Q(
  As a registered user
  I want to be able to edit my account profile
  So that I can keep my info up to date.) do

  scenario 'User properly fills in required information', focus: true do
    user = FactoryGirl.create(:user)
    login_as user
    visit edit_user_registration_path
    # save_and_open_page

    fill_in 'Address', with: '11235 New Address'
    fill_in 'City', with: 'New City'
    fill_in 'State', with: 'New State'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    save_and_open_page

    expect(page).to have_content('You updated your account successfully.')
    expect(page).to_not have_content("can't be blank")
  end
end

