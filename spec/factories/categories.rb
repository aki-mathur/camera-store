FactoryBot.define do
    factory :category do
      name { Faker::Lorem.word }
      category_type { ["Mirrorless", "Full frame", "Point and shoot"] }
      model { Faker::Number.number(digits: 4) }
    end
end