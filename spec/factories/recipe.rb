FactoryBot.define do
  factory :recipe do
    user
    food_intake
    activity_level
    vitamin_c { Faker::Number.between(1, 10) }
    vitamin_d3 { Faker::Number.between(1, 10) }
    iron { Faker::Number.between(1, 10) }
  end
end
