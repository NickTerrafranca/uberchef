require 'rails_helper'

feature 'user signs in',
%Q(As a site visitor
I want to be able to visit the site
So that I can sign in
) do

  scenario 'user signs into account' do
    login_as(FactoryGirl.create(:user), scope: :user)
    visit root_path

    expect(page).to have_content "Sign out"
  end

  scenario "user enters incorrect password" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: "notpassword"

    within('#new_user') do
      click_on 'Sign in'
    end

    expect(page).to have_content "Invalid email or password."
  end

  scenario 'user signs out of account' do
    login_as(FactoryGirl.create(:user), scope: :user)
    visit root_path

    click_on 'Sign out'

    expect(page).to have_content "Signed out successfully."
  end
end
