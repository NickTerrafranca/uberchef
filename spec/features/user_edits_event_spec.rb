require 'rails_helper'

feature 'user edits an events details', %Q(
  As a registered user
  I want to be able to edit my events
  So that I can keep them up to date.
  ) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user changes the date and location of the event' do
    new_date = Date.tomorrow.next.strftime("%a %B %d, %l:%M %P")
    new_address = '69 Montobello Rd. Apt. 3'
    new_city = 'Jamaica Plain'

    login_as user
    event = FactoryGirl.create(:event)
    visit edit_event_path(event)

    fill_in 'Event date', with: new_date
    fill_in 'Address', with: new_address
    fill_in 'City', with: new_city
    click_on 'Submit'

    expect(page).to have_content new_date
    expect(page).to have_content new_address
    expect(page).to have_content new_city
    expect(page).to_not have_content "Start time can't be blank"
  end

  scenario 'user changes nothing on the form before submitting' do
    login_as user
    event = FactoryGirl.create(:event)
    visit edit_event_path(event)

    click_on 'Submit'
    expect(page).to have_content "Start time can't be blank"
  end
end
