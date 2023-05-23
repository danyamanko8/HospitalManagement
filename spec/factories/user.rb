FactoryBot.define do
  factory :user do
    phone_number { Faker::Number.number(digits: 10) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    gender { User.genders.keys.sample }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    house_number { Faker::Address.building_number }
  end
end
