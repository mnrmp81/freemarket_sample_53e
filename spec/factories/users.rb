FactoryBot.define do
  factory :user, class: User do
    # password = Faker::Internet.password(8)
    nickname              {"yamada"}
    password              {"11111111"}
    password_confirmation {"11111111"}
    email                 {Faker::Internet.email}
    # email {"ttt@kkk.com"}
  end
end