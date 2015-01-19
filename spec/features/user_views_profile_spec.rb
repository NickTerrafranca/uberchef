require 'rails_helper'

feature 'User views profile page', %Q(
  As a user, I want to view a profile page
  so that I can have an overview
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
    login_as user
    visit new_event_path
    event = FactoryGirl.build(:event)

    fill_in 'Event title', with: event.title
    fill_in 'Address', with: event.address
    fill_in 'City', with: event.city
    fill_in 'State', with: event.state
    fill_in 'Start time', with: event.start_time
    find("option[value='1 to 2 hours']").select_option
    fill_in 'Expected number of guests', with: event.guest_count
    fill_in 'Budget price per person', with: event.budget
    fill_in 'Event details', with: event.description

    click_on 'Submit'

    visit user_path(user)
    expect(page).to have_content event.title
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
