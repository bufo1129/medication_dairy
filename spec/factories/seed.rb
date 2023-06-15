FactoryBot.define do
  factory :seed do
    name { Faker::Lorem.characters(number:5) }
  end
end