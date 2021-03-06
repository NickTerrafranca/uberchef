require 'rails_helper'

  feature 'User bids on an event',
  %Q(As a chef, I want to bid on an event
    so that I can be considered for the job
    ) do

  let(:user) { FactoryGirl.create(:user) }
  let(:event) { FactoryGirl.create(:event) }

  before :each do
    login_as user
    event
  end

  scenario 'User fills in all fields.' do
    bid = FactoryGirl.build(:bid)

    visit event_path(event)
    click_link 'Make an offer on this event'

    fill_in 'Message', with: bid.message
    fill_in 'Bid amount', with: bid.amount

    click_on 'Submit'

    expect(page).to have_content 'Successfully created...'
    expect(page).to_not have_content "can't be blank"
    expect(page).to have_content event.title
    expect(page).to have_content event.description
    expect(page).to have_content bid.message
    expect(page).to have_content bid.amount
  end

  scenario 'User only fills in message.' do
    bid = FactoryGirl.build(:bid)

    visit event_path(event)
    click_on 'Make an offer on this event'

    fill_in 'Message', with: bid.message

    click_on 'Submit'

    expect(page).to have_content "Amount can't be blank"
    expect(page).to have_content 'There was a problem saving your submission...'
    expect(page).to_not have_content 'Successfully created...'
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
end
