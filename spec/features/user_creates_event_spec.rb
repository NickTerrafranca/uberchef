require 'rails_helper'

feature 'user creates a new event', %Q(
  As a user
  I want to create an event
  so that I can hire a chef.
  ) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user provides required information' do
    login_as user
    visit new_event_path

    event = FactoryGirl.build(:event)

    fill_in 'Event title', with: event.title
    fill_in 'Address', with: event.address
    fill_in 'City', with: event.city
    fill_in 'State', with: event.state
    fill_in 'Zip', with: event.zip
    fill_in 'Start time', with: event.start_time
    find("option[value='1 to 2 hours']").select_option
    fill_in 'Expected number of guests', with: event.guest_count
    fill_in 'Budget price per person', with: event.budget
    fill_in 'Event details', with: event.description

    click_on 'Submit'

    expect(page).to have_content 'Successfully created...'
    expect(page).to_not have_content "There was a problem saving your submission..."
    expect(page).to have_content event.title
    expect(page).to have_content event.address
    expect(page).to have_content event.city
    expect(page).to have_content event.state
    expect(page).to have_content event.start_time.strftime("%a %B %d, %l:%M %P")
    expect(page).to have_content event.duration
    expect(page).to have_content event.guest_count
    expect(page).to have_content event.budget
    expect(page).to have_content event.bid_total
    expect(page).to have_content event.description
  end

  scenario 'user does not provide required information' do
    login_as user
    visit new_event_path

    click_on 'Submit'
    expect(page).to_not have_content "Event successfully added"
    expect(page).to have_content "can't be blank"
    expect(page).to have_content "There was a problem saving your submission..."

  end
end
