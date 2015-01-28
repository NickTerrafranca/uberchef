require 'rails_helper'

RSpec.describe Event, :type => :model do
  it { should belong_to :user }
  it { should have_many :bids }
  it { should have_many :applicants }

  let(:event) { FactoryGirl.create(:event) }

  it { should have_valid(:user).when(event.user) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:title).when(event.title, 'Pants Party') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:address).when(event.address, '12345 Happy St.') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:state).when(event.state, 'DC', 'Massachusetts') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:start_time).when(event.start_time, Date.today) }
  it { should_not have_valid(:start_time).when(nil, Date.today.advance(days: -1)) }

  it { should have_valid(:duration).when(event.duration, '6 + hours') }
  it { should_not have_valid(:duration).when(nil, '') }

  it { should have_valid(:guest_count).when(event.guest_count, '12', 30) }
  it { should_not have_valid(:guest_count).when(nil, 'apple', 0) }

  it { should have_valid(:budget).when(event.budget, 150, '267')}
  it { should_not have_valid(:budget).when(nil, 0, 'one 2 three')}

  it { should have_valid(:description).when(event.description,'This is an awesome description!') }
  it { should_not have_valid(:description).when(nil) }

  describe 'full_event_address' do
    it 'compiles an address' do
      expect(event.full_address).to eq "123 Street St. Boston, MA 12345"
      expect(event.full_address).not_to be('')
      expect(event.full_address).not_to be(nil)
    end
  end

  describe 'total_bid' do
    it "Totals the amount of the bid" do
      total = (event.guest_count * event.budget)
      expect(event.bid_total).to eq(total)
      expect(event.bid_total).not_to be('')
      expect(event.bid_total).not_to be(nil)
    end
  end

  describe 'search', focus: true do
    it 'searches for events buy state abbreviation' do
      event_1 = FactoryGirl.create(:event, state: "MA")
      event_2 = FactoryGirl.create(:event, state: "CT")
      expect(Event.search("MA")).to eq([event_1])
      expect(Event.search("MA")).not_to eq([event_2])
    end

    it 'searches for events buy full state name' do
      event_1 = FactoryGirl.create(:event, state: "California")
      event_2 = FactoryGirl.create(:event, state: "Massachusetts")
      expect(Event.search("California")).to eq([event_1])
      expect(Event.search("California")).not_to eq([event_2])
    end
  end
end
# it 'searches for events buy state abbreviation, full state name, title, city or description' do
