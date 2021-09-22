FactoryBot.define do
  factory :goal do
    goal_title { Faker::Lorem.characters(number:10) }
    goal_description { Faker::Lorem.characters(number:30) }
    customer
  end
end