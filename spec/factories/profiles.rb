FactoryBot.define do
  factory :profile do
    family_name      {"名前"}
    first_name       {"名前"}
    family_name_kana {"カナ"}
    first_name_kana  {"カナ"}
    user
  end
end