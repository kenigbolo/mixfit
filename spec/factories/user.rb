FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    weight { Faker::Number.between(0.0, 150.0).round(2) }
    height { Faker::Number.between(1.0, 2.5).round(2) }
  end
end
