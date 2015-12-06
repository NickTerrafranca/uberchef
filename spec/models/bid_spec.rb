require 'rails_helper'

RSpec.describe Bid, :type => :model do
  bid = FactoryGirl.create(:bid)
  it  { should belong_to :applicant }
  it { should belong_to :event }

  it { should have_valid(:user_id).when(bid.applicant.id) }
  it { should_not have_valid(:user_id).when(nil) }

  it { should have_valid(:event_id).when(bid.event.id) }
  it { should_not have_valid(:event_id).when(nil) }

  it { should have_valid(:message).when(bid.message, 'This is the best offer you are going to get!') }
  it { should_not have_valid(:message).when(nil) }

  it { should have_valid(:amount).when(bid.amount, 1, '200') }
  it { should_not have_valid(:amount).when(nil, 0, '-1') }
end
