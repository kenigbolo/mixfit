FactoryBot.define do
  factory :activity_level do
    user
    vitamin_c { Faker::Number.between(1, 3) }
    vitamin_d3 { Faker::Number.between(1, 3) }
    iron { Faker::Number.between(1, 3) }
  end
end