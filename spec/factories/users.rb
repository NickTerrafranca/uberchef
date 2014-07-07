
FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    city "City"
    state "State"
    sequence(:email) { |n| "example#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
