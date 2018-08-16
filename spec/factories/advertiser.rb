FactoryBot.define do
  factory :advertiser do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    phone '078855'
    address 'walla walla'
    email 'foo@bar.com'
    password 'foobar'
  end
end
