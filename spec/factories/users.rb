FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name}
    email                  { Faker::Internet.free_email }
    password               { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    favorite_car_id        {2}
  end
end