require 'rails_helper'

RSpec.describe Message, :type => :model do
  it { should belong_to :sender }

  it { should belong_to :receiver }

  user = FactoryGirl.create(:user)
  it { should have_valid(:body).when('This is a message!') }
  it { should have_valid(:sender).when(user) }
  it { should have_valid(:receiver).when(user) }
end
