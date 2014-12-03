require 'rails_helper'

feature 'User views profile page', %Q(
  As a user, I want to view a profile page
  so that I can have an overview
  of my information and activity.
  ) do

  scenario 'User views their profile with a custom photo uploaded' do
    user = FactoryGirl.create(:user, :with_photo)
    login_as user
    visit user_path(user)

    expect(page).to have_xpath("//img[@src = \"/uploads/user/profile_photo/#{user.id}/profile_image.png\"]")
    expect(page).to have_content user.full_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address_helper
  end

  scenario 'User views their profile with a NO photo uploaded' do
    user = FactoryGirl.create(:user, :default_photo)
    login_as user
    visit user_path(user)

    expect(page).to have_xpath("//img[@src = \"/uploads/user/profile_photo/#{user.id}/defaultUserIcon.png\"]")
    expect(page).to have_content user.full_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address_helper
  end
end
