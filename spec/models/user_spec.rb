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
end
