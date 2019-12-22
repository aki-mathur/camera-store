FactoryBot.define do
    factory :product do
      name { Faker::Lorem.word }
      category
      description { Faker::Lorem.paragraph }
      price { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
      make { Faker::Number.number(digits: 4) }
    end
  end