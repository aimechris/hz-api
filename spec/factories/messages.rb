FactoryBot.define do
  factory :message do
    mssg_txt { Faker::Lorem.paragraph }
    listing_id nil
    created_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
