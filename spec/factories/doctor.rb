FactoryBot.define do
  factory :doctor do
    phone_number { Faker::Number.number(digits: 10) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    bio { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
