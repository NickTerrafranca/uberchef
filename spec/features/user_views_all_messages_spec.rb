require 'rails_helper'

feature 'User views a list of all the messages threads',
  %Q(As a User, I want to view a list of all the messages threads that I am ap part of
  so that I can find the message thread I am looking for.
  ) do

  scenario 'user visits all the messages page', focuss: true do
    sender = FactoryGirl.create(:user)
    receiver = FactoryGirl.create(:user)

    login_as sender
    visit message_path(receiver)
    fill_in "Message", with: 'This is a message from sender'
    click_on 'Send message'

    login_as receiver
    visit user_messages_path(receiver)

    expect(page).to have_content sender.full_name
    expect(page).to_not have_content receiver.full_name
  end
end
