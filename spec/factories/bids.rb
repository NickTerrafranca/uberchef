FactoryGirl.define do
  factory :bid do
    # below was an attempt to provide the necessary associated event_id and user_id
    # association :event, factory: :event, strategy: :create
    event
    message "This is a bid on an event"
    amount 100
  end
end
