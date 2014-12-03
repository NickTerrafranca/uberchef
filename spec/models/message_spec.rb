require 'rails_helper'

RSpec.describe Message, :type => :model do
  it { should belong_to :sender }
  it { should belong_to :receiver }
  it { should have_valid(:body).when('This is a message!') }

  user1 = FactoryGirl.create(:user)
  user2 = FactoryGirl.create(:user)

  it { should have_valid(:sender).when(user1) }
  it { should have_valid(:receiver).when(user2) }

end
