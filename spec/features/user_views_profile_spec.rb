require 'rails_helper'

feature 'User views profile page', %Q(
  As a user, I want to view a profile page
  so that I can get an overview
  of my information and activity.
  ) do

  scenario 'User views their profile with a custom photo uploaded' do
    user = FactoryGirl.create(:user, :with_custom_photo)

    login_as user
    visit user_path(user)

    expect(page).to have_xpath("//img[@src = \"/uploads/user/profile_photo/#{user.id}/profile_image.png\"]")
    expect(page).to have_content user.full_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address_helper
  end

  scenario 'User views their profile with a NO photo uploaded' do
    user = FactoryGirl.create(:user, :with_default_photo)

    login_as user
    visit user_path(user)

    expect(page).to have_xpath("//img[@src = \"/uploads/user/profile_photo/#{user.id}/defaultUserIcon.png\"]")
    expect(page).to have_content user.full_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address_helper
  end

  scenario 'on the users profile page, the user views the events they have posted' do
    user = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event, user: user)

    login_as user
    visit new_event_path

    visit user_path(user)
    expect(page).to have_content event.title
    expect(page).to have_content event.start_time.strftime("%a %B %d, %l:%M %P")
    expect(page).to have_content event.description
  end

  scenario 'on the users profile page, the user views the bids others have placed on their events' do
    host = FactoryGirl.create(:user)
    chef = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event, user: host)
    bid =  FactoryGirl.create(:bid, applicant: chef, event: event)

    login_as host
    visit user_path(host)

    expect(page).to have_content "Your event has bids!"
    expect(page).to have_content bid.message
    expect(page).to have_content bid.amount
    expect(page).to have_content chef.full_name
    expect(page).to have_link "Message #{chef.full_name}"
  end

  scenario "on the users profile page, the user views the bids they have placed on the events posted by others" do
    host = FactoryGirl.create(:user)
    chef = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event, user: host)
    bid =  FactoryGirl.create(:bid, applicant: chef, event: event)

    login_as chef
    visit user_path(chef)

    expect(page).to have_content 'My Bids'
    expect(page).to have_content event.title
    expect(page).to have_content 'Bid Details'
    expect(page).to have_content "My Message: #{bid.message}"
    expect(page).to have_content "My Bid Amount: $#{bid.amount}"
  end
end
