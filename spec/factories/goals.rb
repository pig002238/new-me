FactoryBot.define do
  factory :goal do
    purpose               {Faker::Lorem.paragraph}
    goal                  {Faker::Lorem.paragraph}
    action                {Faker::Lorem.paragraph}
    deadline              {9999/99/99}
    association :user
  end
end
