
FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    city "City"
    state "State"
    sequence(:email) { |n| "example#{n}@example.com" }
    password "password"
    password_confirmation "password"

    trait :with_photo do
      profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'profile_image.png')) }
    end
  end
end
