require 'rails_helper'

feature 'user edits their profile information', %Q(
  As a registered user
  I want to be able to edit my account profile
  So that I can keep my info up to date.) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'User updates profile and properly fills in required information' do
    login_as user
    visit edit_user_registration_path

    fill_in 'Address', with: '11235 New Address'
    fill_in 'City', with: 'New City'
    fill_in 'State', with: 'New State'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('You updated your account successfully.')
    expect(page).to_not have_content("can't be blank")
  end

  scenario 'User updates profile does not to enter confirmation password' do
    login_as user
    visit edit_user_registration_path

    fill_in 'Address', with: '11235 New Address'
    fill_in 'City', with: 'New City'
    fill_in 'State', with: 'New State'
    click_button 'Update'

    expect(page).to have_content("Current password can't be blank")
    expect(page).to_not have_content('You updated your account successfully.')
  end

  scenario 'User changes password with required information' do
    login_as user
    visit edit_user_registration_path

    fill_in 'Current password', with: user.password
    fill_in 'Password', with: 'newpassword1234'
    fill_in 'Password confirmation', with: 'newpassword1234'
    click_button 'Update'

    expect(page).to have_content('You updated your account successfully.')
    expect(page).to_not have_content("Password confirmation doesn't match Password")
  end

  scenario 'User changes password without entering confirmation password' do
    login_as user
    visit edit_user_registration_path

    fill_in 'Current password', with: user.password
    fill_in 'Password', with: 'newpassword1234'
    click_button 'Update'

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content('You updated your account successfully.')
  end

  scenario 'User deletes the account' do
    the_user = FactoryGirl.create(:user)
    login_as the_user
    visit edit_user_registration_path

    click_link 'Cancel my account'
    expect(page).to have_content('Bye! Your account was successfully cancelled. We hope to see you again soon.')
    expect(page).to have_content('Sign in')
    expect(page).to_not have_content('Cancel my account')
  end
end
