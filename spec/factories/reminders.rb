FactoryBot.define do
  factory :reminder do
    user { nil }
    message { "MyText" }
    remind_at { "2023-11-30 16:43:15" }
  end
end
