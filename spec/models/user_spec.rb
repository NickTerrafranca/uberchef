require 'rails_helper'

RSpec.describe User, :type => :model do
  user = FactoryGirl.create(:user)

  it { should have_many :bids }
  # it { should have_many :messages }
  it { should have_many :events_bid_on }
  it { should have_many :events_hosted }

  it { should have_valid(:first_name).when(user.first_name, 'Albert') }
  it { should_not have_valid(:first_name).when(nil) }

  it { should have_valid(:last_name).when(user.last_name, 'Einstein') }
  it { should_not have_valid(:last_name).when(nil) }

  it { should have_valid(:email).when(user.email, 'email_example@example.com') }
  it { should_not have_valid(:email).when('email@example', 'email_example.com', nil) }

  it { should have_valid(:city).when(user.city, 'Boston') }
  it { should_not have_valid(:city).when(nil) }

  it { should have_valid(:state).when(user.state, 'MA') }
  it { should_not have_valid(:state).when(nil) }

  # it { should have_valid(:zip).when(nil, user.zip, '02141', '02141-0005') }
  # it { should_not have_valid(:zip).when('123', '021410', 'one 2 three 4') }

  describe 'full_name' do
    it "Creates a full name from first_name and last_name" do
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end

  describe 'address_helper' do
    it "Creates an address string from the address fields" do
      user = FactoryGirl.create(:user)
      expect(user.address_helper).to eq("#{user.address}, #{user.city}, #{user.state} #{user.zip}")
    end
  end

  describe 'location' do
    it "Creates an location string from the user's city and state" do
      user = FactoryGirl.create(:user)
      expect(user.location).to eq("#{user.city}, #{user.state}")
    end
  end
end
