FactoryGirl.define do
  factory :event do
    user
    sequence(:title) { |t| "#{t}Party" }
    address "123 Street St."
    city "Boston"
    state "MA"
    zip "12345"
    start_time { Date.tomorrow.strftime("%a %B %d, %l:%M %P") }
    duration '1 to 2 hours'
    guest_count 30
    budget 20
    description 'Description'
  end
end
