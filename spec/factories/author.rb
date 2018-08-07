FactoryBot.define do
  factory :author do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email 'foo@bar.com'
    password 'foobar'
  end
end
