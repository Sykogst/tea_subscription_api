FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temperature { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    brew_time { "#{Faker::Number.between(from: 1, to: 10)}:#{Faker::Number.between(from: 10, to: 59)}" }
  end
end
