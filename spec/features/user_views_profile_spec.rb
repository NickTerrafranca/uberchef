require 'rails_helper'

feature 'User views profile page', %Q(
  As a user, I want to view a profile page
  so that I can have an overview
  of my information and activity.
  ) do

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    login_as user
  end

  scenario 'User views their own profile' do
    visit user_path(user)
    # The line below is not working.
    expect(page).to have_xpath("spec/fixtures/images/profile_image.png")

    expect(page).to have_content user.full_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address_helper
  end

  # scenario "User views someone else's profile page" do

  # end


end
