FactoryBot.define do
  factory :user do
    nickname              {"tanaka"}
    password              {"000000"}
    password_confirmation {"000000"}
    sequence(:email) {Faker::Internet.email}
  end
end