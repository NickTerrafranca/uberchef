require 'rails_helper'

feature 'user_views_events', %Q(
  As a chef
  I want I to view a list of events
  so that I can apply for them.
  ) do

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    login_as user
  end

  scenario 'user views all events' do
    event = FactoryGirl.create(:event)

    visit  events_path

    expect(page).to have_link(event.title, href: event_path(event))
    expect(page).to have_content event.city, event.title, event.state
    expect(page).to have_content event.start_time.strftime("%a %B %d, %l:%M %P")
  end

  scenario 'user views a single event' do
    event = FactoryGirl.create(:event)

    visit event_path(event)

    expect(page).to have_content event.title
    expect(page).to have_content event.address
    expect(page).to have_content event.city
    expect(page).to have_content event.state
    expect(page).to have_content event.start_time.strftime("%a %B %d, %l:%M %P")
    expect(page).to have_content event.duration
    expect(page).to have_content event.guest_count
    expect(page).to have_content event.budget
    expect(page).to have_content event.description
  end
end
