FactoryBot.define do
  factory :user do
    nickname           { Faker::Name.initials(number: 2) }
    email              { Faker::Internet.free_email }
    password           { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name          { '村田' }
    first_name         { '翔吾' }
    last_name_kana     { 'ムラタ' }
    first_name_kana    { 'ショウゴ' }
    birth_date         { '1986-5-7' }
  end
end
