FactoryGirl.define do
  factory :bid do
    association :applicant, factory: :user
    event
    message "This is a bid on an event"
    amount 100
  end
end
