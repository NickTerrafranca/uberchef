require 'rails_helper'

feature 'User sends another user a message',
  %Q(As a User,
  I want to send a message to a chef that bid on my event
  so that I can work out th details of an event.
  ) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'User sends sends a message', focus: true do
    message = FactoryGirl.build(:message)
    login_as user
    visit message_path(user)
    save_and_open_page
    fill_in "Message", with: message.body

    expect(page).to have_content message.body
  end

end
