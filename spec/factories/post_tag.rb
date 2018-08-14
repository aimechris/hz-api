FactoryBot.define do
  factory :post_with_tags do
    transient do
      tags_count 5
    end
  end
end
