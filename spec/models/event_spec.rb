require 'rails_helper'

RSpec.describe Event, :type => :model do
  it { should belong_to :user }
  it { should have_many :bids }
  it { should have_many :applicants }

  event = FactoryGirl.create(:event)
  it { should have_valid(:user).when(event.user) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:title).when(event.title, 'Pants Party') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:address).when(event.address, '12345 Happy St.') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:state).when(event.state, 'DC', 'Massachusetts') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip).when(nil, event.zip, '02141', '02141-0005') }
  it { should_not have_valid(:zip).when('123', '021410', 'one 2 three 4') }

  it { should have_valid(:start_time).when(event.start_time, Date.today) }
  it { should_not have_valid(:start_time).when(nil, '', Date.yesterday) }

  it { should have_valid(:duration).when(event.duration, '6 + hours') }
  it { should_not have_valid(:duration).when(nil, '') }

  it { should have_valid(:guest_count).when(event.guest_count, '12', 30) }
  it { should_not have_valid(:guest_count).when(nil, 'apple', 0) }

  it { should have_valid(:budget).when(event.budget, 150, '267')}
  it { should_not have_valid(:budget).when(nil, 0, 'one 2 three')}

  it { should have_valid(:description).when(event.description,'This is an awesome description!') }
  it { should_not have_valid(:description).when(nil) }
end
