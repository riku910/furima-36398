FactoryBot.define do
  factory :user do
    nickname              {'tarou'}
    email                 {Faker::Internet.free_email}
    password              {'12ab34'}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end