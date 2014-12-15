require 'rails_helper'

RSpec.describe User, :type => :model do
  user = FactoryGirl.create(:user)

  it { should have_many :bids }
  it { should have_many :sent_messages }
  it { should have_many :received_messages }

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

  describe 'full_name' do
    it "Creates a full name from first_name and last_name" do
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      expect(user.full_name).not_to be_nil
      expect(user.full_name).not_to be('')
    end
  end

  describe 'address_helper' do
    it "Creates an address string from the address fields" do
      user = FactoryGirl.create(:user)
      expect(user.address_helper).to eq("#{user.address}, #{user.city}, #{user.state} #{user.zip}")
      expect(user.address_helper).not_to be_nil
      expect(user.address_helper).not_to be('')
    end
  end

  describe 'location' do
    it "Creates an location string from the user's city and state" do
      user = FactoryGirl.create(:user)
      expect(user.location).to eq("#{user.city}, #{user.state}")
      expect(user.location).not_to be_nil
      expect(user.location).not_to be('')
    end
  end

  describe 'sent_messages' do
    it "Finds the messages that the user sent" do
      user = FactoryGirl.create(:user)
      message = FactoryGirl.create(:message, sender: user)
      expect(user.sent_messages).to eq([message])
      expect(user.received_messages).not_to be_nil
    end
  end

  describe 'received_messages' do
    it "Finds the messages that the user received" do
      user = FactoryGirl.create(:user)
      message = FactoryGirl.create(:message, receiver: user)
      expect(user.received_messages).to eq([message])
      expect(user.received_messages).not_to be_nil
    end
  end
end
