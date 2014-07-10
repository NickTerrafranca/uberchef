require 'rails_helper'

feature 'user_views_events', %Q(
  As a chef
  I want I to view a list of events
  so that I can apply for them.
  ) do
  # Acceptance Criteria:
    # The chef must sign in.
    # The chef is provided with a list of events that are sorted by location.
    # The chef can click on the event to view its details.
    # The details should provide the event details and user email.

  let(:user) { FactoryGirl.create(:user) }
  # let(:event) { FactoryGirl.create(:event) }

  scenario 'user views all events' do
    login_as user
    event = FactoryGirl.create(:event)

    visit  events_path

    save_and_open_page
    expect(page).to have_link event.title, event_path(event)
    expect(page).to have_content event.city
    expect(page).to have_content event.start_time.strftime("%B %d at %I:%M %p")
  end

  scenario 'user views a single event' do
    login_as user
    event = FactoryGirl.create(:event)
    # visit event_path #vs.
    visit event_path(event)

    # click_link("#{event.title}")
    expect(page).to have_content event.title
    expect(page).to have_content event.description
    expect(page).to have_content event.user.email
  end
end
