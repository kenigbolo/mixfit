FactoryBot.define do
  factory :food_intake do
    user
    vitamin_c { Faker::Number.between(4, 10) }
    vitamin_d3 { Faker::Number.between(4, 10) }
    iron { Faker::Number.between(4, 10) }
  end
end
