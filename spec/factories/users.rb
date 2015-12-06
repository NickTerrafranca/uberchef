
FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |i| "#{i}Albert"}
    sequence(:last_name) { |i| "#{i}Einstein"}

    city 'City'
    state 'State'
    zip '25985'
    sequence(:email) { |n| "example#{n}email@example.com" }
    password 'password12345'
    password_confirmation 'password12345'

    trait :with_custom_photo do
      profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'profile_image.png')) }
    end

    trait :with_default_photo do
      profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'defaultUserIcon.png')) }
    end

  end
end
