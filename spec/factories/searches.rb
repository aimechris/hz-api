FactoryBot.define do
  factory :search do
    url_search { Faker::Lorem.word }
    user_id nil
    created_by { Faker::Lorem.word }
  end
end
