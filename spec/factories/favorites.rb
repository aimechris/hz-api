FactoryBot.define do
  factory :favorite do
    user_id nil
    listing_id nil
    created_by { Faker::Lorem.word }
  end
end
