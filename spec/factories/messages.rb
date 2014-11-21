# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    association :sender, factory: :user
    association :receiver, factory: :user
    body "This is a message"
  end
end
