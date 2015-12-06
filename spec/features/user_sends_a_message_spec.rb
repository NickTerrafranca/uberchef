require 'rails_helper'

feature 'User sends another user a message',
  %Q(As a User,
  I want to send a message to a chef that bid on my event
  so that I can work out th details of an event.
  ) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'User sends a message' do
    message = FactoryGirl.build(:message)
    login_as user
    visit message_path(user)
    fill_in "Message", with: message.body

    click_on 'Send message'
    expect(page).to have_content message.body
  end

  scenario 'User sends an empty message' do
    login_as user
    visit message_path(user)

    click_on 'Send message'

    expect(page).to have_content 'There was a problem sending your message...'
    expect(page).to_not have_content 'Message sent...'
  end
end
