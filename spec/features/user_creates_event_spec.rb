require 'rails_helper'

feature 'user creates a new event', %Q(
  As a user
  I want to create an event
  so that I can hire a chef.
  ) do
  # Acceptance Criteria:
  #   User provides a title for the event
  #   User provides an address for the event
  #   User proves a time for the event
  #   User provides a number of guests that the event is for.
  #   User provides the dollar amount per person that they want to pay.
  #   The provides a description of the event.

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
    find("option[value='1 to 2 hours']").select_option #is this appropriate?
    fill_in 'Expected number of guests', with: event.guest_count
    fill_in 'Budget price per person', with: event.budget
    fill_in 'Event details', with: event.description

    click_on 'Submit'
    expect(page).to have_content 'Successfully created...'
    expect(page).to have_content event.title
  end

  scenario 'user does not provide required information' do
    login_as user
    visit new_event_path

    click_on 'Submit'
    expect(page).to_not have_content "Event successfully added"
    expect(page).to have_content "can't be blank"
  end
end
