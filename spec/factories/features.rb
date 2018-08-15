FactoryBot.define do
  factory :feature do
    feature_name { Faker::Lorem.word }
    listing_id nil
  end
end
