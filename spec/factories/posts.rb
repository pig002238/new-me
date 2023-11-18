FactoryBot.define do
  factory :post do
    content {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user
    association :goal
  end
end
