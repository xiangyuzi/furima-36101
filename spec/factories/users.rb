FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_numeric: 1) }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_reading     { person.last.katakana }
    first_name_reading    { person.first.katakana }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
