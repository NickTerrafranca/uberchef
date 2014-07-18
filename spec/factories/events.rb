FactoryGirl.define do
  factory :event do
    user
    sequence(:title) { |t| "#{t}Party" }
    address "123 Street St."
    city "Boston"
    state "MA"
    zip "12345"
    start_time DateTime.parse('2014-07-19T19:30:00+04:00')
    duration '1 to 2'
    guest_count 30
    budget 20
    description 'Description'
  end
end
